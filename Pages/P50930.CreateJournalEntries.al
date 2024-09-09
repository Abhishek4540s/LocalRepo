

page 50930 "Create Journal Entries"
{
    ApplicationArea = All;
    Caption = 'GL Periodic Balance history';
    PageType = List;
    SourceTable = "Create Journal Entries";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    AdditionalSearchTerms = 'SST';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
                field(periodid; Rec.periodid)
                {
                    ToolTip = 'Specifies the value of the periodid field.', Comment = '%';
                }
                field(perdblnc; Rec.perdblnc)
                {
                    ToolTip = 'Specifies the value of the perdblnc field.', Comment = '%';
                }
                field("BC GL No"; Rec."BC GL No")
                {
                    ToolTip = 'Specifies the value of the BC GL No field.', Comment = '%';
                }
                field(BCdimension1; Rec.BCdimension1)
                {
                    ToolTip = 'Specifies the value of the BCdimension1 field.', Comment = '%';
                }
                field("Document No"; Rec."Document No")
                {
                    ToolTip = 'Specifies the value of the Document No field.', Comment = '%';
                }
                field("GP ACTNUMST "; Rec."GP ACTNUMST ")
                {
                    ToolTip = 'Specifies the value of the GP ACTNUMST  field.', Comment = '%';
                }
                field("Journal Template"; Rec."Journal Template")
                {
                    ToolTip = 'Specifies the value of the Journal Template field.', Comment = '%';
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ToolTip = 'Specifies the value of the Journal Batch Name field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("File Name"; Rec."File Name")
                {
                    ToolTip = 'Specifies the value of the File Name field.', Comment = '%';
                }
                field("Imported By"; Rec."Imported By")
                {
                    ToolTip = 'Specifies the value of the Imported By field.', Comment = '%';
                }
                field("Imported On Date"; Rec."Imported On Date")
                {
                    ToolTip = 'Specifies the value of the Imported On Date field.', Comment = '%';
                }
                field("Is Processed"; Rec."Is Processed")
                {
                    ToolTip = 'Specifies the value of the Is Processed field.', Comment = '%';
                }
                field("Error Log"; Rec."Error Log")
                {
                    ToolTip = 'Specifies the value of the Is Processed field.', Comment = '%';
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
                Caption = 'Create All Journal Lines';
                trigger OnAction();
                var
                    CreateJournalEntries_lCdu: Codeunit "Create Journal Entries";
                begin
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
                Caption = 'Create Single Journal Lines';
                trigger OnAction();
                var
                    CreateJournalEntries_lCdu: Codeunit "Create Journal Entries";
                begin
                    CreateJournalEntries_lCdu.SingleGenJnlLine(Rec);
                end;
            }
            action(CashRecieptJournal)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Process;
                //Visible = false;
                RunObject = page "Cash Receipt Journal";
                Caption = 'Cash Reciept Journal';
            }
            action(ReportToImport)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Process;
                //Visible = false;
                RunObject = report "Create Journal Entries";
                Caption = 'Report To Import Data';
            }
            action(Delete)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Process;
                Caption = 'Delete';
                ToolTip = 'Delete';
                Visible = false;
                trigger OnAction();
                var
                    GenJnlLine_lRec: Record "Gen. Journal Line";
                begin
                    // if GenJnlLine_lRec."Journal Batch Name" = 'ASSET' then begin
                    //     If GenJnlLine_lRec.FindSet() then
                    GenJnlLine_lRec.DeleteAll(true);
                    // end;


                    Message('Records Deleted');
                end;
            }
        }
    }
}