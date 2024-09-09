codeunit 50909 "Import Old Vs New Item Number"
{
    var

        FileName_gTxt: Text[100];
        Entry_No_gInt: Integer;
        SheetName_gTxt: Text[100];

        TempExcelBuffer_gRec: Record "Excel Buffer" temporary;
        UploadExcelMsg_lbl: Label 'Please Choose the Excel file.';
        NoFileFoundMsg_lbl: Label 'No Excel file found!';
        ExcelImportSucess_lbl: Label 'Excel is successfully imported.';
        OldvsNewItemNmbr_lRec: Record "Old vs New Item Number";

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

    procedure Import_OldvsNewItemNmbr()
    var

        RowNo: Integer;
        colNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin
        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;

        OldvsNewItemNmbr_lRec.Reset();
        if OldvsNewItemNmbr_lRec.FindLast() then
            EntryNo := OldvsNewItemNmbr_lRec."Entry No.";

        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            OldvsNewItemNmbr_lRec.Init();
            OldvsNewItemNmbr_lRec."Entry No." := EntryNo;
            If SheetName_gTxt = 'CA' then
                OldvsNewItemNmbr_lRec."Company Type" := CompanyType::SST
            else
                OldvsNewItemNmbr_lRec."Company Type" := CompanyType::SSTAZ;

            Evaluate(OldvsNewItemNmbr_lRec."GP ITEMNMBR", GetValueatCell(RowNo, 1));
            Evaluate(OldvsNewItemNmbr_lRec."Trim Item_Number CA", GetValueatCell(RowNo, 2));
            Evaluate(OldvsNewItemNmbr_lRec.GVnmbrChrtr, GetValueatCell(RowNo, 3));
            Evaluate(OldvsNewItemNmbr_lRec."BC New Item Number", GetValueatCell(RowNo, 4));
            Evaluate(OldvsNewItemNmbr_lRec.GVnmbrChrtrNew, GetValueatCell(RowNo, 5));
            Evaluate(OldvsNewItemNmbr_lRec.ItemType2, GetValueatCell(RowNo, 6));
            Evaluate(OldvsNewItemNmbr_lRec.ITEMTYPE, GetValueatCell(RowNo, 7));
            Evaluate(OldvsNewItemNmbr_lRec.ITMCLSCD, GetValueatCell(RowNo, 8));
            Evaluate(OldvsNewItemNmbr_lRec."Item Description", GetValueatCell(RowNo, 9));
            Evaluate(OldvsNewItemNmbr_lRec.USCATVLS_6, GetValueatCell(RowNo, 10));
            OldvsNewItemNmbr_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;
}
