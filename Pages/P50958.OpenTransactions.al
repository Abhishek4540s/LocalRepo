page 50958 "Wennsoft open Transacitons"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Wennsoft Open Transacitons";
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
                field(WS_Job_Number; Rec.WS_Job_Number)
                {
                    ApplicationArea = All;
                }
                field(Project_Number; Rec.Project_Number)
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
                field(Cost_Code_Description; Rec.Cost_Code_Description)
                {
                    ApplicationArea = All;
                }
                field(Cost_Element; Rec.Cost_Element)
                {
                    ApplicationArea = All;
                }
                field(Job_TRX_Number; Rec.Job_TRX_Number)
                {
                    ApplicationArea = All;
                }
                field(Document_Source; Rec.Document_Source)
                {
                    ApplicationArea = All;
                }
                field(TRXSORCE; Rec.TRXSORCE)
                {
                    ApplicationArea = All;
                }
                field(JRNENTRY; Rec.JRNENTRY)
                {
                    ApplicationArea = All;
                }
                field(ACTINDX; Rec.ACTINDX)
                {
                    ApplicationArea = All;
                }
                field(DISTTYPE; Rec.DISTTYPE)
                {
                    ApplicationArea = All;
                }
                field(DOCNUMBR; Rec.DOCNUMBR)
                {
                    ApplicationArea = All;
                }
                field(LNSEQNBR; Rec.LNSEQNBR)
                {
                    ApplicationArea = All;
                }
                field(PYADNMBR; Rec.PYADNMBR)
                {
                    ApplicationArea = All;
                }
                field(VOIDPYADNMBR; Rec.VOIDPYADNMBR)
                {
                    ApplicationArea = All;
                }
                field(TRXDSCRN; Rec.TRXDSCRN)
                {
                    ApplicationArea = All;
                }
                field(Cost_Code_Act_Cost_TTD; Rec.Cost_Code_Act_Cost_TTD)
                {
                    ApplicationArea = All;
                }
                field(Cost_Code_Actual_Org_Cst; Rec.Cost_Code_Actual_Org_Cst)
                {
                    ApplicationArea = All;
                }
                field(DOCDATE; Rec.DOCDATE)
                {
                    ApplicationArea = All;
                }
                field(DOCAMNT; Rec.DOCAMNT)
                {
                    ApplicationArea = All;
                }
                field(DOCTYPE; Rec.DOCTYPE)
                {
                    ApplicationArea = All;
                }
                field(GLPOSTDT; Rec.GLPOSTDT)
                {
                    ApplicationArea = All;
                }
                field(Profit_Type_Number; Rec.Profit_Type_Number)
                {
                    ApplicationArea = All;
                }
                field(Profit_Amount; Rec.Profit_Amount)
                {
                    ApplicationArea = All;
                }
                field(Job_Type; Rec.Job_Type)
                {
                    ApplicationArea = All;
                }
                field(IVDOCTYP; Rec.IVDOCTYP)
                {
                    ApplicationArea = All;
                }
                field(VENDORID; Rec.VENDORID)
                {
                    ApplicationArea = All;
                }
                field(ITEMNMBR; Rec.ITEMNMBR)
                {
                    ApplicationArea = All;
                }
                field(UOFM; Rec.UOFM)
                {
                    ApplicationArea = All;
                }
                field(TRXQTY; Rec.TRXQTY)
                {
                    ApplicationArea = All;
                }
                field(TRX_QTY_PR; Rec.TRX_QTY_PR)
                {
                    ApplicationArea = All;
                }
                field(TRXLOCTN; Rec.TRXLOCTN)
                {
                    ApplicationArea = All;
                }
                field(UNITCOST; Rec.UNITCOST)
                {
                    ApplicationArea = All;
                }

                field(BACHNUMB; Rec.BACHNUMB)
                {
                    ApplicationArea = All;
                }
                field(BCHSOURC; Rec.BCHSOURC)
                {
                    ApplicationArea = All;
                }
                field(EMPLOYID; Rec.EMPLOYID)
                {
                    ApplicationArea = All;
                }
                field(Payroll_Pay_Type; Rec.Payroll_Pay_Type)
                {
                    ApplicationArea = All;
                }
                field(COMPTRTP; Rec.COMPTRTP)
                {
                    ApplicationArea = All;
                }
                field(UPRTRXCD; Rec.UPRTRXCD)
                {
                    ApplicationArea = All;
                }
                field(TRXHRUNT; Rec.TRXHRUNT)
                {
                    ApplicationArea = All;
                }
                field(PAYRTAMT; Rec.PAYRTAMT)
                {
                    ApplicationArea = All;
                }
                field(VARDBAMT; Rec.VARDBAMT)
                {
                    ApplicationArea = All;
                }
                field(Transaction_Pay_Period; Rec.Transaction_Pay_Period)
                {
                    ApplicationArea = All;
                }
                field(TRXBEGDT; Rec.TRXBEGDT)
                {
                    ApplicationArea = All;
                }
                field(TRXENDDT; Rec.TRXENDDT)
                {
                    ApplicationArea = All;
                }
                field(WS_Transaction_Date; Rec.WS_Transaction_Date)
                {
                    ApplicationArea = All;
                }
                field(Unit_Decimal_Places; Rec.Unit_Decimal_Places)
                {
                    ApplicationArea = All;
                }
                field(Cost_Decimal_Places; Rec.Cost_Decimal_Places)
                {
                    ApplicationArea = All;
                }
                field(Ovrhd_1_Unit_Dec_Places; Rec.Ovrhd_1_Unit_Dec_Places)
                {
                    ApplicationArea = All;
                }
                field(Overhead_1_Cst_Dec_Plcs; Rec.Overhead_1_Cst_Dec_Plcs)
                {
                    ApplicationArea = All;
                }
                field(Overhead_Units_1; Rec.Overhead_Units_1)
                {
                    ApplicationArea = All;
                }
                field(Overhead_1_Cst_Per_Unit; Rec.Overhead_1_Cst_Per_Unit)
                {
                    ApplicationArea = All;
                }
                field(Overhead_1_Pct_Rate; Rec.Overhead_1_Pct_Rate)
                {
                    ApplicationArea = All;
                }
                field(UNIONCD; Rec.UNIONCD)
                {
                    ApplicationArea = All;
                }
                field(DAYSWRDK; Rec.DAYSWRDK)
                {
                    ApplicationArea = All;
                }
                field(WKSWRKD; Rec.WKSWRKD)
                {
                    ApplicationArea = All;
                }
                field(DEPRTMNT; Rec.DEPRTMNT)
                {
                    ApplicationArea = All;
                }
                field(JOBTITLE; Rec.JOBTITLE)
                {
                    ApplicationArea = All;
                }
                field(STATECD; Rec.STATECD)
                {
                    ApplicationArea = All;
                }
                field(LOCALTAX; Rec.LOCALTAX)
                {
                    ApplicationArea = All;
                }
                field(SUTASTAT; Rec.SUTASTAT)
                {
                    ApplicationArea = All;
                }
                field(WRKRCOMP; Rec.WRKRCOMP)
                {
                    ApplicationArea = All;
                }
                field(FEDCLSSCD; Rec.FEDCLSSCD)
                {
                    ApplicationArea = All;
                }
                field(Production_Actual_Qty; Rec.Production_Actual_Qty)
                {
                    ApplicationArea = All;
                }
                field(Est_Pct_Complete_to_Date; Rec.Est_Pct_Complete_to_Date)
                {
                    ApplicationArea = All;
                }
                field(Overhead_Group_Code; Rec.Overhead_Group_Code)
                {
                    ApplicationArea = All;
                }
                field(Labor_Fixed_OH; Rec.Labor_Fixed_OH)
                {
                    ApplicationArea = All;
                }
                field(Labor_OH_Percentage; Rec.Labor_OH_Percentage)
                {
                    ApplicationArea = All;
                }
                field(Certified_Payroll; Rec.Certified_Payroll)
                {
                    ApplicationArea = All;
                }
                field(Monday; Rec.Monday)
                {
                    ApplicationArea = All;
                }
                field(Tuesday; Rec.Tuesday)
                {
                    ApplicationArea = All;
                }
                field(Wednesday; Rec.Wednesday)
                {
                    ApplicationArea = All;
                }
                field(Thursday; Rec.Thursday)
                {
                    ApplicationArea = All;
                }
                field(Friday; Rec.Friday)
                {
                    ApplicationArea = All;
                }
                field(Saturday; Rec.Saturday)
                {
                    ApplicationArea = All;
                }
                field(Sunday; Rec.Sunday)
                {
                    ApplicationArea = All;
                }
                field(PSTGSTUS; Rec.PSTGSTUS)
                {
                    ApplicationArea = All;
                }
                field(CURNCYID; Rec.CURNCYID)
                {
                    ApplicationArea = All;
                }
                field(CURRNIDX; Rec.CURRNIDX)
                {
                    ApplicationArea = All;
                }
                field(PORDNMBR; Rec.PORDNMBR)
                {
                    ApplicationArea = All;
                }
                field(Rate_Per_Unit; Rec.Rate_Per_Unit)
                {
                    ApplicationArea = All;
                }
                field(Billed_Amount; Rec.Billed_Amount)
                {
                    ApplicationArea = All;
                }
                field(Billed_Invoice_Number_1; Rec.Billed_Invoice_Number_1)
                {
                    ApplicationArea = All;
                }
                field(Billed_Invoice_Number_2; Rec.Billed_Invoice_Number_2)
                {
                    ApplicationArea = All;
                }
                field(Billed_Transaction; Rec.Billed_Transaction)
                {
                    ApplicationArea = All;
                }
                field(Credit_Memo_Number; Rec.Credit_Memo_Number)
                {
                    ApplicationArea = All;
                }
                field(Credit_Transaction; Rec.Credit_Transaction)
                {
                    ApplicationArea = All;
                }
                field(Unbillable_Transaction; Rec.Unbillable_Transaction)
                {
                    ApplicationArea = All;
                }
                field(RATECLSS; Rec.RATECLSS)
                {
                    ApplicationArea = All;
                }
                field(WS_Cost_Type; Rec.WS_Cost_Type)
                {
                    ApplicationArea = All;
                }
                field(ICCURRID; Rec.ICCURRID)
                {
                    ApplicationArea = All;
                }
                field(ICCURRIX; Rec.ICCURRIX)
                {
                    ApplicationArea = All;
                }
                field(SHFTCODE; Rec.SHFTCODE)
                {
                    ApplicationArea = All;
                }
                field(SHFTPREM; Rec.SHFTPREM)
                {
                    ApplicationArea = All;
                }
                field(Tax_Date; Rec.Tax_Date)
                {
                    ApplicationArea = All;
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
                field(WSReserved_STR1; Rec.WSReserved_STR1)
                {
                    ApplicationArea = all;
                }
                field(WSReserved_STR2; Rec.WSReserved_STR2)
                {
                    ApplicationArea = all;
                }
                field(OPENYEAR; Rec.OPENYEAR)
                {
                    ApplicationArea = all;
                }
                field(DEX_ROW_ID; Rec.DEX_ROW_ID)
                {
                    ApplicationArea = all;
                    Visible = true;
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
                    Import_CU.ImportOpenTransactions();
                end;
            }
        }
    }
}