page 50965 "Contract Revenue Method MSTR"
{
    ApplicationArea = Basic, Suite;
    //Editable = false;
    PageType = List;
    SourceTable = "Contract Revenue Method MSTR";
    SaveValues = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    UsageCategory = Lists;
    caption = 'SV Contract Revenue Method MSTR';


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
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
                field(YEAR1; Rec.YEAR1)
                {
                    ApplicationArea = All;

                }
                field(PERIODID; Rec.PERIODID)
                {
                    ApplicationArea = All;

                }
                field(DOCAMNT; Rec.DOCAMNT)
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
                field(WS_Closed; Rec.WS_Closed)
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
                field(GLJournalEntry; Rec.GLJournalEntry)
                {
                    ApplicationArea = All;

                }
                field(PB_ACTINDX; Rec.PB_ACTINDX)
                {
                    ApplicationArea = All;

                }
                field(CE_ACTINDX; Rec.CE_ACTINDX)
                {
                    ApplicationArea = All;

                }
                field(PB_SEQNUMBR; Rec.PB_SEQNUMBR)
                {
                    ApplicationArea = All;

                }
                field(CE_SEQNUMBR; Rec.CE_SEQNUMBR)
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
                field(RMDTYPAL; Rec.RMDTYPAL)
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
                field(Reference_TRX_Number; Rec.Reference_TRX_Number)
                {
                    ApplicationArea = All;

                }
                field(JRNENTRY; Rec.JRNENTRY)
                {
                    ApplicationArea = All;

                }
                field(LNSEQNBR; Rec.LNSEQNBR)
                {
                    ApplicationArea = All;

                }
                field(Contract_Sequence_Number; Rec.Contract_Sequence_Number)
                {
                    ApplicationArea = All;

                }
                field(DEX_ROW_ID; Rec.DEX_ROW_ID)
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
            action(Import)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = ImportExcel;
                ToolTip = 'Import Data From Excel';

                trigger OnAction();
                var
                    ImportSSTFilesCSV_Cdu: Codeunit ImportSSTFilesCSV;
                begin

                    ImportSSTFilesCSV_Cdu.ReadCSVData();
                    ImportSSTFilesCSV_Cdu.ImportContractRevenueMSTR();
                end;
            }
        }
    }


}