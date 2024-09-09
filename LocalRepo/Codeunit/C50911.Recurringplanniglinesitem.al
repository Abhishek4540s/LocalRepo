codeunit 50911 RecurrencePlanninglinesItem
{
    trigger OnRun()
    var
        PlanningLines_lRec: Record "Job Planning Line";
    begin
        PlanningLines_lRec.Reset();
        PlanningLines_lRec.SetRange(Type, PlanningLines_lRec.Type::Item);
        PlanningLines_lRec.SetFilter("Line Type", '%1|%2', PlanningLines_lRec."Line Type"::Budget, PlanningLines_lRec."Line Type"::"Both Budget and Billable");
        if PlanningLines_lRec.FindSet() then
            repeat
                if (PlanningLines_lRec."Qty. Posted" <> 0) and (PlanningLines_lRec."Remaining Qty." <> 0) then
                    CreateAdditionalline(PlanningLines_lRec);
                if (PlanningLines_lRec."Qty. Posted" = 0) and (PlanningLines_lRec."Remaining Qty." <> 0) then
                    UpdateOriginalline(PlanningLines_lRec);
            until PlanningLines_lRec.Next() = 0;
    end;

    procedure Testing(PlanningLines_lRec: Record "Job Planning Line")
    begin
        if (PlanningLines_lRec."Qty. Posted" <> 0) and (PlanningLines_lRec."Remaining Qty." <> 0) then
            CreateAdditionalline(PlanningLines_lRec);
        if (PlanningLines_lRec."Qty. Posted" = 0) and (PlanningLines_lRec."Remaining Qty." <> 0) then
            UpdateOriginalline(PlanningLines_lRec);
    end;

    procedure CreateAdditionalline(PlanningLines_lRec: Record "Job Planning Line")
    var
        Item_lRec: Record Item;
        NewLineNo_lInt: Integer;
        NewPlanningLines_lRec: Record "Job Planning Line";
    begin
        Item_lRec.Get(PlanningLines_lRec."No.");
        if (Item_lRec."Unit Cost" <> PlanningLines_lRec."Current Cost") then begin
            NewLineNo_lInt := GetLineNo(PlanningLines_lRec);
            NewPlanningLines_lRec.Init();
            NewPlanningLines_lRec.TransferFields(PlanningLines_lRec);
            NewPlanningLines_lRec.Validate("Line No.", NewLineNo_lInt);
            NewPlanningLines_lRec.Validate("Qty. Picked", 0);
            NewPlanningLines_lRec.Validate("Qty. Picked (Base)", 0);
            NewPlanningLines_lRec.Insert(true);
            NewPlanningLines_lRec.Validate("No.", PlanningLines_lRec."No.");
            NewPlanningLines_lRec.Validate("Allow modification", true);
            NewPlanningLines_lRec.Validate(Quantity, PlanningLines_lRec."Remaining Qty.");
            NewPlanningLines_lRec.Validate("Remaining Qty.", PlanningLines_lRec."Remaining Qty.");
            NewPlanningLines_lRec.Validate("Remaining Qty. (Base)", PlanningLines_lRec."Remaining Qty.");
            NewPlanningLines_lRec.validate("Current Cost", Item_lRec."Unit Cost");
            // NewPlanningLines_lRec.validate("Unit Cost", Resource_lRec."Unit Cost");
            // NewPlanningLines_lRec.validate("Unit Cost (LCY)", Resource_lRec."Unit Cost");
            NewPlanningLines_lRec.validate("Unit Price", 0);
            NewPlanningLines_lRec.validate("Unit Price (LCY)", 0);
            NewPlanningLines_lRec.validate("Current Cost Updated", true);
            NewPlanningLines_lRec.Validate("Base Line No.", PlanningLines_lRec."Line No.");
            NewPlanningLines_lRec.Validate("Qty. Posted", 0);
            NewPlanningLines_lRec.Modify(true);
            //
            PlanningLines_lRec.Validate("Allow modification", true);
            PlanningLines_lRec.Validate(Quantity, PlanningLines_lRec."Qty. Posted");
            PlanningLines_lRec."Total Current Cost" := PlanningLines_lRec.Quantity * PlanningLines_lRec."Current Cost";
            PlanningLines_lRec.Validate("Unit Cost", PlanningLines_lRec."Current Cost");
            PlanningLines_lRec.Validate("Unit Cost (LCY)", PlanningLines_lRec."Current Cost");
            PlanningLines_lRec.Validate("Current Cost Updated", false);
            PlanningLines_lRec.Validate("Remaining Qty.", 0);
            PlanningLines_lRec.Validate("Unit Price", 0);
            PlanningLines_lRec.Validate("Unit Price (LCY)", 0);
            PlanningLines_lRec.Modify(true);
        end;
    end;



    local procedure UpdateOriginalline(PlanningLines_lRec: Record "Job Planning Line")
    var
        Item_lRec: Record Item;
    begin
        Item_lRec.Get(PlanningLines_lRec."No.");
        if (Item_lRec."Unit Cost" <> PlanningLines_lRec."Current Cost") then begin
            PlanningLines_lRec.Validate("No.", PlanningLines_lRec."No.");
            PlanningLines_lRec.Validate("Allow modification", true);
            PlanningLines_lRec.validate("Current Cost", Item_lRec."Unit Cost");
            PlanningLines_lRec.validate("Unit Cost", Item_lRec."Unit Cost");
            PlanningLines_lRec.validate("Unit Cost (LCY)", Item_lRec."Unit Cost");
            PlanningLines_lRec.Validate("Unit Price", 0);
            PlanningLines_lRec.Validate("Unit Price (LCY)", 0);
            PlanningLines_lRec.validate("Current Cost Updated", true);
            PlanningLines_lRec.Validate("Base Line No.", PlanningLines_lRec."Line No.");
            PlanningLines_lRec.Validate("Qty. Posted", 0);
            PlanningLines_lRec.Modify(true);
        end;
    end;

    local procedure GetLineNo(PlanningLines_lRec: Record "Job Planning Line"): Integer
    var
        PlanningLines1_lRec: Record "Job Planning Line";
        LineNo_lInt: Integer;
    begin
        PlanningLines1_lRec.Reset();
        PlanningLines1_lRec.SetRange("Job No.", PlanningLines_lRec."Job No.");
        PlanningLines1_lRec.SetRange("Job Task No.", PlanningLines_lRec."Job Task No.");
        PlanningLines1_lRec.SetFilter("Line No.", '%1..', PlanningLines_lRec."Line No.");
        if PlanningLines1_lRec.FindSet() then begin
            if PlanningLines1_lRec.Count = 1 then begin
                LineNo_lInt := PlanningLines_lRec."Line No." + 10000;
                exit(LineNo_lInt);
            end
            else begin
                repeat
                    if (PlanningLines_lRec."Line No." <> PlanningLines1_lRec."Line No.") then begin
                        LineNo_lInt := (PlanningLines_lRec."Line No." + PlanningLines1_lRec."Line No.") div 2;
                        if (LineNo_lInt mod 2) <> 0 then
                            LineNo_lInt += 1;
                        exit(LineNo_lInt);
                        break;
                    end;
                until PlanningLines1_lRec.Next() = 0;
            end;
        end;
    end;
}
