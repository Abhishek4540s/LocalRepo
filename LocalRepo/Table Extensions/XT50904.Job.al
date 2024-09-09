tableextension 50904 JobExt extends Job
{
    fields
    {
        // modify("Ship-to Code")
        // {
        //     trigger OnAfterValidate()
        //     var
        //         JobPlanningLines: Record "Job Planning Line";
        //         ShipToAddrress: Record "Ship-to Address";
        //         Customer: Record Customer;
        //         Job_lRec: Record Job;
        //         ShipToAddress_lRec: Record "Ship-to Address";
        //         ShipToAddress_lTex: Text[100];
        //         COunter: Integer;
        //     begin
        //         if CurrFieldNo = 0 then
        //             exit;

        //         if (Rec."Ship-to Code" <> '') then begin
        //             // Rec.GetHideValidationDialog() then
        //             if (xRec."No." <> '') and (xRec."Ship-to Code" = '') then begin
        //                 if Rec."Ship-to Code" <> xRec."Ship-to Code" then begin
        //                     Job_lRec.Reset();
        //                     Job_lRec.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
        //                     Job_lRec.SetRange("Ship-to Code", Rec."Ship-to Code");
        //                     Job_lRec.SetFilter(Status, '<>%1', Job_lRec.Status::Completed);
        //                     if ShipToAddress_lRec.Get(Rec."Sell-to Customer No.", Rec."Ship-to Code") then
        //                         ShipToAddress_lTex := ShipToAddress_lRec.Name;
        //                     if Job_lRec.FindFirst() then begin
        //                         if not Confirm('Project already exist with same Customer No. %1 and Ship-To Address %2.\Do you still want to change the Ship-To Address?', false, Rec."Sell-to Customer No.", ShipToAddress_lTex) then
        //                             Error('');
        //                     end;
        //                 end;
        //             end;
        //         end;


        //         JobPlanningLines.SetRange("Job No.", "No.");
        //         if JobPlanningLines.FindSet() then begin
        //             repeat
        //                 if "Ship-to Code" = '' then begin
        //                     if Customer.Get("Bill-to Customer No.") then
        //                         JobPlanningLines."Tax Area Code" := Customer."Tax Area Code";
        //                 end else begin
        //                     if ShipToAddrress.Get("Bill-to Customer No.", "Ship-to Code") then begin
        //                         if ShipToAddrress."Tax Area Code" <> '' then begin
        //                             JobPlanningLines."Tax Area Code" := ShipToAddrress."Tax Area Code";
        //                         end else if Customer.Get("Bill-to Customer No.") then begin
        //                             JobPlanningLines."Tax Area Code" := Customer."Tax Area Code";
        //                         end;
        //                     end else if Customer.Get("Bill-to Customer No.") then
        //                             JobPlanningLines."Tax Area Code" := Customer."Tax Area Code";
        //                 end;
        //                 JobPlanningLines.Modify();
        //             until JobPlanningLines.Next() = 0;
        //         end;

        //     end;
        // }
        field(65100; "Sales Qoute No"; Code[20])
        {
            Caption = 'Sales Quote No.';
            DataClassification = ToBeClassified;
        }
        field(50001; "Procced By Poc"; Boolean)
        {
            Caption = 'Procced By Poc';
        }
        field(65101; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
        }
    }
}