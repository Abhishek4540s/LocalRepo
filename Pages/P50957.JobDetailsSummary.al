page 50957 "WennSoft JC Job Detail Summary"
{

    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "JC_Job_Detail_Summary";
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
                field(Project_Number; Rec.Project_Number)
                {
                    ApplicationArea = All;

                }
                field(YEAR1; Rec.YEAR1)
                {
                    ApplicationArea = All;

                }
                field(PERIODID; Rec.PERIODID)
                {
                    ApplicationArea = All;

                }
                field(Cost_Code_Number_1; Rec.Cost_Code_Number_1)
                {
                    ApplicationArea = All;

                }
                field(Cost_Code_Number_2; Rec.Cost_Code_Number_2)
                {
                    ApplicationArea = All;

                }
                field(Cost_Code_Number_3; Rec.Cost_Code_Number_3)
                {
                    ApplicationArea = All;

                }
                field(Cost_Code_Number_4; Rec.Cost_Code_Number_4)
                {
                    ApplicationArea = All;

                }
                field(Cost_Element; Rec.Cost_Element)
                {
                    ApplicationArea = All;

                }
                field(Cost_Code_Actual_Cost; Rec.Cost_Code_Actual_Cost)
                {
                    ApplicationArea = All;

                }
                field(Actual_Units_TTD; Rec.Actual_Units_TTD)
                {
                    ApplicationArea = All;

                }
                field(Cost_Code_Actual_Mkp_Cst; Rec.Cost_Code_Actual_Mkp_Cst)
                {
                    ApplicationArea = All;

                }
                field(Revsd_Forecast_Cost; Rec.Revsd_Forecast_Cost)
                {
                    ApplicationArea = All;

                }
                field(Revsd_Forecast_Units; Rec.Revsd_Forecast_Units)
                {
                    ApplicationArea = All;

                }
                field(USERID; Rec.USERID)
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
                field(WSReserved_CB1; Rec.WSReserved_CB1)
                {
                    ApplicationArea = All;


                }
                field(WSReserved_CB2; Rec.WSReserved_CB2)
                {
                    ApplicationArea = All;


                }
                field(WSReserved_CB3; Rec.WSReserved_CB3)
                {
                    ApplicationArea = All;


                }
                field(WSReserved_CB4; Rec.WSReserved_CB4)
                {
                    ApplicationArea = All;


                }
                field(WSReserved_CB5; Rec.WSReserved_CB5)
                {
                    ApplicationArea = All;


                }
                field(WSReserved_STR1; Rec.WSReserved_STR1)
                {
                    ApplicationArea = All;


                }
                field(WSReserved_STR2; Rec.WSReserved_STR2)
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
                    Import_CU.ImportJobDeatilsSummary();
                end;
            }
        }
    }

}