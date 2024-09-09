page 50900 Renwicklist
{
    Caption = 'GP Job Transaction History';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = RenwickavTable;
    Editable = false;



    layout
    {
        area(Content)
        {
            repeater(Genral)
            {
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = All;
                }
                field(DocumentStatus; Rec.DocumentStatus)
                {
                    ApplicationArea = All;
                }
                field(SOPType; Rec.SOPType)
                {
                    ApplicationArea = All;
                }
                field(SOPNumber; Rec.SOPNumber)
                {
                    ApplicationArea = All;
                }
                field(OriginalNumber; Rec.OriginalNumber)
                {
                    ApplicationArea = All;
                }
                field(DocumentDate; Rec.DocumentDate)
                {
                    ApplicationArea = All;
                }
                field(ItemNumber; Rec.ItemNumber)
                {
                    ApplicationArea = All;
                }
                field(ItemDescription; Rec.ItemDescription)
                {
                    ApplicationArea = All;
                }
                field(QTY; Rec.QTY)
                {
                    ApplicationArea = All;
                }
                field(QTYRemaining; Rec.QTYRemaining)
                {
                    ApplicationArea = All;
                }
                field(UnitPrice; Rec.UnitPrice)
                {
                    ApplicationArea = All;
                }
                field(ExtendedPrice; Rec.ExtendedPrice)
                {
                    ApplicationArea = All;
                }
                field(StandardCost; Rec.StandardCost)
                {
                    ApplicationArea = All;
                }
                field(UnitCost; Rec.UnitCost)
                {
                    ApplicationArea = All;
                }
                field(ExtendedCost; Rec.ExtendedCost)
                {
                    ApplicationArea = All;
                }
                field(CustomerNumber; Rec.CustomerNumber)
                {
                    ApplicationArea = All;
                }
                field(PrimaryAddressCode; Rec.PrimaryAddressCode)
                {
                    ApplicationArea = All;
                }
                field(Phase; Rec.Phase)
                {
                    ApplicationArea = All;
                }
                field(LocationCode; Rec.LocationCode)
                {
                    ApplicationArea = All;
                }
                field(CreatedBy; Rec.CreatedBy)
                {
                    ApplicationArea = All;
                }
                field(CreatedDateTime; Rec.CreatedDateTime)
                {
                    ApplicationArea = All;
                }
                field(FileName; Rec.FileName)
                {
                    ApplicationArea = All;
                }
                field(SheetName; Rec.SheetName)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
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
                begin
                    if Confirm('Do you want to import the data', false) then begin
                        ReadExcelSheet();
                        ImportExcelData();
                    end;

                end;
            }
        }
    }
    var
        FileName: Text[100];
        SheetName: Text[100];
        TempExcelBuffer: Record "Excel Buffer" temporary;
        UploadExcelMsg: Label 'Please Choose the Excel file.';
        NoFileFoundMsg: Label 'No Excel file found!';
        ExcelImportSucess: Label 'Excel is successfully imported.';

    local procedure ReadExcelSheet()
    var
        FileMgt: Codeunit "File Management";
        IStream: InStream;
        FromFile: Text[100];
    begin
        UploadIntoStream(UploadExcelMsg, '', '', FromFile, IStream);
        if FromFile <> '' then begin
            FileName := FileMgt.GetFileName(FromFile);
            SheetName := TempExcelBuffer.SelectSheetsNameStream(IStream);
        end else
            Error(NoFileFoundMsg);
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(IStream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    local procedure ImportExcelData()
    var
        RenwickavRecord: Record RenwickavTable;
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        ProgressWindow: Dialog;
    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        RenwickavRecord.Reset();
        if RenwickavRecord.FindLast() then
            LineNo := RenwickavRecord.EntryNo
        else
            LineNo := 0;
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRowNo := TempExcelBuffer."Row No.";
        end;
        ProgressWindow.Open('Processing...\Total: #1##################\Current: #2##################');
        ProgressWindow.Update(1, MaxRowNo);
        for RowNo := 2 to MaxRowNo do begin
            LineNo += 1;
            ProgressWindow.Update(2, LineNo);
            RenwickavRecord.Init();
            RenwickavRecord.EntryNo := LineNo;
            Evaluate(RenwickavRecord.DocumentStatus, GetValueAtCell(RowNo, 1));
            Evaluate(RenwickavRecord.SOPType, GetValueAtCell(RowNo, 2));
            Evaluate(RenwickavRecord.SOPNumber, GetValueAtCell(RowNo, 3));
            Evaluate(RenwickavRecord.OriginalNumber, GetValueAtCell(RowNo, 4));
            Evaluate(RenwickavRecord.DocumentDate, GetValueAtCell(RowNo, 5));
            Evaluate(RenwickavRecord.ItemNumber, GetValueAtCell(RowNo, 6));
            Evaluate(RenwickavRecord.ItemDescription, GetValueAtCell(RowNo, 7));
            if GetValueAtCell(RowNo, 8) <> '' then
                Evaluate(RenwickavRecord.QTY, Format(GetValueAtCell(RowNo, 8)))
            else
                Evaluate(RenwickavRecord.QTY, Format(0.0));
            if GetValueAtCell(RowNo, 9) <> '' then
                Evaluate(RenwickavRecord.QTYRemaining, Format(GetValueAtCell(RowNo, 9)))
            else
                Evaluate(RenwickavRecord.QTYRemaining, Format(0.0));
            if GetValueAtCell(RowNo, 10) <> '' then
                Evaluate(RenwickavRecord.UnitPrice, Format(GetValueAtCell(RowNo, 10)))
            else
                Evaluate(RenwickavRecord.UnitPrice, Format(0.0));
            if GetValueAtCell(RowNo, 11) <> '' then
                Evaluate(RenwickavRecord.ExtendedPrice, Format(GetValueAtCell(RowNo, 11)))
            else
                Evaluate(RenwickavRecord.ExtendedPrice, Format(0.0));
            if GetValueAtCell(RowNo, 12) <> '' then
                Evaluate(RenwickavRecord.StandardCost, Format(GetValueAtCell(RowNo, 12)))
            else
                Evaluate(RenwickavRecord.StandardCost, Format(0.0));
            if GetValueAtCell(RowNo, 13) <> '' then
                Evaluate(RenwickavRecord.UnitCost, Format(GetValueAtCell(RowNo, 13)))
            else
                Evaluate(RenwickavRecord.UnitCost, Format(0.0));
            if GetValueAtCell(RowNo, 14) <> '' then
                Evaluate(RenwickavRecord.ExtendedCost, Format(GetValueAtCell(RowNo, 14)))
            else
                Evaluate(RenwickavRecord.ExtendedCost, Format(0.0));
            Evaluate(RenwickavRecord.CustomerNumber, GetValueAtCell(RowNo, 15));
            Evaluate(RenwickavRecord.PrimaryAddressCode, GetValueAtCell(RowNo, 16));
            Evaluate(RenwickavRecord.Phase, GetValueAtCell(RowNo, 17));
            Evaluate(RenwickavRecord.LocationCode, GetValueAtCell(RowNo, 18));
            RenwickavRecord.FileName := FileName;
            RenwickavRecord.SheetName := SheetName;
            RenwickavRecord.CreatedBy := UserId;
            RenwickavRecord.CreatedDateTime := CurrentDateTime;
            RenwickavRecord.Insert();

        end;
        Message(ExcelImportSucess);
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin
        TempExcelBuffer.Reset();
        If TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;
}