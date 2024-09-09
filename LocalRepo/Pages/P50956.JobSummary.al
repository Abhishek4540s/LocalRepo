page 50956 "Wennsoft Job Summary"
{

    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Wennsoft Job Summary";
    SaveValues = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    AdditionalSearchTerms = 'WennSoft';


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(WS_Job_Number; Rec.WS_Job_Number)
                {

                    ApplicationArea = All;

                }
                field(PERIODID; Rec.PERIODID)
                {
                    ApplicationArea = All;

                }
                field(YEAR1; Rec.YEAR1)
                {
                    ApplicationArea = All;

                }
                field(Project_Number; Rec.Project_Number)
                {
                    ApplicationArea = All;

                }


                field(WS_Job_Name; Rec.WS_Job_Name)
                {
                    ApplicationArea = All;

                }
                field(Divisions; Rec.Divisions)
                {
                    ApplicationArea = All;

                }
                field(CUSTNMBR; Rec.CUSTNMBR)
                {
                    ApplicationArea = All;

                }
                field(JC_Contract_Number; Rec.JC_Contract_Number)
                {
                    ApplicationArea = All;

                }
                field(Contract_Type; Rec.Contract_Type)
                {
                    ApplicationArea = All;

                }
                field(WS_Billing_Type; Rec.WS_Billing_Type)
                {
                    ApplicationArea = All;

                }
                field(Contract_to_Date; Rec.Contract_to_Date)
                {
                    ApplicationArea = All;

                }
                field(Retention_Pct; Rec.Retention_Pct)
                {
                    ApplicationArea = All;

                }
                field(Actual_Units_TTD; Rec.Actual_Units_TTD)
                {
                    ApplicationArea = All;

                }
                field(Act_Labor_Cost_TTD; Rec.Act_Labor_Cost_TTD)
                {
                    ApplicationArea = All;

                }
                field(Act_Materials_Cost_TTD; Rec.Act_Materials_Cost_TTD)
                {
                    ApplicationArea = All;

                }
                field(Act_Equipment_Cost_TTD; Rec.Act_Equipment_Cost_TTD)
                {
                    ApplicationArea = All;

                }
                field(Act_Subs_Cost_TTD; Rec.Act_Subs_Cost_TTD)
                {
                    ApplicationArea = All;

                }
                field(Act_Misc_Other_Cost_TTD; Rec.Act_Misc_Other_Cost_TTD)
                {
                    ApplicationArea = All;


                }
                field(Act_Cost_TTD_UserDef1; Rec.Act_Cost_TTD_UserDef1)
                {
                    ApplicationArea = All;


                }
                field(Act_Cost_TTD_UserDef2; Rec.Act_Cost_TTD_UserDef2)
                {
                    ApplicationArea = All;


                }
                field(Act_Cost_TTD_UserDef3; Rec.Act_Cost_TTD_UserDef3)
                {
                    ApplicationArea = All;


                }
                field(Act_Cost_TTD_UserDef4; Rec.Act_Cost_TTD_UserDef4)
                {
                    ApplicationArea = All;


                }
                field(Total_Actual_Cost; Rec.Total_Actual_Cost)
                {
                    ApplicationArea = All;


                }
                field(Orig_Contract_Amount; Rec.Orig_Contract_Amount)
                {
                    ApplicationArea = All;


                }
                field(Contract_Earned; Rec.Contract_Earned)
                {
                    ApplicationArea = All;


                }
                field(Contract_Earned_Curr_Mo; Rec.Contract_Earned_Curr_Mo)
                {
                    ApplicationArea = All;


                }
                field(Billed_Labor_TTD_Mkup; Rec.Billed_Labor_TTD_Mkup)
                {
                    ApplicationArea = All;


                }
                field(Billed_Mat_Cst_TTD_Mkup; Rec.Billed_Mat_Cst_TTD_Mkup)
                {
                    ApplicationArea = All;


                }
                field(Billed_EquipTTD_Mkup; Rec.Billed_EquipTTD_Mkup)
                {
                    ApplicationArea = All;


                }
                field(Billed_Subs_TTD_Mkup; Rec.Billed_Subs_TTD_Mkup)
                {
                    ApplicationArea = All;


                }
                field(Billed_Other_TTD_Mkup; Rec.Billed_Other_TTD_Mkup)
                {
                    ApplicationArea = All;


                }
                field(Billed_UsrDef1_TTD_Mkup; Rec.Billed_UsrDef1_TTD_Mkup)
                {
                    ApplicationArea = All;


                }
                field(Billed_UsrDef2_TTD_Mkup; Rec.Billed_UsrDef2_TTD_Mkup)
                {
                    ApplicationArea = All;


                }
                field(Billed_UsrDef3_TTD_Mkup; Rec.Billed_UsrDef3_TTD_Mkup)
                {
                    ApplicationArea = All;


                }
                field(Billed_UsrDef4_TTD_Mkup; Rec.Billed_UsrDef4_TTD_Mkup)
                {
                    ApplicationArea = All;


                }
                field(Billed_Amount_TTD; Rec.Billed_Amount_TTD)
                {
                    ApplicationArea = All;


                }
                field(Retention_Amount_TTD; Rec.Retention_Amount_TTD)
                {
                    ApplicationArea = All;


                }
                field(Retention_Billed_TTD; Rec.Retention_Billed_TTD)
                {
                    ApplicationArea = All;


                }
                field(Net_Billed_TTD; Rec.Net_Billed_TTD)
                {
                    ApplicationArea = All;


                }
                field(Cash_Received_TTD; Rec.Cash_Received_TTD)
                {
                    ApplicationArea = All;


                }
                field(MSCTXAMT; Rec.MSCTXAMT)
                {
                    ApplicationArea = All;


                }
                field(TAXAMNT; Rec.TAXAMNT)
                {
                    ApplicationArea = All;


                }
                field(DISCAMNT; Rec.DISCAMNT)
                {
                    ApplicationArea = All;


                }
                field(WROFAMNT; Rec.WROFAMNT)
                {
                    ApplicationArea = All;


                }
                field(Last_Billing_Date; Rec.Last_Billing_Date)
                {
                    ApplicationArea = All;


                }
                field(Expected_Contract; Rec.Expected_Contract)
                {
                    ApplicationArea = All;


                }
                field(Committed_Equipment_TTD; Rec.Committed_Equipment_TTD)
                {
                    ApplicationArea = All;


                }
                field(Committed_Materials_TTD; Rec.Committed_Materials_TTD)
                {
                    ApplicationArea = All;


                }
                field(Committed_Labor_TTD; Rec.Committed_Labor_TTD)
                {
                    ApplicationArea = All;


                }
                field(Committed_Subs_TTD; Rec.Committed_Subs_TTD)
                {
                    ApplicationArea = All;


                }
                field(Committed_Other_TTD; Rec.Committed_Other_TTD)
                {
                    ApplicationArea = All;


                }
                field(Committed_TTD_UserDef1; Rec.Committed_TTD_UserDef1)
                {
                    ApplicationArea = All;


                }
                field(Committed_TTD_UserDef2; Rec.Committed_TTD_UserDef2)
                {
                    ApplicationArea = All;


                }
                field(Committed_TTD_UserDef3; Rec.Committed_TTD_UserDef3)
                {
                    ApplicationArea = All;


                }
                field(Committed_TTD_UserDef4; Rec.Committed_TTD_UserDef4)
                {
                    ApplicationArea = All;


                }
                field(Committed_Cost; Rec.Committed_Cost)
                {
                    ApplicationArea = All;


                }
                field(Revsd_Equip_Forecasted; Rec.Revsd_Equip_Forecasted)
                {
                    ApplicationArea = All;


                }
                field(Revsd_Labor_Forecasted; Rec.Revsd_Labor_Forecasted)
                {
                    ApplicationArea = All;


                }
                field(Revsd_Materials_Forecst; Rec.Revsd_Materials_Forecst)
                {
                    ApplicationArea = All;


                }
                field(Revsd_Subs_Forecast_Cst; Rec.Revsd_Subs_Forecast_Cst)
                {
                    ApplicationArea = All;


                }
                field(Revsd_Other_Forecst_Cst; Rec.Revsd_Other_Forecst_Cst)
                {
                    ApplicationArea = All;


                }
                field(Revsd_Forecast_UserDef1; Rec.Revsd_Forecast_UserDef1)
                {
                    ApplicationArea = All;


                }
                field(Revsd_Forecast_UserDef2; Rec.Revsd_Forecast_UserDef2)
                {
                    ApplicationArea = All;


                }
                field(Revsd_Forecast_UserDef3; Rec.Revsd_Forecast_UserDef3)
                {
                    ApplicationArea = All;


                }
                field(Revsd_Forecast_UserDef4; Rec.Revsd_Forecast_UserDef4)
                {
                    ApplicationArea = All;


                }
                field(Tot_Revsd_Forecast_Cost; Rec.Tot_Revsd_Forecast_Cost)
                {
                    ApplicationArea = All;


                }
                field(Confirmed_Chg_Order_Amt; Rec.Confirmed_Chg_Order_Amt)
                {
                    ApplicationArea = All;


                }
                field(In_Process_Chg_Ord_Amt; Rec.In_Process_Chg_Ord_Amt)
                {
                    ApplicationArea = All;


                }
                field(CO_Amount_UserDef1; Rec.CO_Amount_UserDef1)
                {
                    ApplicationArea = All;


                }
                field(CO_Amount_UserDef2; Rec.CO_Amount_UserDef2)
                {
                    ApplicationArea = All;


                }
                field(CO_Amount_UserDef3; Rec.CO_Amount_UserDef3)
                {
                    ApplicationArea = All;


                }
                field(Est_Labor_Units_TTD; Rec.Est_Labor_Units_TTD)
                {
                    ApplicationArea = All;


                }
                field(Act_Labor_Units_TTD; Rec.Act_Labor_Units_TTD)
                {
                    ApplicationArea = All;


                }
                field(Total_Act_Plus_Markup; Rec.Total_Act_Plus_Markup)
                {
                    ApplicationArea = All;


                }
                field(Revsd_Forecast_Lab_Units; Rec.Revsd_Forecast_Lab_Units)
                {
                    ApplicationArea = All;


                }
                field(User_Define_1; Rec.User_Define_1)
                {
                    ApplicationArea = All;


                }
                field(User_Define_2; Rec.User_Define_2)
                {
                    ApplicationArea = All;


                }
                field(USERDEF1; Rec.USERDEF1)
                {
                    ApplicationArea = All;


                }
                field(USERDEF2; Rec.USERDEF2)
                {
                    ApplicationArea = All;


                }
                field(User_Def_Integer_1; Rec.User_Def_Integer_1)
                {
                    ApplicationArea = All;


                }
                field(User_Def_Integer_2; Rec.User_Def_Integer_2)
                {
                    ApplicationArea = All;
                }
                field(User_Defined_Integer_3; Rec.User_Defined_Integer_3)
                {
                    ApplicationArea = All;
                }
                field(User_Defined_Integer_4; Rec.User_Defined_Integer_4)
                {
                    ApplicationArea = All;
                }
                field(User_Defined_Dollar_1; Rec.User_Defined_Dollar_1)
                {
                    ApplicationArea = All;
                }
                field(User_Defined_Dollar_2; Rec.User_Defined_Dollar_2)
                {
                    ApplicationArea = All;
                }
                field(User_Defined_Dollar_3; Rec.User_Defined_Dollar_3)
                {
                    ApplicationArea = All;
                }
                field(User_Defined_Dollar_4; Rec.User_Defined_Dollar_4)
                {
                    ApplicationArea = All;
                }
                field(USRDAT01; Rec.USRDAT01)
                {
                    ApplicationArea = All;
                }
                field(USRDAT02; Rec.USRDAT02)
                {
                    ApplicationArea = All;
                }
                field(User_Defined_Date_3; Rec.User_Defined_Date_3)
                {
                    ApplicationArea = All;
                }
                field(User_Defined_Date_4; Rec.User_Defined_Date_4)
                {
                    ApplicationArea = All;
                }
                field(User_Defined_CB_1; Rec.User_Defined_CB_1)
                {
                    ApplicationArea = All;
                }
                field(User_Defined_CB_2; Rec.User_Defined_CB_2)
                {
                    ApplicationArea = All;
                }
                field(User_Defined_CB_3; Rec.User_Defined_CB_3)
                {
                    ApplicationArea = All;
                }
                field(User_Defined_CB_4; Rec.User_Defined_CB_4)
                {
                    ApplicationArea = All;
                }
                field(Wennsoft_Affiliate; Rec.Wennsoft_Affiliate)
                {
                    ApplicationArea = All;
                }
                field(Wennsoft_Branch; Rec.Wennsoft_Branch)
                {
                    ApplicationArea = All;
                }
                field(Wennsoft_Region; Rec.Wennsoft_Region)
                {
                    ApplicationArea = All;
                }
                field(MODIFDT; Rec.MODIFDT)
                {
                    ApplicationArea = All;
                }
                field(Modified_Time; Rec.Modified_Time)
                {
                    ApplicationArea = All;
                }
                field(MDFUSRID; Rec.MDFUSRID)
                {
                    ApplicationArea = All;
                }
                field(SV_Language_ID; Rec.SV_Language_ID)
                {
                    ApplicationArea = All;
                }
                field(Time_Zone; Rec.Time_Zone)
                {
                    ApplicationArea = All;
                }
                field(Technician_ID; Rec.Technician_ID)
                {
                    ApplicationArea = All;
                }
                field(Technician_Team; Rec.Technician_Team)
                {
                    ApplicationArea = All;
                }
                field(DEX_ROW_ID; Rec.DEX_ROW_ID)
                {
                    ApplicationArea = All;
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
                    Import_CU.ImportJobSummary();
                end;
            }
        }
    }


}