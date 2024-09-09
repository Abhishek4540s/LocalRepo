page 50963 "SSTAZ_Contract_Billing"
{
    PageType = List;
    UsageCategory = Lists;
    SourceTable = SSTAZ_Contract_Billing;
    SaveValues = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    ApplicationArea = Basic, Suite;
    caption = 'SV Contract Billing MSTR';

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
                field(CUSTNMBR; Rec.CUSTNMBR)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(ADRSCODE; Rec.ADRSCODE)
                {
                    ApplicationArea = All;
                }
                field(Contract_Number; Rec.Contract_Number)
                {
                    ApplicationArea = All;
                }
                field(WSCONTSQ; Rec.WSCONTSQ)
                {
                    ApplicationArea = All;
                }
                field(SEQNUMBR; Rec.SEQNUMBR)
                {
                    ApplicationArea = All;
                }
                field(Wennsoft_Affiliate; Rec.Wennsoft_Affiliate)
                {
                    ApplicationArea = All;
                }
                field(Wennsoft_Region; Rec.Wennsoft_Region)
                {
                    ApplicationArea = All;
                }
                field(Wennsoft_Branch; Rec.Wennsoft_Branch)
                {
                    ApplicationArea = All;
                }
                field(USERID; Rec.USERID)
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
                field(Wennsoft_Close_Date; Rec.Wennsoft_Close_Date)
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
                field(Contract_Billing_Desc; Rec.Contract_Billing_Desc)
                {
                    ApplicationArea = All;
                }
                field(Billing_Date; Rec.Billing_Date)
                {
                    ApplicationArea = All;
                }
                field(Corporate_Invoice_Number; Rec.Corporate_Invoice_Number)
                {
                    ApplicationArea = All;
                }
                field(Corporate_Contract_Nbr; Rec.Corporate_Contract_Nbr)
                {
                    ApplicationArea = All;
                }
                field(WSMSTRCONTSQ; Rec.WSMSTRCONTSQ)
                {
                    ApplicationArea = All;
                }
                field(RMDTYPAL; Rec.RMDTYPAL)
                {
                    ApplicationArea = All;
                }
                field(Tax_Detail_ID_1; Rec.Tax_Detail_ID_1)
                {
                    ApplicationArea = All;
                }
                field(Tax_Amount1; Rec.Tax_Amount1)
                {
                    ApplicationArea = All;
                }
                field(Tax_Detail_ID_2; Rec.Tax_Detail_ID_2)
                {
                    ApplicationArea = All;
                }
                field(Tax_Amount2; Rec.Tax_Amount2)
                {
                    ApplicationArea = All;
                }
                field(Tax_Detail_ID_3; Rec.Tax_Detail_ID_3)
                {
                    ApplicationArea = All;
                }
                field(Tax_Amount3; Rec.Tax_Amount3)
                {
                    ApplicationArea = All;
                }
                field(Tax_Detail_ID_4; Rec.Tax_Detail_ID_4)
                {
                    ApplicationArea = All;
                }
                field(Tax_Amount_4; Rec.Tax_Amount_4)
                {
                    ApplicationArea = All;
                }
                field(DOCAMNT; Rec.DOCAMNT)
                {
                    ApplicationArea = All;
                }
                field(Escalation_Idx_ID_Equip; Rec.Escalation_Idx_ID_Equip)
                {
                    ApplicationArea = All;
                }
                field(Escal_Idx_ID_Material; Rec.Escal_Idx_ID_Material)
                {
                    ApplicationArea = All;
                }
                field(Escalation_Idx_ID_Labor; Rec.Escalation_Idx_ID_Labor)
                {
                    ApplicationArea = All;
                }
                field(Escalation_Index_ID_Subs; Rec.Escalation_Index_ID_Subs)
                {
                    ApplicationArea = All;
                }
                field(Escalation_Idx_ID_Other; Rec.Escalation_Idx_ID_Other)
                {
                    ApplicationArea = All;
                }
                field(Escalation_Pct_Equip; Rec.Escalation_Pct_Equip)
                {
                    ApplicationArea = All;
                }
                field(Escalation_Pct_Material; Rec.Escalation_Pct_Material)
                {
                    ApplicationArea = All;
                }
                field(Escalation_Pct_Labor; Rec.Escalation_Pct_Labor)
                {
                    ApplicationArea = All;
                }
                field(Escalation_Pct_Subs; Rec.Escalation_Pct_Subs)
                {
                    ApplicationArea = All;
                }
                field(Escalation_Pct_Other; Rec.Escalation_Pct_Other)
                {
                    ApplicationArea = All;
                }
                field(Escal_Fixed_Amt_Equip; Rec.Escal_Fixed_Amt_Equip)
                {
                    ApplicationArea = All;
                }
                field(Escalation_Fixed_Amt_Mat; Rec.Escalation_Fixed_Amt_Mat)
                {
                    ApplicationArea = All;
                }
                field(Escal_Fixed_Amt_Labor; Rec.Escal_Fixed_Amt_Labor)
                {
                    ApplicationArea = All;
                }
                field(Escal_Fixed_Amt_Subs; Rec.Escal_Fixed_Amt_Subs)
                {
                    ApplicationArea = All;
                }
                field(Escal_Fixed_Amt_Other; Rec.Escal_Fixed_Amt_Other)
                {
                    ApplicationArea = All;
                }
                field(Billable_Escalation; Rec.Billable_Escalation)
                {
                    ApplicationArea = All;
                }
                field(Billable_Total; Rec.Billable_Total)
                {
                    ApplicationArea = All;
                }
                field(Contract_Escalation_Desc; Rec.Contract_Escalation_Desc)
                {
                    ApplicationArea = All;
                }
                field(DATE1; Rec.DATE1)
                {
                    ApplicationArea = All;
                }
                field(POSTDATE; Rec.POSTDATE)
                {
                    ApplicationArea = All;
                }
                field(Period2; Rec.Period2)
                {
                    ApplicationArea = All;
                }
                field(WS_Closed; Rec.WS_Closed)
                {
                    ApplicationArea = All;
                }
                field(Invoice_Comment_ID_1; Rec.Invoice_Comment_ID_1)
                {
                    ApplicationArea = All;
                }
                field(Invoice_Comment_ID_2; Rec.Invoice_Comment_ID_2)
                {
                    ApplicationArea = All;
                }
                field(SLPRSNID; Rec.SLPRSNID)
                {
                    ApplicationArea = All;
                }
                field(COMPRCNT; Rec.COMPRCNT)
                {
                    ApplicationArea = All;
                }
                field(Commission_Pct_of_Sale; Rec.Commission_Pct_of_Sale)
                {
                    ApplicationArea = All;
                }
                field(COMMERNG; Rec.COMMERNG)
                {
                    ApplicationArea = All;
                }
                field(SALSTERR; Rec.SALSTERR)
                {
                    ApplicationArea = All;
                }
                field(Salesperson_ID_2; Rec.Salesperson_ID_2)
                {
                    ApplicationArea = All;
                }
                field(Commission_Percent_2; Rec.Commission_Percent_2)
                {
                    ApplicationArea = All;
                }
                field(Commission_Pct_of_Sale_2; Rec.Commission_Pct_of_Sale_2)
                {
                    ApplicationArea = All;
                }
                field(Commission_Earnings_2; Rec.Commission_Earnings_2)
                {
                    ApplicationArea = All;
                }
                field(Sales_Territory_2; Rec.Sales_Territory_2)
                {
                    ApplicationArea = All;
                }
                field(Invoice_Style; Rec.Invoice_Style)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_1; Rec.Service_User_Define_1)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_2; Rec.Service_User_Define_2)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_3; Rec.Service_User_Define_3)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_4; Rec.Service_User_Define_4)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_5; Rec.Service_User_Define_5)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_6; Rec.Service_User_Define_6)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_7; Rec.Service_User_Define_7)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_8; Rec.Service_User_Define_8)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_9; Rec.Service_User_Define_9)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_10; Rec.Service_User_Define_10)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_11; Rec.Service_User_Define_11)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_12; Rec.Service_User_Define_12)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_18; Rec.Service_User_Define_18)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_19; Rec.Service_User_Define_19)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_21; Rec.Service_User_Define_21)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_22; Rec.Service_User_Define_22)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_23; Rec.Service_User_Define_23)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_24; Rec.Service_User_Define_24)
                {
                    ApplicationArea = All;
                }
                field(Service_User_Define_25; Rec.Service_User_Define_25)
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
                field(Time_Zone; Rec.Time_Zone)
                {
                    ApplicationArea = All;
                }
                field(Base_Currency_ID; Rec.Base_Currency_ID)
                {
                    ApplicationArea = All;
                }
                field(Base_Curr_Conv_Factor; Rec.Base_Curr_Conv_Factor)
                {
                    ApplicationArea = All;
                }
                field(Billing_Currency_ID; Rec.Billing_Currency_ID)
                {
                    ApplicationArea = All;
                }
                field(Billing_Curr_Conv_Factor; Rec.Billing_Curr_Conv_Factor)
                {
                    ApplicationArea = All;
                }
                field(Local_Currency_ID; Rec.Local_Currency_ID)
                {
                    ApplicationArea = All;
                }
                field(Bill_Customer_Number; Rec.Bill_Customer_Number)
                {
                    ApplicationArea = All;
                }
                field(Bill_Address_Code; Rec.Bill_Address_Code)
                {
                    ApplicationArea = All;
                }
                field(RMDNUMWK; Rec.RMDNUMWK)
                {
                    ApplicationArea = All;
                }
                field(ACTINDX_CR; Rec.ACTINDX_CR)
                {
                    ApplicationArea = All;
                }
                field(ACTINDX_DR; Rec.ACTINDX_DR)
                {
                    ApplicationArea = All;
                }
                field(GLPOSTDT; Rec.GLPOSTDT)
                {
                    ApplicationArea = All;
                }
                field(JRNENTRY; Rec.JRNENTRY)
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
            }

        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportContractbill)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = ImportExcel;
                ToolTip = 'Import Data From CSV';

                trigger OnAction();
                var
                    ImportSSTFilesCSV_lCdu: Codeunit ImportSSTFilesCSV;
                begin
                    ImportSSTFilesCSV_lCdu.ReadCSVData();
                    ImportSSTFilesCSV_lCdu.ImportSSTAZ_Contract_Billing();
                end;
            }

        }
    }
}