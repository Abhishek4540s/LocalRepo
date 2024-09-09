page 50933 DialogCustomer
{
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Select a Customer No. and Ship-to Address for a new Job';
    ModifyAllowed = true;
    InsertAllowed = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Customer No."; "Customer No._S")
                {
                    ApplicationArea = All;
                    Editable = true;
                    TableRelation = Customer;
                }
                field("Ship-to Address"; "Ship-to Address Code_S")
                {
                    ApplicationArea = All;
                    Editable = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        ShipToAddress_gRec.Reset();
                        ShipToAddress_gRec.setrange("Customer No.", "Customer No._S");
                        Clear(ShipToAddress_gPage);
                        ShipToAddress_gPage.SetTableView(ShipToAddress_gRec);
                        ShipToAddress_gPage.lookupmode(true);
                        If ShipToAddress_gPage.Runmodal = action::lookupok then begin
                            ShipToAddress_gPage.getrecord(ShipToAddress_gRec);
                            "Ship-to Address Code_S" := ShipToAddress_gRec.code
                        End;
                    end;
                }
            }
        }
    }
    var
        "Customer No._S": Code[20];
        "Ship-to Address Code_S": Code[10];
        ShipToAddress_gRec: Record "Ship-to Address";
        ShipToAddress_gPage: page "Ship-to Address List";

    local procedure SetParameters()
    var
        myInt: Integer;
    begin

    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        SICodeUnit_lCU: Codeunit SingleInstance_CU;
        ShipToAddress_lRec: Record "Ship-to Address";
        Temp_lBool: Boolean;
    begin
        if CloseAction IN [Action::Cancel, Action::LookupCancel] then begin
            exit(true);
        end;

        if CloseAction IN [Action::OK, Action::LookupOK] then begin
            Temp_lBool := true;
            if ("Customer No._S" = '') or ("Ship-to Address Code_S" = '') then begin
                Message('Please enter the both customer number and ship-to Address');
                exit(false);
                Temp_lBool := false;
            end;
            ShipToAddress_lRec.Reset();
            if not ShipToAddress_lRec.Get("Customer No._S", "Ship-to Address Code_S") then begin
                Message('You can not enter ship-to Address manually Please selct from the lookUP');
                exit(false);
                Temp_lBool := false;
            end;
            if Temp_lBool then begin
                SICodeUnit_lCU.ClearValues();
                SICodeUnit_lCU.SetValues("Customer No._S", "Ship-to Address Code_S");
            end;
        end;
    end;
}