
report 50900 "Create Journal Entries"
{
    ApplicationArea = All;
    Caption = 'Create Journal Entries';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(CreateJournalEntries; "Create Journal Entries")
        {
            DataItemTableView = sorting("Entry No.");
            trigger OnPreDataItem()
            begin
                ReadExcelSheet();
                InsertData();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(JournalTemplate; JournalTemplate_Cod)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Journal Template';
                        TableRelation = "Gen. Journal Template";

                    }
                    field(JournalBatch; JournalBatch_Cod)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Journal Batch';
                        trigger OnLookup(var Text: Text): Boolean
                        var
                            JournalBatch_Rec: Record "Gen. Journal Batch";
                            JournalBatches_Pag: Page "General Journal Batches";
                        begin

                            JournalBatch_Rec.reset;
                            JournalBatch_Rec.SetRange("Journal Template Name", JournalTemplate_Cod);
                            JournalBatches_Pag.settableview(JournalBatch_Rec);
                            JournalBatches_Pag.lookupmode(true);
                            If JournalBatches_Pag.Runmodal = action::lookupok then begin
                                JournalBatches_Pag.getrecord(JournalBatch_Rec);
                                JournalBatch_Cod := JournalBatch_Rec.Name;
                            end;
                        end;
                    }
                }
            }
        }
    }
    procedure ReadExcelSheet()
    var
        FileMgt_Cdu: Codeunit "File Management";
        IStream: InStream;
        FromFile_lTxt: Text[100];
    begin
        UploadIntoStream(UploadExcelMsg_lbl, '', '', FromFile_lTxt, IStream);
        if FromFile_lTxt <> '' then begin
            FileName_gTxt := FileMgt_Cdu.GetFileName(FromFile_lTxt);
            // SheetName_gTxt := TempExcelBuffer_gRec.SelectSheetsNameStream(IStream);
        end else
            Error(NoFileFoundMsg_lbl);
        TempExcelBuffer_gRec.Reset();
        TempExcelBuffer_gRec.DeleteAll();
        TempExcelBuffer_gRec.OpenBookStream(IStream, 'Data');
        TempExcelBuffer_gRec.ReadSheet();
    end;

    local procedure GetValueatCell(RowNo: Integer; ColNo: Integer): Text
    begin
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.Get(RowNo, ColNo) then
            exit(TempExcelBuffer_gRec."Cell Value as Text")
        else
            exit('');
    end;

    procedure InsertData()
    var
        CreateJournalEntries_lRec: Record "Create Journal Entries";
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
        RowNo: Integer;
    begin
        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;

        CreateJournalEntries_lRec.Reset();
        if CreateJournalEntries_lRec.FindLast() then
            EntryNo := CreateJournalEntries_lRec."Entry No.";

        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        CreateJournalEntries_lRec.SetRange("File Name", FileName_gtxt);
        if CreateJournalEntries_lRec.FindFirst() then
            Error('File already exists in the system. Import aborted.');
        ProgressWindow.Open(Txt001_cTxt);
        ProgressWindow.Update(1, (MaxRowNo - 1));
        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            CreateJournalEntries_lRec.Init();
            CreateJournalEntries_lRec."Entry No." := EntryNo;
            Evaluate(CreateJournalEntries_lRec.Year, GetValueatCell(RowNo, 1));
            Evaluate(CreateJournalEntries_lRec.periodid, GetValueatCell(RowNo, 2));
            Evaluate(CreateJournalEntries_lRec.perdblnc, GetValueatCell(RowNo, 3));
            Evaluate(CreateJournalEntries_lRec."BC GL No", GetValueatCell(RowNo, 4));
            Evaluate(CreateJournalEntries_lRec.BCdimension1, GetValueatCell(RowNo, 5));
            Evaluate(CreateJournalEntries_lRec."GP ACTNUMST ", GetValueatCell(RowNo, 6));
            CreateJournalEntries_lRec."Document No" := DocumentNo(CreateJournalEntries_lRec);
            CreateJournalEntries_lRec."Posting Date" := PostingDate(CreateJournalEntries_lRec);
            CreateJournalEntries_lRec."Journal Template" := JournalTemplate_Cod;
            CreateJournalEntries_lRec."Journal Batch Name" := JournalBatch_Cod;
            CreateJournalEntries_lRec."File Name" := FileName_gTxt;
            CreateJournalEntries_lRec."Imported By" := UserId;
            CreateJournalEntries_lRec."Imported On Date" := CurrentDateTime;
            CreateJournalEntries_lRec.Insert(true);
            Counter += 1;
            ProgressWindow.Update(2, Counter);
        end;
        Message(ExcelImportSucess_lbl, Counter, (MaxRowNo - 1));
        ProgressWindow.Close();

    end;

    local procedure PostingDate(var CreateJournalEntries_vRec: Record "Create Journal Entries") vDate: Date
    begin
        if CreateJournalEntries_vRec.periodid = 0 then
            vDate := CALCDATE('<CM>', DMY2Date(1, 12, CreateJournalEntries_vRec."Year" - 1))
        else
            vdate := CALCDATE('<CM>', DMY2Date(1, CreateJournalEntries_vRec.periodid, CreateJournalEntries_vRec."Year"));
        exit(vDate);
    end;

    local procedure DocumentNo(var CreateJournalEntries_vRec: Record "Create Journal Entries") DocNo: Code[20]
    begin
        If ((CreateJournalEntries_vRec.Year = 2020) AND (CreateJournalEntries_vRec.periodid = 0)) then
            DocNo := 'OP-' + Format(CreateJournalEntries_vRec.Year) + '-' + Format(CreateJournalEntries_vRec.periodid)
        else
            DocNo := 'HIST-' + Format(CreateJournalEntries_vRec.Year) + '-' + Format(CreateJournalEntries_vRec.periodid);
        exit(DocNo);
    end;

    var
        JournalTemplate_Cod: Code[10];
        JournalBatch_Cod: Code[10];
        FileName_gTxt: Text[100];
        Entry_No_gInt: Integer;
        x: Integer;
        SheetName_gTxt: Text[100];
        TempExcelBuffer_gRec: Record "Excel Buffer" temporary;
        UploadExcelMsg_lbl: Label 'Please Choose the Excel file.';
        NoFileFoundMsg_lbl: Label 'No Excel file found!';
        ExcelImportSucess_lbl: Label '%1 lines out of %2 are successfully imported. ';
        Counter: Integer;
        ProgressWindow: Dialog;
        Txt001_cTxt: Label 'Processing.. \Total: #1 \Current: #2';
}