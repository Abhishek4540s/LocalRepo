page 50962 SSTAZ_SV_MAint_Invoice_MSTR
{
    PageType = List;
    ApplicationArea = Basic, Suite;
    UsageCategory = Lists;
    SourceTable = SSTAZ_SV_MAint_Invoice_MSTR;
    SaveValues = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    Caption = 'SV Maint Invoice MSTR';

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
                field(DATE1; Rec.DATE1)
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
                field(Position_on_Invoice; Rec.Position_on_Invoice)
                {
                    ApplicationArea = All;
                }
                field(Wennsoft_Billing_Date; Rec.Wennsoft_Billing_Date)
                {
                    ApplicationArea = All;
                }
                field(Wennsoft_Period_ID; Rec.Wennsoft_Period_ID)
                {
                    ApplicationArea = All;
                }
                field(Billable_Tax; Rec.Billable_Tax)
                {
                    ApplicationArea = All;
                }
                field(Billable_Subtotal; Rec.Billable_Subtotal)
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
                field(Billable_All; Rec.Billable_All)
                {
                    ApplicationArea = All;
                }
                field(PORDNMBR; Rec.PORDNMBR)
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
                field(No_Times_Printed; Rec.No_Times_Printed)
                {
                    ApplicationArea = All;
                }
                field(Printed_Date; Rec.Printed_Date)
                {
                    ApplicationArea = All;
                }
                field(Wennsoft_Posting_Status; Rec.Wennsoft_Posting_Status)
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
                field(SV_Language_ID; Rec.SV_Language_ID)
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
                field(Base_Currency_Amount; Rec.Base_Currency_Amount)
                {
                    ApplicationArea = All;
                }
                field(Billing_Currency_Amount; Rec.Billing_Currency_Amount)
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
                field(Bill_Customer_Number; Rec.Bill_Customer_Number)
                {
                    ApplicationArea = All;
                }
                field(Bill_Address_Code; Rec.Bill_Address_Code)
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
                field(WSReserved_CB6; Rec.WSReserved_CB5)
                {
                    ApplicationArea = All;
                }
                field(WSReserved_CB7; Rec.WSReserved_CB5)
                {
                    ApplicationArea = All;
                }
                field(WSReserved_CB8; Rec.WSReserved_CB5)
                {
                    ApplicationArea = All;
                }
                field(WSReserved_CB9; Rec.WSReserved_CB5)
                {
                    ApplicationArea = All;
                }
                field(WSReserved_CB10; Rec.WSReserved_CB5)
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
                field(WS_GL_Posting_Date; Rec.WS_GL_Posting_Date)
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
            action(ImportMainInvoice)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = ImportExcel;
                ToolTip = 'Import Data From Excel';

                trigger OnAction();
                var
                    ImportSSTFilesCSV_lCdu: Codeunit ImportSSTFilesCSV;
                begin
                    ImportSSTFilesCSV_lCdu.ReadCSVData();
                    ImportSSTFilesCSV_lCdu.ImportSV_MAint_Invoice_MSTR();
                end;
            }

        }
    }
}