page 50960 "GL Trans 2024"
{

    ApplicationArea = Basic, Suite;

    //Editable = false;
    PageType = List;
    SourceTable = "GL Trans";
    SaveValues = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    UsageCategory = Lists;


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = all;
                }
                field(JRNENTRY; Rec.JRNENTRY)
                {
                    ApplicationArea = All;
                    // Caption = 'ORDOCNUM';
                }
                field(OPENYEAR; Rec.OPENYEAR)
                {
                    ApplicationArea = All;
                }
                field(PERIODID; Rec.PERIODID)
                {
                    ApplicationArea = All;
                }
                field(ACTNUMBR_1; Rec.ACTNUMBR_1)
                {
                    ApplicationArea = All;
                }

                field(ACTNUMBR_3; Rec.ACTNUMBR_3)
                {
                    ApplicationArea = All;
                }

                field(ACTNUMST; Rec.ACTNUMST)
                {
                    ApplicationArea = All;
                }

                field(TRXDATE; Rec.TRXDATE)
                {
                    ApplicationArea = All;
                }

                field(ORMSTRID; Rec.ORMSTRID)
                {
                    ApplicationArea = All;
                }

                field(DEBITAMT; Rec.DEBITAMT)
                {
                    ApplicationArea = All;
                }

                field(CRDTAMNT; Rec.CRDTAMNT)
                {
                    ApplicationArea = All;
                }

                field(Net_DrCr; Rec.Net_DrCr)
                {
                    ApplicationArea = All;

                }
                field(SOURCDOC; Rec.SOURCDOC)
                {
                    ApplicationArea = All;

                }
                field(ORMSTRNM; Rec.ORMSTRNM)
                {
                    ApplicationArea = All;

                }
                field(BACHNUMB; Rec.BACHNUMB)
                {
                    ApplicationArea = All;

                }
                field(ORDOCNUM; Rec.ORDOCNUM)
                {
                    ApplicationArea = All;
                    // Caption = 'JRNENTRY';

                }
                field(DSCRIPTN; Rec.DSCRIPTN)
                {
                    ApplicationArea = All;

                }
                field(ORGNTSRC; Rec.ORGNTSRC)
                {
                    ApplicationArea = All;

                }
                field(VOIDED; Rec.VOIDED)
                {
                    ApplicationArea = All;

                }
                field(GPsegment1; Rec.GPsegment1)
                {
                    ApplicationArea = All;

                }
                field(BCdimension1; Rec.BCdimension1)
                {
                    ApplicationArea = All;

                }
                field(BCdscriptnDim1; Rec.BCdscriptnDim1)
                {
                    ApplicationArea = All;
                }
                field(GPAcctNmbr; Rec.GPAcctNmbr)
                {
                    ApplicationArea = All;
                }
                field(BCGLNo; Rec.BCGLNo)
                {
                    ApplicationArea = All;
                }
                field(BCGLName; Rec.BCGLName)
                {
                    ApplicationArea = All;
                }
                field(BCIncomeBalance; Rec.BCIncomeBalance)
                {
                    ApplicationArea = All;
                }
                field(BCAccountCategory; Rec.BCAccountCategory)
                {
                    ApplicationArea = All;
                }
                field(BCAccountSubcategory; Rec.BCAccountSubcategory)
                {
                    ApplicationArea = All;
                }
                field(BCAccountType; Rec.BCAccountType)
                {
                    ApplicationArea = All;
                }
                field(REFRENCE; Rec.REFRENCE)
                {
                    ApplicationArea = All;
                }
                field(JobrelatedORnot; Rec.JobrelatedORnot)
                {
                    ApplicationArea = All;
                }
                field(JobORNOTJobrelated; Rec.JobORNOTJobrelated)
                {
                    ApplicationArea = All;
                }
                field(JobORNull; Rec.JobORNull)
                {
                    ApplicationArea = All;
                }
                field(JournalTemplate; Rec.JournalTemplate)
                {
                    ApplicationArea = All;
                }
                field(JournalbatchName; Rec.JournalbatchName)
                {
                    ApplicationArea = All;
                }
                field(FileName; Rec.FileName)
                {
                    ApplicationArea = All;
                }
                field(ImportedBY; Rec.ImportedBY)
                {
                    ApplicationArea = All;
                }
                field(ImportedOnDate; Rec.ImportedOnDate)
                {
                    ApplicationArea = All;
                }
                field(IsProcessed; Rec.IsProcessed)
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

            action(CreateAllGenJnl)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Process;
                Caption = 'Create All Gen journal lines';
                trigger OnAction();
                var
                    CreateJournalEntries_lCdu: Codeunit "GL Transaction";
                begin
                    if Confirm('Do you want to create Gen journal lines for all the records') then
                        CreateJournalEntries_lCdu.AllGenJnlLine();
                end;
            }
            action(CreateSingleGenJnl)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Process;
                //Visible = false;
                Caption = 'Create Single Journal Line';
                trigger OnAction();
                var
                    CreateJournalEntries_lCdu: Codeunit "GL Transaction";
                begin
                    CreateJournalEntries_lCdu.SingleGenJnlLine(Rec);
                end;
            }
            action(CreateBasedOnFilter)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Process;
                //Visible = false;
                Caption = 'Create Based on filter';
                trigger OnAction();
                var
                    SingleInstance: Codeunit SingleInstance_CU;
                    DialogPage: page DialogGtTrans;
                    CreateJournalEntries_lCdu: Codeunit "GL Transaction";
                begin
                    SingleInstance.ClearValues();
                    if DialogPage.Runmodal = action::OK then begin
                        // Message(SingleInstance.GetFilter());

                        CreateJournalEntries_lCdu.BasedonFilter();
                    end;
                end;
            }

            action(ReportToImport)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Process;
                //Visible = false;
                RunObject = report "GL Trans";
                Caption = 'Report To Import Data';
            }
            action(modifyEntryNo)
            {
                trigger OnAction()
                var
                    Gltrans_lRec: Record "GL Trans";
                    Counter_lint: Integer;
                begin
                    Counter_lint := 1;
                    Gltrans_lRec.Reset();
                    Gltrans_lRec.SetRange(IsProcessed, true);
                    // Gltrans_lRec.SetCurrentKey(EntryNo);
                    if Gltrans_lRec.FindSet() then begin
                        repeat
                            Gltrans_lRec.IsProcessed := false;
                            Gltrans_lRec.Modify();
                        until Gltrans_lRec.Next() = 0;
                    end;

                end;

            }

        }
    }
}



