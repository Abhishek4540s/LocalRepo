page 50955 "Wensoft Cost Code Details"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Wensoft Cost Code Details";
    SaveValues = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    AdditionalSearchTerms = 'WennSoft';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(WS_Job_Number; Rec.WS_Job_Number)
                {
                    ApplicationArea = all;
                }
                field(Project_Number; Rec.Project_Number)
                {
                    ApplicationArea = all;
                }
                field(Cost_Code_Number_1; Rec.Cost_Code_Number_1)
                {
                    ApplicationArea = all;
                }
                field(Cost_Code_Number_2; Rec.Cost_Code_Number_2)
                {
                    ApplicationArea = all;
                }
                field(Cost_Code_Number_3; Rec.Cost_Code_Number_3)
                {
                    ApplicationArea = all;
                }
                field(Cost_Code_Number_4; Rec.Cost_Code_Number_4)
                {
                    ApplicationArea = all;
                }
                field(Cost_Code_Alias; Rec.Cost_Code_Alias)
                {
                    ApplicationArea = all;
                }
                field(Cost_Code_Description; Rec.Cost_Code_Description)
                {
                    ApplicationArea = all;
                }
                field(Cost_Element; Rec.Cost_Element)
                {
                    ApplicationArea = all;
                }
                field(WS_Manager_ID; Rec.WS_Manager_ID)
                {
                    ApplicationArea = all;
                }
                field(WS_Inactive; Rec.WS_Inactive)
                {
                    ApplicationArea = all;
                }
                field(Profit_Type_Number; Rec.Profit_Type_Number)
                {
                    ApplicationArea = all;
                }
                field(Profit_Amount; Rec.Profit_Amount)
                {
                    ApplicationArea = all;
                }
                field(Type_of_Transaction; Rec.Type_of_Transaction)
                {
                    ApplicationArea = all;
                }
                field(Next_Subdivision_Type; Rec.Next_Subdivision_Type)
                {
                    ApplicationArea = all;
                }
                field(WS_Account_Index_1; Rec.WS_Account_Index_1)
                {
                    ApplicationArea = all;
                }
                field(WS_Account_Index_2; Rec.WS_Account_Index_2)
                {
                    ApplicationArea = all;
                }
                field(Added_By_CO_Module; Rec.Added_By_CO_Module)
                {
                    ApplicationArea = all;
                }
                field(Track_Production_Qty; Rec.Track_Production_Qty)
                {
                    ApplicationArea = all;
                }
                field(Cost_Code_Act_Cost_TTD; Rec.Cost_Code_Act_Cost_TTD)
                {
                    ApplicationArea = all;
                }
                field(Cost_Code_Act_Cost_YTD; Rec.Cost_Code_Act_Cost_YTD)
                {
                    ApplicationArea = all;
                }
                field(Actual_Units_TTD; Rec.Actual_Units_TTD)
                {
                    ApplicationArea = all;
                }
                field(Cost_Code_Estimated_Cst; Rec.Cost_Code_Estimated_Cst)
                {
                    ApplicationArea = all;
                }
                field(Change_Order_Est_Cost; Rec.Change_Order_Est_Cost)
                {
                    ApplicationArea = all;
                }
                field(Cost_Code_Rvsd_Est_Cost; Rec.Cost_Code_Rvsd_Est_Cost)
                {
                    ApplicationArea = all;
                }
                field(Cost_Code_Forecast_Cost; Rec.Cost_Code_Forecast_Cost)
                {
                    ApplicationArea = all;
                }
                field(Cost_Code_Rvsd_Forecast; Rec.Cost_Code_Rvsd_Forecast)
                {
                    ApplicationArea = all;
                }
                field(Forecasted_Units; Rec.Forecasted_Units)
                {
                    ApplicationArea = all;
                }
                field(Committed_Cost; Rec.Committed_Cost)
                {
                    ApplicationArea = all;
                }
                field(Committed_Units; Rec.Committed_Units)
                {
                    ApplicationArea = all;
                }
                field(Cost_Code_Est_Unit; Rec.Cost_Code_Est_Unit)
                {
                    ApplicationArea = all;
                }
                field(Estimated_Amt_Units; Rec.Estimated_Amt_Units)
                {
                    ApplicationArea = all;
                }
                field(Production_Estimate_Qty; Rec.Production_Estimate_Qty)
                {
                    ApplicationArea = all;
                }
                field(Production_Actual_Qty; Rec.Production_Actual_Qty)
                {
                    ApplicationArea = all;
                }
                field(Production_Qty_Unit; Rec.Production_Qty_Unit)
                {
                    ApplicationArea = all;
                }
                field(Production_Qty_Curr_Per; Rec.Production_Qty_Curr_Per)
                {
                    ApplicationArea = all;
                }
                field(Production_Best; Rec.Production_Best)
                {
                    ApplicationArea = all;
                }
                field(Production_Best_Date; Rec.Production_Best_Date)
                {
                    ApplicationArea = all;
                }
                field(Production_Measure_Code; Rec.Production_Measure_Code)
                {
                    ApplicationArea = all;
                }
                field(OVHD1_UOM; Rec.OVHD1_UOM)
                {
                    ApplicationArea = all;
                }
                field(OVHD1_Type; Rec.OVHD1_Type)
                {
                    ApplicationArea = all;
                }
                field(OVHD1_Percent; Rec.OVHD1_Percent)
                {
                    ApplicationArea = all;
                }
                field(OVHD1_Estimated_Units; Rec.OVHD1_Estimated_Units)
                {
                    ApplicationArea = all;
                }
                field(OVHD1_Actual_Units; Rec.OVHD1_Actual_Units)
                {
                    ApplicationArea = all;
                }
                field(OVHD1_Forecasted_Units; Rec.OVHD1_Forecasted_Units)
                {
                    ApplicationArea = all;
                }
                field(OVHD1_Amt_Per_Unit; Rec.OVHD1_Amt_Per_Unit)
                {
                    ApplicationArea = all;
                }
                field(OVHD1_Estimated_Amount; Rec.OVHD1_Estimated_Amount)
                {
                    ApplicationArea = all;
                }
                field(OVHD1_Actual_Amount; Rec.OVHD1_Actual_Amount)
                {
                    ApplicationArea = all;
                }
                field(OVHD1_Profit_Type; Rec.OVHD1_Profit_Type)
                {
                    ApplicationArea = all;
                }
                field(OVHD1_Profit_Amount; Rec.OVHD1_Profit_Amount)
                {
                    ApplicationArea = all;
                }
                field(OVHD2_UOM; Rec.OVHD2_UOM)
                {
                    ApplicationArea = all;
                }
                field(OVHD2_Type; Rec.OVHD2_Type)
                {
                    ApplicationArea = all;
                }
                field(OVHD2_Percent; Rec.OVHD2_Percent)
                {
                    ApplicationArea = all;
                }
                field(OVHD2_Estimated_Units; Rec.OVHD2_Estimated_Units)
                {
                    ApplicationArea = all;
                }
                field(OVHD2_Actual_Units; Rec.OVHD2_Actual_Units)
                {
                    ApplicationArea = all;
                }
                field(OVHD2_Forecasted_Units; Rec.OVHD2_Forecasted_Units)
                {
                    ApplicationArea = all;
                }
                field(OVHD2_Amt_Per_Unit; Rec.OVHD2_Amt_Per_Unit)
                {
                    ApplicationArea = all;
                }
                field(OVHD2_Estimated_Amount; Rec.OVHD2_Estimated_Amount)
                {
                    ApplicationArea = all;
                }
                field(OVHD2_Actual_Amount; Rec.OVHD2_Actual_Amount)
                {
                    ApplicationArea = all;
                }
                field(OVHD2_Profit_Type; Rec.OVHD2_Profit_Type)
                {
                    ApplicationArea = all;
                }
                field(OVHD2_Profit_Amount; Rec.OVHD2_Profit_Amount)
                {
                    ApplicationArea = all;
                }
                field(Bill_Type; Rec.Bill_Type)
                {
                    ApplicationArea = all;
                }
                field(Sched_Completion_Date; Rec.Sched_Completion_Date)
                {
                    ApplicationArea = all;
                }
                field(ACTCOMPDATE; Rec.ACTCOMPDATE)
                {
                    ApplicationArea = all;
                }
                field(Schedule_Start_Date; Rec.Schedule_Start_Date)
                {
                    ApplicationArea = all;
                }
                field(ACTSTARTDATE; Rec.ACTSTARTDATE)
                {
                    ApplicationArea = all;
                }
                field(Billing_Schedule_Line; Rec.Billing_Schedule_Line)
                {
                    ApplicationArea = all;
                }
                field(Estimated_Measure_Code; Rec.Estimated_Measure_Code)
                {
                    ApplicationArea = all;
                }
                field(Amount_Pct_Complete; Rec.Amount_Pct_Complete)
                {
                    ApplicationArea = all;
                }
                field(Units_Pct_Complete; Rec.Units_Pct_Complete)
                {
                    ApplicationArea = all;
                }
                field(Production_Pct_Complete; Rec.Production_Pct_Complete)
                {
                    ApplicationArea = all;
                }
                field(Field_Pct_Complete; Rec.Field_Pct_Complete)
                {
                    ApplicationArea = all;
                }
                field(Posted_To; Rec.Posted_To)
                {
                    ApplicationArea = all;
                }
                field(WRKRCOMP; Rec.WRKRCOMP)
                {
                    ApplicationArea = all;
                }
                field(Change_Order_Est_Units; Rec.Change_Order_Est_Units)
                {
                    ApplicationArea = all;
                }
                field(Labor_Group_Name; Rec.Labor_Group_Name)
                {
                    ApplicationArea = all;
                }
                field(USERID; Rec.USERID)
                {
                    ApplicationArea = all;
                }
                field(User_Define_1; Rec.User_Define_1)
                {
                    ApplicationArea = all;
                }
                field(User_Define_2; Rec.User_Define_2)
                {
                    ApplicationArea = all;
                }
                field(USERDEF1; Rec.USERDEF1)
                {
                    ApplicationArea = all;
                }
                field(USERDEF2; Rec.USERDEF2)
                {
                    ApplicationArea = all;
                }
                field(User_Def_Integer_1; Rec.User_Def_Integer_1)
                {
                    ApplicationArea = all;
                }
                field(User_Def_Integer_2; Rec.User_Def_Integer_2)
                {
                    ApplicationArea = all;
                }
                field(User_Defined_Integer_3; Rec.User_Defined_Integer_3)
                {
                    ApplicationArea = all;
                }
                field(User_Defined_Integer_4; Rec.User_Defined_Integer_4)
                {
                    ApplicationArea = all;
                }
                field(User_Defined_Dollar_1; Rec.User_Defined_Dollar_1)
                {
                    ApplicationArea = all;
                }
                field(User_Defined_Dollar_2; Rec.User_Defined_Dollar_2)
                {
                    ApplicationArea = all;
                }
                field(User_Defined_Dollar_3; Rec.User_Defined_Dollar_3)
                {
                    ApplicationArea = all;
                }
                field(User_Defined_Dollar_4; Rec.User_Defined_Dollar_4)
                {
                    ApplicationArea = all;
                }
                field(USRDAT01; Rec.USRDAT01)
                {
                    ApplicationArea = all;
                }
                field(USRDAT02; Rec.USRDAT02)
                {
                    ApplicationArea = all;
                }
                field(User_Defined_Date_3; Rec.User_Defined_Date_3)
                {
                    ApplicationArea = all;
                }
                field(User_Defined_Date_4; Rec.User_Defined_Date_4)
                {
                    ApplicationArea = all;
                }
                field(User_Defined_CB_1; Rec.User_Defined_CB_1)
                {
                    ApplicationArea = all;
                }
                field(User_Defined_CB_2; Rec.User_Defined_CB_2)
                {
                    ApplicationArea = all;
                }
                field(User_Defined_CB_3; Rec.User_Defined_CB_3)
                {
                    ApplicationArea = all;
                }
                field(User_Defined_CB_4; Rec.User_Defined_CB_4)
                {
                    ApplicationArea = all;
                }
                field(VNDRNMBR; Rec.VNDRNMBR)
                {
                    ApplicationArea = all;
                }
                field(ITEMNMBR; Rec.ITEMNMBR)
                {
                    ApplicationArea = all;
                }
                field(PORDNMBR; Rec.PORDNMBR)
                {
                    ApplicationArea = all;
                }
                field(CC_Rvsd_Forecast_Units; Rec.CC_Rvsd_Forecast_Units)
                {
                    ApplicationArea = all;
                }
                field(Rate_Per_Unit; Rec.Rate_Per_Unit)
                {
                    ApplicationArea = all;
                }
                field(Original_Estimate_Units; Rec.Original_Estimate_Units)
                {
                    ApplicationArea = all;
                }
                field(Original_Forecast_Units; Rec.Original_Forecast_Units)
                {
                    ApplicationArea = all;
                }
                field(Wennsoft_Affiliate; Rec.Wennsoft_Affiliate)
                {
                    ApplicationArea = all;
                }
                field(Wennsoft_Branch; Rec.Wennsoft_Branch)
                {
                    ApplicationArea = all;
                }
                field(Wennsoft_Region; Rec.Wennsoft_Region)
                {
                    ApplicationArea = all;
                }
                field(MODIFDT; Rec.MODIFDT)
                {
                    ApplicationArea = all;
                    Visible = true;
                }
                field(Modified_Time; Rec.Modified_Time)
                {
                    ApplicationArea = all;
                }
                field(MDFUSRID; Rec.MDFUSRID)
                {
                    ApplicationArea = all;
                }
                field(SV_Language_ID; Rec.SV_Language_ID)
                {
                    ApplicationArea = all;
                }
                field(Time_Zone; Rec.Time_Zone)
                {
                    ApplicationArea = all;
                }
                field(WSReserved_CB1; Rec.WSReserved_CB1)
                {
                    ApplicationArea = all;
                }
                field(WSReserved_CB2; Rec.WSReserved_CB2)
                {
                    ApplicationArea = all;
                }
                field(WSReserved_CB3; Rec.WSReserved_CB3)
                {
                    ApplicationArea = all;
                }
                field(WSReserved_CB4; Rec.WSReserved_CB4)
                {
                    ApplicationArea = all;
                }
                field(WSReserved_CB5; Rec.WSReserved_CB5)
                {
                    ApplicationArea = all;
                }
                field(WSReserved_CB6; Rec.WSReserved_CB6)
                {
                    ApplicationArea = all;
                }
                field(WSReserved_CB7; Rec.WSReserved_CB7)
                {
                    ApplicationArea = all;
                }
                field(WSReserved_CB8; Rec.WSReserved_CB8)
                {
                    ApplicationArea = all;
                }
                field(WSReserved_CB9; Rec.WSReserved_CB9)
                {
                    ApplicationArea = all;
                }
                field(WSReserved_CB10; Rec.WSReserved_CB10)
                {
                    ApplicationArea = all;
                }
                field(WSReserved_STR1; Rec.WSReserved_STR1)
                {
                    ApplicationArea = all;
                }
                field(WSReserved_STR2; Rec.WSReserved_STR2)
                {
                    ApplicationArea = all;
                }
                field(Revenue_Code; Rec.Revenue_Code)
                {
                    ApplicationArea = all;
                }
                field(DEX_ROW_ID; Rec.DEX_ROW_ID)
                {
                    ApplicationArea = all;
                    Visible = true;
                }

                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;

                }
                field("File Imported Date"; Rec."File Imported Date")
                {
                    ApplicationArea = All;

                }
                field("File Imported By"; Rec."File Imported By")
                {
                    ApplicationArea = All;

                }

            }
        }
    }


    actions
    {
        area(Processing)
        {
            action("&Import")
            {
                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import data from excel.';
                trigger OnAction()
                var
                    Import_CU: Codeunit ImportJobfiles;
                begin
                    Import_CU.ImportCostCodeDetails();
                end;
            }
        }
    }
}