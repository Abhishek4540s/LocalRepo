

pageextension 50915 "Sales Order Subform Ext" extends "Sales Order Subform"
{
    layout
    {
        modify(Type)
        {
            trigger OnAfterValidate()
            begin
                if Rec.Type = Rec.Type::"G/L Account" then
                    TempBool := true
                else
                    TempBool := false;
            end;
        }
        modify("Unit Cost (LCY)")
        {
            Visible = true;
        }
        addafter("Qty. Assigned")
        {
            field("Billing Line"; Rec."Billing Line")
            {
                ApplicationArea = all;
                Visible = true;
                Editable = TempBool;
            }
            field("Salesperson Code"; Rec."Salesperson Code")
            {
                ApplicationArea = all;
                Visible = true;
            }
        }
        addafter(Control51)
        {
            group("Margin Details")
            {
                Editable = false;
                field(TotalAmount; EstimatedPrice_gDec)
                {
                    ApplicationArea = All;
                    Caption = 'Estimated Price';
                }
                field(TotalCost; EstimatedCost_gDec)
                {
                    ApplicationArea = All;
                    Caption = 'Estimated Cost';
                }
                field(GrossMargin_gDec; GrossMargin_gDec)
                {
                    ApplicationArea = All;
                    Caption = 'Gross Margin';
                    ToolTip = 'Gross Margin (Estimated Price - Cost)';
                }
                field(Margin_gDec; Margin_gDec)
                {
                    ApplicationArea = All;
                    Caption = 'Margin %';
                }
            }

        }
    }


    trigger OnOpenPage()
    begin
        EstimatedPrice_gDec := 0;
        EstimatedCost_gDec := 0;
        GrossMargin_gDec := 0;
        Margin_gDec := 0;

    end;

    trigger OnAfterGetRecord()
    begin
        if Rec.Type = Rec.Type::"G/L Account" then
            TempBool := true
        else
            TempBool := false;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        CalculateCost(Rec);
    end;

    local procedure CalculateCost(Rec: Record "Sales Line")
    var
        Saleline_gRec: Record "Sales Line";
    begin
        EstimatedPrice_gDec := 0;
        EstimatedCost_gDec := 0;
        GrossMargin_gDec := 0;
        Margin_gDec := 0;
        Counter_gDec := 0;

        Saleline_gRec.Reset();
        Saleline_gRec.SetRange("Document Type", Rec."Document Type");
        Saleline_gRec.SetRange("Document No.", Rec."Document No.");
        if Saleline_gRec.FindSet() then
            repeat
                EstimatedCost_gDec += Saleline_gRec.Quantity * Saleline_gRec."Unit Cost (LCY)";
                if Saleline_gRec."Billing Line" then begin
                    EstimatedPrice_gDec += Saleline_gRec."Line Amount";
                    Counter_gDec += 1;
                end;
            until Saleline_gRec.Next() = 0;
        if Counter_gDec = 0 then
            EstimatedPrice_gDec := TotalSalesLine.Amount;

        GrossMargin_gDec := EstimatedPrice_gDec - EstimatedCost_gDec;
        if EstimatedPrice_gDec <> 0 then begin
            Margin_gDec := (GrossMargin_gDec * 100) / EstimatedPrice_gDec;
        end;
    end;

    var
        TempBool: Boolean;
        EstimatedCost_gDec: Decimal;
        GrossMargin_gDec: Decimal;
        Margin_gDec: Decimal;
        EstimatedPrice_gDec: Decimal;
        Counter_gDec: Decimal;

}
