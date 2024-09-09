pageextension 50906 JobCardExtension extends "Job Card"

{
    layout
    {
        addafter("No. of Archived Versions")
        {
            field("Sales Qoute No"; Rec."Sales Qoute No")
            {
                ApplicationArea = all;
                Visible = true;
                Editable = false;
            }
            field("Salesperson Code"; Rec."Salesperson Code")
            {
                ApplicationArea = all;
                Visible = true;
            }
            field(SystemCreatedBy; User_gRec."User Name")
            {
                Caption = 'Created By';

                ApplicationArea = all;
                Visible = true;
                Editable = false;
            }
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'Created At';
                ApplicationArea = all;
                Visible = true;
                Editable = false;
            }
            field(SystemModifiedBy; User_gRec1."User Name")
            {
                Caption = 'Modified By';
                ApplicationArea = all;
                Visible = true;
                Editable = false;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'Modified At';
                ApplicationArea = all;
                Visible = true;
                Editable = false;
            }
        }
        addbefore(Posting)
        {
            group("Project Margin")
            {
                field(TotalBillablePrice_gDec; TotalBillablePrice_gDec)
                {
                    Caption = 'Billable Total Price';
                    ApplicationArea = all;
                    Editable = false;
                }

                field(TotalBudgetCost_gDec; TotalBudgetCost_gDec)
                {
                    Caption = 'Budgeted Total Cost';
                    ApplicationArea = all;
                    Editable = false;
                }
                field(BillableMargin_gDec; BillableMargin_gDec)
                {
                    Caption = 'Project Margin';
                    ApplicationArea = all;
                    Editable = false;
                    ToolTip = 'Billable Total Price - Budgeted Total Cost';
                }
                field(Margin_gDec; Margin_gDec)
                {
                    Caption = 'Margin%';
                    ApplicationArea = all;
                    Editable = false;
                    ToolTip = '(Project Margin * 100) / Billable Total Price';
                }

            }
        }
        addafter("Location Code")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                // CaptionClass = '1,2,1';
                ApplicationArea = all;
            }
        }
        addlast("Invoice and Shipping")
        {
            field("Customer Disc. Group"; Rec."Customer Disc. Group")
            {
                // CaptionClass = '1,2,1';
                ApplicationArea = all;
            }
            field("Customer Price Group"; Rec."Customer Price Group")
            {
                // CaptionClass = '1,2,1';
                ApplicationArea = all;
            }

            field(Reserve; Rec.Reserve)
            {
                // CaptionClass = '1,2,1';
                ApplicationArea = all;
            }
            // field("Language Code"; Rec."Language Code")
            // {
            //     // CaptionClass = '1,2,1';
            //     ApplicationArea = all;
            // }
        }
        modify(ShippingOptions)
        {
            trigger OnAfterValidate()
            begin
                // Rec.Validate("Ship-to Code");
            end;
        }
        // modify(JobTaskLines)
        // {
        //     Enabled = IsTaskLinesEditable_gBool;

        // }
    }
    actions
    {
        addafter("Res. Gr. All&ocated per Job")
        {
            action("Update Project Margin")
            {
                ApplicationArea = All;
                Caption = 'Update Project Margin';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    JobTask_lPage: Page "Job Task Lines Subform";
                begin
                    CalculateMargins(Rec);
                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    // var
    //     Dialog_lPage: Page DialogCustomer;
    //     TempCustNo: Code[20];
    //     TempShipToAddressCode: Code[10];
    //     Job_lRec: Record Job;
    //     Job_lRec1: Record Job;
    //     // NoSeriesMGT_CU: Codeunit NoSeriesManagement; 
    //     ShipToAddress_lRec: Record "Ship-to Address";
    //     NoSeries_CU: Codeunit "No. Series";
    //     JoBSetup_lRec: Record "Jobs Setup";
    //     NextNumber: Code[20];
    //     DialgStatus: Option Ok,Cancel;
    //     ShipToAddress_lTex: Text[100];
    //     Customer_lRec: Record Customer;
    // begin
    //     JoBSetup_lRec.Get();
    //     if not JoBSetup_lRec."Restrict Duplicate Project" then
    //         exit;
    //     if Dialog_lPage.RunModal() = Action::OK then begin
    //         TempCustNo := SICodeUnit_gCU.GetCustomerNo();
    //         TempShipToAddressCode := SICodeUnit_gCU.GetShipToAddress();
    //         Customer_lRec.Get(TempCustNo);
    //         if Customer_lRec."Is Generic Customer" then
    //             Error('You cannot create project using generic customer, Kindly use customer.');
    //         if ShipToAddress_lRec.Get(TempCustNo, TempShipToAddressCode) then
    //             ShipToAddress_lTex := ShipToAddress_lRec.Name;
    //         If (TempCustNo <> '') AND (TempShipToAddressCode <> '') then begin
    //             Job_lRec.Reset();
    //             Job_lRec.SetRange("Sell-to Customer No.", TempCustNo);
    //             Job_lRec.SetRange("Ship-to Code", TempShipToAddressCode);
    //             Job_lRec.SetFilter(Status, '<>%1', Job_lRec.Status::Completed);
    //             if Job_lRec.FindFirst() then begin
    //                 if Confirm('Project already exist with same Customer No. %1 and Ship-To Code %2. \Do you still want to create new project?', false, TempCustNo, TempShipToAddressCode) then begin
    //                     NextNumber := NoSeries_CU.GetNextNo(JoBSetup_lRec."Job Nos.", WorkDate(), true);
    //                     Rec.Validate("No.", NextNumber);

    //                     // Rec.Validate("Sell-to Phone No.", contact_lRec."Phone No.");
    //                 end
    //                 else
    //                     Error('');
    //             end;
    //         end;
    //     end
    //     else
    //         Error('');
    // end;

    begin
        if Rec."No." = '' then
            NewMode := true;
        Rec.CalcJobTaskLinesEditable()
    end;


    trigger OnOpenPage()
    begin
        SICodeUnit_gCU.ClearValues();
        CalculateMargins(Rec);
    end;

    trigger OnAfterGetRecord()

    begin
        if User_gRec.Get(Rec.SystemCreatedBy) then;
        if User_gRec1.Get(Rec.SystemModifiedBy) then;
    end;



    trigger OnAfterGetCurrRecord()
    // var
    //     Customer_lRec: Record Customer;
    //     contact_lRec: Record Contact;
    //     jobPage: page "Job Card";
    //     Temp_lVar: Code[20];
    // begin

    //     Message('Curr');
    //     If (SICodeUnit_gCU.GetCustomerNo() <> '') AND ((SICodeUnit_gCU.GetCustomerNo() <> Rec."Bill-to Customer No.") AND (Rec."Bill-to Customer No." = '')) then begin
    //         // Rec.Validate("Salesperson Code", Customer_lRec."Salesperson Code");
    //         Rec.SetHideValidationDialog(true);
    //         Rec.Validate("Sell-to Customer No.", SICodeUnit_gCU.GetCustomerNo());
    //         Rec.Validate("Ship-to Code", SICodeUnit_gCU.GetShipToAddress());
    //         Rec.SetHideValidationDialog(false);
    //         CurrPage.Update(true);
    //         if Customer_lRec.Get(SICodeUnit_gCU.GetCustomerNo()) then begin
    //             Rec.Validate("Salesperson Code", Customer_lRec."Salesperson Code");
    //             Rec.Validate("Price Calculation Method", Customer_lRec."Price Calculation Method");
    //             Rec.Validate(Reserve, Customer_lRec.Reserve);
    //             Rec.Validate("Location Code", Customer_lRec."Location Code");
    //             Rec."Currency Code" := Customer_lRec."Currency Code";
    //             if contact_lRec.Get(Customer_lRec."Primary Contact No.") then begin
    //                 Rec.Validate("Sell-to Contact No.", contact_lRec."No.");
    //                 // Rec.Validate("Sell-to Contact");
    //                 CurrPage.SellToContact.Get(contact_lRec."No.");
    //                 // Rec.Validate("Sell-to Phone No.", contact_lRec."Phone No.");
    //                 // Rec.Validate("sell-to " , contact_lRec."Phone No.");
    //                 Rec.Validate("Sell-to E-Mail", contact_lRec."E-Mail");
    //             end;
    //         end;
    //         CurrPage.ShipToOptions := CurrPage.ShipToOptions::"Alternate Shipping Address";
    //         // CurrPage.Update();
    //         CurrPage.SaveRecord();
    //     end;
    // end;
    begin
        OnAfterGetCurrRecordFunc();
    end;



    local procedure CalculateMargins(JobRec: Record Job)
    var
        JobPlanning_lRec: Record "Job Planning Line";

    begin
        TotalBudgetPrice_gDec := 0;
        TotalBudgetCost_gDec := 0;
        TotalBillablePrice_gDec := 0;
        TotalBillableCost_gDec := 0;
        BillableMargin_gDec := 0;
        JobPlanning_lRec.Reset();
        JobPlanning_lRec.SetRange("Job No.", JobRec."No.");
        if JobPlanning_lRec.FindSet() then begin
            repeat
                if JobPlanning_lRec."Line Type" = JobPlanning_lRec."Line Type"::Budget then begin
                    TotalBudgetPrice_gDec += JobPlanning_lRec."Total Price";
                    TotalBudgetCost_gDec += JobPlanning_lRec."Total Cost (LCY)";
                end;
                if (JobPlanning_lRec."Line Type" = JobPlanning_lRec."Line Type"::Billable) or (JobPlanning_lRec."Line Type" = JobPlanning_lRec."Line Type"::"Both Budget and Billable") then begin
                    TotalBillablePrice_gDec += JobPlanning_lRec."Line Amount (LCY)";
                    TotalBillableCost_gDec += JobPlanning_lRec."Total Current Cost";
                end;
            until JobPlanning_lRec.Next() = 0;
            BillableMargin_gDec := TotalBillablePrice_gDec - TotalBudgetCost_gDec;
            if TotalBillablePrice_gDec <> 0 then
                Margin_gDec := (BillableMargin_gDec * 100) / TotalBillablePrice_gDec;
        end;
    end;

    local procedure CreateFromDialoagPage()
    var
        Dialog_lPage: Page DialogCustomer;
        TempCustNo: Code[20];
        TempShipToAddressCode: Code[10];
        Job_lRec: Record Job;
        // NoSeriesMGT_CU: Codeunit NoSeriesManagement; 
        ShipToAddress_lRec: Record "Ship-to Address";
        NoSeries_CU: Codeunit "No. Series";
        JoBSetup_lRec: Record "Jobs Setup";
        NextNumber: Code[20];
        DialgStatus: Option Ok,Cancel;
        ShipToAddress_lTex: Text[100];
        Customer_lRec: Record Customer;
        Customer_lRec1: Record Customer;
        contact_lRec: Record Contact;
    begin
        JoBSetup_lRec.Get();
        if not JoBSetup_lRec."Restrict Duplicate Project" then
            exit;
        if Dialog_lPage.RunModal() = Action::OK then begin
            // Dialog_lPage.GetParameter(TempCustNo,TempShipToAddressCode)
            TempCustNo := SICodeUnit_gCU.GetCustomerNo();
            TempShipToAddressCode := SICodeUnit_gCU.GetShipToAddress();
            Customer_lRec.Get(TempCustNo);
            if Customer_lRec."Is Generic Customer" then
                Error('You cannot create project using generic customer, Kindly use customer.');
            if ShipToAddress_lRec.Get(TempCustNo, TempShipToAddressCode) then
                ShipToAddress_lTex := ShipToAddress_lRec.Name;
            If (TempCustNo <> '') AND (TempShipToAddressCode <> '') then begin
                Job_lRec.Reset();
                Job_lRec.SetRange("Sell-to Customer No.", TempCustNo);
                Job_lRec.SetRange("Ship-to Code", TempShipToAddressCode);
                Job_lRec.SetFilter(Status, '<>%1', Job_lRec.Status::Completed);
                if Job_lRec.FindFirst() then begin
                    if Confirm('Project already exist with same Customer No. %1 and Ship-To Code %2. \Do you still want to create new project?', false, TempCustNo, TempShipToAddressCode) then begin
                        NextNumber := NoSeries_CU.GetNextNo(JoBSetup_lRec."Job Nos.", WorkDate(), true);
                        // Rec.Validate("No.", NextNumber);
                        Job_lRec1.Init();
                        Job_lRec1.Validate("No.", NextNumber);
                        Job_lRec1.Insert(true);
                        Job_lRec1.SetHideValidationDialog(true);
                        Job_lRec1.Validate("Sell-to Customer No.", SICodeUnit_gCU.GetCustomerNo());
                        Job_lRec1.Validate("Ship-to Code", SICodeUnit_gCU.GetShipToAddress());
                        Job_lRec1.SetHideValidationDialog(false);
                        // CurrPage.Update(true);
                        if Customer_lRec1.Get(SICodeUnit_gCU.GetCustomerNo()) then begin
                            Job_lRec1.Validate("Salesperson Code", Customer_lRec1."Salesperson Code");
                            Job_lRec1.Validate("Price Calculation Method", Customer_lRec1."Price Calculation Method");
                            Job_lRec1.Validate(Reserve, Customer_lRec1.Reserve);
                            Job_lRec1.Validate("Location Code", Customer_lRec1."Location Code");
                            Job_lRec1."Currency Code" := Customer_lRec1."Currency Code";
                            if contact_lRec.Get(Customer_lRec1."Primary Contact No.") then begin
                                Job_lRec1.Validate("Sell-to Contact No.", contact_lRec."No.");
                                // Rec.Validate("Sell-to Contact");
                                // CurrPage.SellToContact.Get(contact_lRec."No.");
                                // Rec.Validate("Sell-to Phone No.", contact_lRec."Phone No.");
                                // Rec.Validate("sell-to " , contact_lRec."Phone No.");
                                Job_lRec1.Validate("Sell-to E-Mail", contact_lRec."E-Mail");
                            end;
                        end;
                        Job_lRec1.Modify(true)
                    end
                    else
                        Error('');
                end;
            end;
        end
        else
            Error('');
    end;

    local procedure OnAfterGetCurrRecordFunc()
    begin
        if not NewMode then
            exit;

        CreateFromDialoagPage();
        NewMode := false;
        SICodeUnit_gCU.SetNewlyCreatedJob(Job_lRec1."No.");
        if Job_lRec1."Sell-to Contact No." <> '' then
            CurrPage.SellToContact.Get(Job_lRec1."Sell-to Contact No.");
        CurrPage.ShipToOptions := CurrPage.ShipToOptions::"Alternate Shipping Address";
        CurrPage.Close();

    end;


    var
        SICodeUnit_gCU: Codeunit SingleInstance_CU;

        TotalBudgetPrice_gDec: Decimal;
        TotalBudgetCost_gDec: Decimal;
        TotalBillablePrice_gDec: Decimal;
        TotalBillableCost_gDec: Decimal;
        BillableMargin_gDec: Decimal;
        User_gRec: Record User;
        User_gRec1: Record User;

        Margin_gDec: Decimal;
        NewMode: Boolean;
        Job_lRec1: Record Job;
        IsTaskLinesEditable_gBool: Boolean;



}