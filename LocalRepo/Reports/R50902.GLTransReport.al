
report 50902 "GL Trans"
{
    ApplicationArea = All;
    Caption = 'GL Trans 2024';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem("GL Trans"; "GL Trans")
        {
            DataItemTableView = sorting(EntryNo);
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
            SheetName_gTxt := TempExcelBuffer_gRec.SelectSheetsNameStream(IStream);
        end else
            Error(NoFileFoundMsg_lbl);
        TempExcelBuffer_gRec.Reset();
        TempExcelBuffer_gRec.DeleteAll();
        TempExcelBuffer_gRec.OpenBookStream(IStream, SheetName_gTxt);
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
        GLTrans_lRec: Record "GL Trans";
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

        GLTrans_lRec.Reset();
        if GLTrans_lRec.FindLast() then
            EntryNo := GLTrans_lRec.EntryNo;

        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        GLTrans_lRec.SetRange(FileName, FileName_gtxt);
        if GLTrans_lRec.FindFirst() then
            Error('File already exists in the system. Import aborted.');
        ProgressWindow.Open(Txt001_cTxt);
        ProgressWindow.Update(1, (MaxRowNo - 1));
        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            GLTrans_lRec.Init();
            GLTrans_lRec.EntryNo := EntryNo;
            Evaluate(GLTrans_lRec.JRNENTRY, GetValueatCell(RowNo, 1));
            Evaluate(GLTrans_lRec.OPENYEAR, GetValueatCell(RowNo, 2));
            Evaluate(GLTrans_lRec.PERIODID, GetValueatCell(RowNo, 3));
            Evaluate(GLTrans_lRec.ACTNUMBR_1, GetValueatCell(RowNo, 4));
            Evaluate(GLTrans_lRec.ACTNUMBR_3, GetValueatCell(RowNo, 5));
            Evaluate(GLTrans_lRec.ACTNUMST, GetValueatCell(RowNo, 6));
            Evaluate(GLTrans_lRec.TRXDATE, GetValueatCell(RowNo, 7));
            Evaluate(GLTrans_lRec.ORMSTRID, GetValueatCell(RowNo, 8));
            Evaluate(GLTrans_lRec.DEBITAMT, GetValueatCell(RowNo, 9));
            Evaluate(GLTrans_lRec.CRDTAMNT, GetValueatCell(RowNo, 10));
            Evaluate(GLTrans_lRec.Net_DrCr, GetValueatCell(RowNo, 11));
            Evaluate(GLTrans_lRec.SOURCDOC, GetValueatCell(RowNo, 12));
            Evaluate(GLTrans_lRec.ORMSTRNM, GetValueatCell(RowNo, 13));
            Evaluate(GLTrans_lRec.BACHNUMB, GetValueatCell(RowNo, 14));
            Evaluate(GLTrans_lRec.ORDOCNUM, GetValueatCell(RowNo, 15));
            Evaluate(GLTrans_lRec.DSCRIPTN, GetValueatCell(RowNo, 16));
            Evaluate(GLTrans_lRec.ORGNTSRC, GetValueatCell(RowNo, 17));
            Evaluate(GLTrans_lRec.VOIDED, GetValueatCell(RowNo, 18));
            Evaluate(GLTrans_lRec.GPsegment1, GetValueatCell(RowNo, 19));
            Evaluate(GLTrans_lRec.BCdimension1, GetValueatCell(RowNo, 20));
            Evaluate(GLTrans_lRec.BCdscriptnDim1, GetValueatCell(RowNo, 21));
            Evaluate(GLTrans_lRec.GPAcctNmbr, GetValueatCell(RowNo, 22));
            Evaluate(GLTrans_lRec.BCGLNo, GetValueatCell(RowNo, 23));
            Evaluate(GLTrans_lRec.BCGLName, GetValueatCell(RowNo, 24));
            Evaluate(GLTrans_lRec.BCIncomeBalance, GetValueatCell(RowNo, 25));
            Evaluate(GLTrans_lRec.BCAccountCategory, GetValueatCell(RowNo, 26));
            Evaluate(GLTrans_lRec.BCAccountSubcategory, GetValueatCell(RowNo, 27));
            Evaluate(GLTrans_lRec.BCAccountType, GetValueatCell(RowNo, 28));
            Evaluate(GLTrans_lRec.REFRENCE, GetValueatCell(RowNo, 29));
            Evaluate(GLTrans_lRec.JobrelatedORnot, GetValueatCell(RowNo, 30));
            Evaluate(GLTrans_lRec.JobORNOTJobrelated, GetValueatCell(RowNo, 31));
            Evaluate(GLTrans_lRec.JobORNull, GetValueatCell(RowNo, 32));
            GLTrans_lRec.JournalTemplate := JournalTemplate_Cod;
            GLTrans_lRec.JournalbatchName := JournalBatch_Cod;
            GLTrans_lRec.FileName := FileName_gTxt;
            GLTrans_lRec.ImportedBY := UserId;
            GLTrans_lRec.ImportedOnDate := CurrentDateTime;
            GLTrans_lRec.Insert(true);
            Counter += 1;
            ProgressWindow.Update(2, Counter);
        end;
        Message(ExcelImportSucess_lbl, Counter, (MaxRowNo - 1));
        ProgressWindow.Close();

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
