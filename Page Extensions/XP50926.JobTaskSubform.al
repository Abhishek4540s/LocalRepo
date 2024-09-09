// pageextension 50926 JobTaskExt extends "Job Task Lines Subform"
// {
//     layout
//     {
//         addafter(Control1)
//         {
//             group("Project Margin")
//             {
//                 field(TotalBudgetPrice_gDec; TotalBudgetPrice_gDec)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field(TotalBudgetCost_gDec; TotalBudgetCost_gDec)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field(TotalBillablePrice_gDec; TotalBillablePrice_gDec)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field(TotalBillableCost_gDec; TotalBillableCost_gDec)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field(BillableMargin_gDec; BillableMargin_gDec)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }


//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     begin
//         CalculateMargins(Rec);
//     end;

//     local procedure CalculateMargins(TaskRec: Record "Job Task")
//     var
//         JobPlanning_lRec: Record "Job Planning Line";
//     begin
//         TotalBudgetPrice_gDec := 0;
//         TotalBudgetCost_gDec := 0;
//         TotalBillablePrice_gDec := 0;
//         TotalBillableCost_gDec := 0;
//         BillableMargin_gDec := 0;
//         JobPlanning_lRec.Reset();
//         JobPlanning_lRec.SetRange("Job No.", TaskRec."Job No.");
//         if JobPlanning_lRec.FindSet() then begin
//             repeat
//                 if JobPlanning_lRec."Line Type" = JobPlanning_lRec."Line Type"::Budget then begin
//                     TotalBudgetPrice_gDec += JobPlanning_lRec."Total Price";
//                     TotalBudgetCost_gDec += JobPlanning_lRec."Total Current Cost";
//                 end;
//                 if (JobPlanning_lRec."Line Type" = JobPlanning_lRec."Line Type"::Billable) or (JobPlanning_lRec."Line Type" = JobPlanning_lRec."Line Type"::"Both Budget and Billable") then begin
//                     TotalBillablePrice_gDec += JobPlanning_lRec."Total Price";
//                     TotalBillableCost_gDec += JobPlanning_lRec."Total Current Cost";
//                 end;
//             until JobPlanning_lRec.Next() = 0;
//             BillableMargin_gDec := TotalBillablePrice_gDec - TotalBillableCost_gDec;
//         end;
//     end;


//     var
//         TotalBudgetPrice_gDec: Decimal;
//         TotalBudgetCost_gDec: Decimal;
//         TotalBillablePrice_gDec: Decimal;
//         TotalBillableCost_gDec: Decimal;
//         BillableMargin_gDec: Decimal;

// }