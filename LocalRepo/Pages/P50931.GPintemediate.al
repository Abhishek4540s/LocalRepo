page 50931 GP_intemediate
{
    ApplicationArea = All;
    Caption = 'GP_intemediate';
    PageType = List;
    SourceTable = GPIntermediary;
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = All;
                }
                field(JRNENTRY; Rec.JRNENTRY)
                {
                    ApplicationArea = All;
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
                field(GPsegmentID; Rec.GPsegmentID)
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
                field("GP AcctNmbrStrng"; Rec."GP AcctNmbrStrng")
                {
                    ApplicationArea = All;
                }
                field("BC GL No"; Rec."BC GL No")
                {
                    ApplicationArea = All;
                }
                field("BC GL Name"; Rec."BC GL Name")
                {
                    ApplicationArea = All;
                }
                field("BC Income/Balance"; Rec."BC Income/Balance")
                {
                    ApplicationArea = All;
                }
                field("BC Account Category"; Rec."BC Account Category")
                {
                    ApplicationArea = All;
                }
                field("BC Account Subcategory"; Rec."BC Account Subcategory")
                {
                    ApplicationArea = All;
                }
                field("BC Account Type"; Rec."BC Account Type")
                {
                    ApplicationArea = All;
                }
                field(REFRENCE; Rec.REFRENCE)
                {
                    ApplicationArea = All;
                }
                field("Job related or not"; Rec."Job related or not")
                {
                    ApplicationArea = All;
                }
                field("Job or not Job related"; Rec."Job or not Job related")
                {
                    ApplicationArea = All;
                }
                field("Job or Null"; Rec."Job or Null")
                {
                    ApplicationArea = All;
                }
                field("Imported File Name"; Rec."Imported File Name")
                {
                    ApplicationArea = All;
                }
                field("Imported Date & Time"; Rec."Imported Date & Time")
                {
                    ApplicationArea = All;
                }
                field("Imported By"; Rec."Imported By")
                {
                    ApplicationArea = All;
                }

                field("Processed Date & Time"; Rec."Processed Date & Time")
                {
                    ApplicationArea = All;
                }
                field("Processed By"; Rec."Processed By")
                {
                    ApplicationArea = All;
                }
                field("Journal Line Created"; Rec."Journal Line Created")
                {
                    ApplicationArea = All;
                }
                field("Journal Line No."; Rec."Journal Line No.")
                {
                    ApplicationArea = All;
                }
                field("General Ledger Entry No"; Rec."General Ledger Entry No")
                {
                    ApplicationArea = All;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                }
                field("Error Log"; Rec."Error Log")
                {
                    ApplicationArea = All;
                    Style = Attention;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {

            action("Create GJ")
            {
                Caption = 'Create Gen. Journal';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Create General journal';
                trigger OnAction()
                begin
                    if Confirm('Do you want to create General journal for this line', false) then
                        GPTransfer_CU.SingleGenJnlLine(Rec);

                end;
            }
            action("Create GJ All")
            {
                Caption = 'Create Gen. Journals for all';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Create General journals for all the entries';
                trigger OnAction()
                begin
                    if Confirm('Do you want to create General journal for all the lines', false) then
                        GPTransfer_CU.AllGenJnlLine();

                end;
            }
            action("&Import")
            {
                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import data from excel.';
                trigger OnAction()
                begin
                    Import_CU.ImportGPData();
                end;
            }
            action("Open Gen. journal")
            {
                Caption = 'Open Gen. journal';
                Image = View;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Open the general journal entry';
                RunObject = page "General Journal";
                // RunPageLink = "Journal Template Name" = field("Journal Template Name"), "Journal Batch Name" = field("Journal Batch Name"), "Line No." = field("Journal Line No.");
                RunPageLink = "Document No." = field(ORDOCNUM);
            }


        }
    }


    var
        Import_CU: Codeunit ImportJobfiles;
        GPTransfer_CU: Codeunit GPTransferData;
}
