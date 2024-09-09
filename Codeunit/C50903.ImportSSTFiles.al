

codeunit 50903 "Import SST Files"
{
    var

        FileName_gTxt: Text[100];
        Entry_No_gInt: Integer;
        SheetName_gTxt: Text[100];

        TempExcelBuffer_gRec: Record "Excel Buffer" temporary;
        UploadExcelMsg_lbl: Label 'Please Choose the Excel file.';
        NoFileFoundMsg_lbl: Label 'No Excel file found!';
        ExcelImportSucess_lbl: Label 'Excel is successfully imported.';


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

    procedure Import_COA_GP_and_BC_Map()
    var
        COA_GPToBC_lRec: Record "COA GP and BC Map";
        RowNo: Integer;
        colNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin
        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        COA_GPToBC_lRec.Reset();
        if COA_GPToBC_lRec.FindLast() then
            EntryNo := COA_GPToBC_lRec."Entry No";

        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            COA_GPToBC_lRec.Init();
            COA_GPToBC_lRec."Entry No" := EntryNo;
            Evaluate(COA_GPToBC_lRec."Account Number", GetValueatCell(RowNo, 1));
            Evaluate(COA_GPToBC_lRec.Natural, GetValueatCell(RowNo, 2));
            Evaluate(COA_GPToBC_lRec.Office, GetValueatCell(RowNo, 3));
            Evaluate(COA_GPToBC_lRec.Product, GetValueatCell(RowNo, 4));
            Evaluate(COA_GPToBC_lRec."Sub Product", GetValueatCell(RowNo, 5));
            Evaluate(COA_GPToBC_lRec."GL Code", GetValueatCell(RowNo, 6));
            Evaluate(COA_GPToBC_lRec."GL Description", GetValueatCell(RowNo, 7));
            Evaluate(COA_GPToBC_lRec.Dimension, GetValueatCell(RowNo, 8));
            Evaluate(COA_GPToBC_lRec."Dimension Value Code", GetValueatCell(RowNo, 9));
            COA_GPToBC_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure Import_SegementDimensionMapping()
    var
        SegmentDimensionsMap_lRec: Record "Segment Dimension Mapping";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin
        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        SegmentDimensionsMap_lRec.Reset();
        if SegmentDimensionsMap_lRec.FindLast() then
            EntryNo := SegmentDimensionsMap_lRec."Entry No";

        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            SegmentDimensionsMap_lRec.Init();
            SegmentDimensionsMap_lRec."Entry No" := EntryNo;
            Evaluate(SegmentDimensionsMap_lRec."Segment Number", GetValueatCell(RowNo, 1));
            Evaluate(SegmentDimensionsMap_lRec."Segment Code", GetValueatCell(RowNo, 2));
            Evaluate(SegmentDimensionsMap_lRec."Old Dimension", GetValueatCell(RowNo, 3));
            Evaluate(SegmentDimensionsMap_lRec."Old Dimension Code", GetValueatCell(RowNo, 4));
            Evaluate(SegmentDimensionsMap_lRec."New Dimension", GetValueatCell(RowNo, 5));
            Evaluate(SegmentDimensionsMap_lRec."New Dimension Code", GetValueatCell(RowNo, 6));
            SegmentDimensionsMap_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure Import_CreditCardFees()
    var
        CreditCardFees_lRec: Record "Credit Card Fees";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin
        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        CreditCardFees_lRec.Reset();
        if CreditCardFees_lRec.FindLast() then
            EntryNo := CreditCardFees_lRec."Entry No";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            CreditCardFees_lRec.Init();
            CreditCardFees_lRec."Entry No" := EntryNo;
            Evaluate(CreditCardFees_lRec.Credit_Card, GetValueatCell(RowNo, 1));
            Evaluate(CreditCardFees_lRec.CC_Fee_Rate, GetValueatCell(RowNo, 2));

            CreditCardFees_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure ImportEE4Pts_Project()
    var
        EE4Pts_Project_lRec: Record "EE4Pts Project";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        EE4Pts_Project_lRec.Reset();
        if EE4Pts_Project_lRec.FindLast() then
            EntryNo := EE4Pts_Project_lRec."Entry No";

        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            EE4Pts_Project_lRec.Init();
            EE4Pts_Project_lRec."Entry No" := EntryNo;
            Evaluate(EE4Pts_Project_lRec.GVEmployeeCode, GetValueatCell(RowNo, 1));
            Evaluate(EE4Pts_Project_lRec.GVEEname, GetValueatCell(RowNo, 2));
            EE4Pts_Project_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure ImportClassTable()
    var
        ClassTable_lRec: Record "Class Table";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        ClassTable_lRec.Reset();
        if ClassTable_lRec.FindLast() then
            EntryNo := ClassTable_lRec."Entry No";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            ClassTable_lRec.Init();
            ClassTable_lRec."Entry No" := EntryNo;
            Evaluate(ClassTable_lRec.ID, GetValueatCell(RowNo, 1));
            Evaluate(ClassTable_lRec.Class_ID, GetValueatCell(RowNo, 2));
            Evaluate(ClassTable_lRec.Builder_Type, GetValueatCell(RowNo, 3));
            Evaluate(ClassTable_lRec.Mon_Y_N, GetValueatCell(RowNo, 4));
            Evaluate(ClassTable_lRec.Div_Map, GetValueatCell(RowNo, 5));
            ClassTable_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure ImportGLDivision()
    var
        GLDivision1_lRec: Record "GL Division 1";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        GLDivision1_lRec.Reset();
        if GLDivision1_lRec.FindLast() then
            EntryNo := GLDivision1_lRec."Entry No";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            GLDivision1_lRec.Init();
            GLDivision1_lRec."Entry No" := EntryNo;
            Evaluate(GLDivision1_lRec.GVDivisions, GetValueatCell(RowNo, 1));
            Evaluate(GLDivision1_lRec.GL_Divisions, GetValueatCell(RowNo, 2));
            GLDivision1_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure ImportInvtyCommercial()
    var
        InvtyCommercial_lRec: Record "Invty Commercial";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        InvtyCommercial_lRec.Reset();
        if InvtyCommercial_lRec.FindLast() then
            EntryNo := InvtyCommercial_lRec."Entry No";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            InvtyCommercial_lRec.Init();
            InvtyCommercial_lRec."Entry No" := EntryNo;
            Evaluate(InvtyCommercial_lRec."ITEMNMBR Comm Table", GetValueatCell(RowNo, 1));
            Evaluate(InvtyCommercial_lRec."GV Invty Category", GetValueatCell(RowNo, 2));
            InvtyCommercial_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure Import_InvtyItemOpenEye()
    var
        InvtyItemOpenEye_lRec: Record "Invty Item OpenEye";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        InvtyItemOpenEye_lRec.Reset();
        if InvtyItemOpenEye_lRec.FindLast() then
            EntryNo := InvtyItemOpenEye_lRec."Entry No";

        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin

            EntryNo := EntryNo + 1;
            InvtyItemOpenEye_lRec.Init();
            InvtyItemOpenEye_lRec."Entry No" := EntryNo;
            Evaluate(InvtyItemOpenEye_lRec.ItemNMBR, GetValueatCell(RowNo, 1));
            Evaluate(InvtyItemOpenEye_lRec.ItemDscr, GetValueatCell(RowNo, 2));
            Evaluate(InvtyItemOpenEye_lRec.ItemType, GetValueatCell(RowNo, 3));
            Evaluate(InvtyItemOpenEye_lRec.ItemClassCode, GetValueatCell(RowNo, 4));
            Evaluate(InvtyItemOpenEye_lRec.CurrentCost, GetValueatCell(RowNo, 5));
            InvtyItemOpenEye_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure Import_ItemNumberKit()
    var
        ItemNumberKit_lRec: Record "Invty Kits Sec Panel";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        ItemNumberKit_lRec.Reset();
        if ItemNumberKit_lRec.FindLast() then
            EntryNo := ItemNumberKit_lRec."Entry No";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            ItemNumberKit_lRec.Init();
            ItemNumberKit_lRec."Entry No" := EntryNo;
            Evaluate(ItemNumberKit_lRec."Item Number (Kit)", GetValueatCell(RowNo, 1));
            ItemNumberKit_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure Import_MonthQtr()
    var
        MonthQtr_lRec: Record MonthQtr;
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        MonthQtr_lRec.Reset();
        if MonthQtr_lRec.FindLast() then
            EntryNo := MonthQtr_lRec."Entry No";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            MonthQtr_lRec.Init();
            MonthQtr_lRec."Entry No" := EntryNo;
            Evaluate(MonthQtr_lRec.Month, GetValueatCell(RowNo, 1));
            Evaluate(MonthQtr_lRec.Qtr, GetValueatCell(RowNo, 2));
            Evaluate(MonthQtr_lRec.Qtr_, GetValueatCell(RowNo, 3));
            MonthQtr_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;


    procedure Import_InvtyPriceMethod()
    var
        InvtyPriceMethod_lRec: Record "Invty PriceMethod";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        InvtyPriceMethod_lRec.Reset();
        if InvtyPriceMethod_lRec.FindLast() then
            EntryNo := InvtyPriceMethod_lRec."Entry No";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            InvtyPriceMethod_lRec.Init();
            InvtyPriceMethod_lRec."Entry No" := EntryNo;
            Evaluate(InvtyPriceMethod_lRec.PriceMth, GetValueatCell(RowNo, 1));
            Evaluate(InvtyPriceMethod_lRec.Price_Method, GetValueatCell(RowNo, 2));
            InvtyPriceMethod_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure Import_SOPStatus()
    var
        SOPStatus_lRec: Record SOPStatus;
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        SOPStatus_lRec.Reset();
        if SOPStatus_lRec.FindLast() then
            EntryNo := SOPStatus_lRec."Entry No";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            SOPStatus_lRec.Init();
            SOPStatus_lRec."Entry No" := EntryNo;
            Evaluate(SOPStatus_lRec.GVSOPstatus, GetValueatCell(RowNo, 1));
            Evaluate(SOPStatus_lRec.SOPStatusDescr, GetValueatCell(RowNo, 2));
            SOPStatus_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure Import_StdOpt()
    var
        StdOpt_lRec: Record StdOpt;
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        StdOpt_lRec.Reset();
        if StdOpt_lRec.FindLast() then
            EntryNo := StdOpt_lRec."Entry No";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            StdOpt_lRec.Init();
            StdOpt_lRec."Entry No" := EntryNo;
            Evaluate(StdOpt_lRec.Last2Char, GetValueatCell(RowNo, 1));
            Evaluate(StdOpt_lRec."Std or Opt", GetValueatCell(RowNo, 2));
            Evaluate(StdOpt_lRec."Std.Opt.abr", GetValueatCell(RowNo, 3));
            StdOpt_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure Import_SvcJobs()
    var
        SvcJobs_lRec: Record "Svc Jobs";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        SvcJobs_lRec.Reset();
        if SvcJobs_lRec.FindLast() then
            EntryNo := SvcJobs_lRec."Entry No";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            SvcJobs_lRec.Init();
            SvcJobs_lRec."Entry No" := EntryNo;
            Evaluate(SvcJobs_lRec.SvcJobs, GetValueatCell(RowNo, 1));
            Evaluate(SvcJobs_lRec.Divisions, GetValueatCell(RowNo, 2));
            Evaluate(SvcJobs_lRec."GL Div", GetValueatCell(RowNo, 3));
            SvcJobs_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure Import_UPRTRXCDmap()
    var
        UPRTRXCDmap_lRec: Record UPRTRXCDmap;
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        UPRTRXCDmap_lRec.Reset();

        if UPRTRXCDmap_lRec.FindLast() then
            EntryNo := UPRTRXCDmap_lRec."Entry No";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            UPRTRXCDmap_lRec.Init();
            UPRTRXCDmap_lRec."Entry No" := EntryNo;
            Evaluate(UPRTRXCDmap_lRec.GVUPRTRXCD, GetValueatCell(RowNo, 1));
            Evaluate(UPRTRXCDmap_lRec.Gvcode, GetValueatCell(RowNo, 2));
            UPRTRXCDmap_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure Import_Wire()
    var
        Wire_lRec: Record Wire;
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        Wire_lRec.Reset();
        if Wire_lRec.FindLast() then
            EntryNo := Wire_lRec."Entry No";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            Wire_lRec.Init();
            EntryNo := EntryNo + 1;
            Wire_lRec."Entry No" := EntryNo;
            Evaluate(Wire_lRec.ItemNumber, GetValueatCell(RowNo, 2));
            Evaluate(Wire_lRec.ItemClassCode, GetValueatCell(RowNo, 1));
            Evaluate(Wire_lRec.ItemDescr, GetValueatCell(RowNo, 3));
            Evaluate(Wire_lRec.ItemType, GetValueatCell(RowNo, 4));
            Evaluate(Wire_lRec.Phase, GetValueatCell(RowNo, 5));
            Evaluate(Wire_lRec."Bill / Sale", GetValueatCell(RowNo, 6));
            Wire_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure Import_InvtyDeadCommercialTag()
    var
        InvtyDeadCommercialTag_lRec: Record "Invty Dead Commercial Tag";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        InvtyDeadCommercialTag_lRec.Reset();
        if InvtyDeadCommercialTag_lRec.FindLast() then
            EntryNo := InvtyDeadCommercialTag_lRec."Entry No.";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            InvtyDeadCommercialTag_lRec.Init();
            EntryNo := EntryNo + 1;
            InvtyDeadCommercialTag_lRec."Entry No." := EntryNo;
            Evaluate(InvtyDeadCommercialTag_lRec.DeadCommercial, GetValueatCell(RowNo, 1));
            Evaluate(InvtyDeadCommercialTag_lRec.D_ITEMNMBR, GetValueatCell(RowNo, 2));
            Evaluate(InvtyDeadCommercialTag_lRec.D_ITEMDESC, GetValueatCell(RowNo, 3));
            InvtyDeadCommercialTag_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);

    end;


    procedure Import_InvtyElecwire()
    var
        InvtyElecwire_lRec: Record "Invty Elecwire";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        InvtyElecwire_lRec.Reset();
        if InvtyElecwire_lRec.FindLast() then
            EntryNo := InvtyElecwire_lRec."Entry No.";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            InvtyElecwire_lRec.Init();
            EntryNo := EntryNo + 1;
            InvtyElecwire_lRec."Entry No." := EntryNo;
            Evaluate(InvtyElecwire_lRec.ItemNmbr, GetValueatCell(RowNo, 1));
            Evaluate(InvtyElecwire_lRec.ItemDescrip, GetValueatCell(RowNo, 2));

            InvtyElecwire_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure Import_ManBllgBill2Ship2Address()
    var
        ManBllgBill2Ship2Address_lRec: Record ManBllgBill2Ship2Address;
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        ManBllgBill2Ship2Address_lRec.Reset();
        if ManBllgBill2Ship2Address_lRec.FindLast() then
            EntryNo := ManBllgBill2Ship2Address_lRec.EntryNo;
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            ManBllgBill2Ship2Address_lRec.Init();
            EntryNo := EntryNo + 1;
            ManBllgBill2Ship2Address_lRec.EntryNo := EntryNo;
            Evaluate(ManBllgBill2Ship2Address_lRec.Contract, GetValueatCell(RowNo, 1));
            Evaluate(ManBllgBill2Ship2Address_lRec.Cust, GetValueatCell(RowNo, 2));
            Evaluate(ManBllgBill2Ship2Address_lRec.Cust_Name, GetValueatCell(RowNo, 3));
            Evaluate(ManBllgBill2Ship2Address_lRec.dbo_SV00500_ADRSCODE, GetValueatCell(RowNo, 4));
            Evaluate(ManBllgBill2Ship2Address_lRec.dbo_RM00101_ADRSCODE, GetValueatCell(RowNo, 5));
            Evaluate(ManBllgBill2Ship2Address_lRec.CUSTCLAS, GetValueatCell(RowNo, 6));
            Evaluate(ManBllgBill2Ship2Address_lRec.BillTo_Name, GetValueatCell(RowNo, 7));
            Evaluate(ManBllgBill2Ship2Address_lRec.BillToAddr1, GetValueatCell(RowNo, 8));
            Evaluate(ManBllgBill2Ship2Address_lRec.BillToAddr2, GetValueatCell(RowNo, 9));
            Evaluate(ManBllgBill2Ship2Address_lRec.BillToAddr3, GetValueatCell(RowNo, 10));
            Evaluate(ManBllgBill2Ship2Address_lRec.BillToAddr4, GetValueatCell(RowNo, 11));
            Evaluate(ManBllgBill2Ship2Address_lRec.BillTo_City, GetValueatCell(RowNo, 12));
            Evaluate(ManBllgBill2Ship2Address_lRec.BillTo_State, GetValueatCell(RowNo, 13));
            Evaluate(ManBllgBill2Ship2Address_lRec.BillTo_Zip, GetValueatCell(RowNo, 14));
            Evaluate(ManBllgBill2Ship2Address_lRec.ShipTo_Name, GetValueatCell(RowNo, 15));
            Evaluate(ManBllgBill2Ship2Address_lRec.ShipToAddr1, GetValueatCell(RowNo, 16));
            Evaluate(ManBllgBill2Ship2Address_lRec.ShipToAddr2, GetValueatCell(RowNo, 17));
            Evaluate(ManBllgBill2Ship2Address_lRec.ShipToAddr3, GetValueatCell(RowNo, 18));
            Evaluate(ManBllgBill2Ship2Address_lRec.ShipToAddr4, GetValueatCell(RowNo, 19));
            Evaluate(ManBllgBill2Ship2Address_lRec.ShipTo_City, GetValueatCell(RowNo, 20));
            Evaluate(ManBllgBill2Ship2Address_lRec.ShipTo_State, GetValueatCell(RowNo, 21));
            Evaluate(ManBllgBill2Ship2Address_lRec.ShipTo_Zip, GetValueatCell(RowNo, 22));
            Evaluate(ManBllgBill2Ship2Address_lRec.Description, GetValueatCell(RowNo, 23));
            Evaluate(ManBllgBill2Ship2Address_lRec.Development, GetValueatCell(RowNo, 24));
            ManBllgBill2Ship2Address_lRec.Insert();

        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure Import_InvtyItemTypeDescr()
    var
        InvtyItemTypeDescr_lRec: Record "Invtry Item Type";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        InvtyItemTypeDescr_lRec.Reset();
        if InvtyItemTypeDescr_lRec.FindLast() then
            EntryNo := InvtyItemTypeDescr_lRec."Entry No.";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            InvtyItemTypeDescr_lRec.Init();
            EntryNo := EntryNo + 1;
            InvtyItemTypeDescr_lRec."Entry No." := EntryNo;
            Evaluate(InvtyItemTypeDescr_lRec."Item Type1", GetValueatCell(RowNo, 1));
            Evaluate(InvtyItemTypeDescr_lRec."Item Type2", GetValueatCell(RowNo, 2));

            InvtyItemTypeDescr_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure Import_DivisionCrosswalkToBCDim1()
    var
        DivisionCrosswalkToBCDim1_lRec: Record "DivisionCrosswalk to BC Dim1";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        DivisionCrosswalkToBCDim1_lRec.Reset();
        if DivisionCrosswalkToBCDim1_lRec.FindLast() then
            EntryNo := DivisionCrosswalkToBCDim1_lRec."Entry No.";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            DivisionCrosswalkToBCDim1_lRec.Init();
            EntryNo := EntryNo + 1;
            DivisionCrosswalkToBCDim1_lRec."Entry No." := EntryNo;
            Evaluate(DivisionCrosswalkToBCDim1_lRec.GVDivisions, GetValueatCell(RowNo, 1));
            Evaluate(DivisionCrosswalkToBCDim1_lRec.GL_Divisions, GetValueatCell(RowNo, 2));
            Evaluate(DivisionCrosswalkToBCDim1_lRec.BCdimension1, GetValueatCell(RowNo, 3));
            Evaluate(DivisionCrosswalkToBCDim1_lRec.BCdscriptnDim1, GetValueatCell(RowNo, 4));
            DivisionCrosswalkToBCDim1_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;


    procedure Import_POCChg()
    var
        POCChg_lRec: Record "POC Chg";
        RowNo: Integer;
        colNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
        TempDecimal: Decimal;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        POCChg_lRec.Reset();
        if POCChg_lRec.FindLast() then
            EntryNo := POCChg_lRec."Entry No.";
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            POCChg_lRec.Init();
            EntryNo := EntryNo + 1;
            POCChg_lRec."Entry No." := EntryNo;
            Evaluate(POCChg_lRec.POCJobNumber, GetValueatCell(RowNo, 1));
            Evaluate(POCChg_lRec.POCchgJul2015, GetValueatCell(RowNo, 2));
            POCChg_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure ImportContractRevenueHIST()
    var
        ContractRevenueMethodHist_lRec: Record "Contract Revenue Method Hist";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        ContractRevenueMethodHist_lRec.Reset();

        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin

            Entry_No_gInt := Entry_No_gInt + 1;

            ContractRevenueMethodHist_lRec.Init();

            ContractRevenueMethodHist_lRec.EntryNo := Entry_No_gInt;
            Evaluate(ContractRevenueMethodHist_lRec.CUSTNMBR, GetValueatCell(RowNo, 1));
            Evaluate(ContractRevenueMethodHist_lRec.ADRSCODE, GetValueatCell(RowNo, 2));
            Evaluate(ContractRevenueMethodHist_lRec.Contract_Number, GetValueatCell(RowNo, 3));
            Evaluate(ContractRevenueMethodHist_lRec.WSCONTSQ, GetValueatCell(RowNo, 4));
            Evaluate(ContractRevenueMethodHist_lRec.SEQNUMBR, GetValueatCell(RowNo, 5));
            Evaluate(ContractRevenueMethodHist_lRec.Wennsoft_Affiliate, GetValueatCell(RowNo, 6));
            Evaluate(ContractRevenueMethodHist_lRec.Wennsoft_Region, GetValueatCell(RowNo, 7));
            Evaluate(ContractRevenueMethodHist_lRec.Wennsoft_Branch, GetValueatCell(RowNo, 8));
            Evaluate(ContractRevenueMethodHist_lRec.USERID, GetValueatCell(RowNo, 9));
            Evaluate(ContractRevenueMethodHist_lRec.Technician_ID, GetValueatCell(RowNo, 10));
            Evaluate(ContractRevenueMethodHist_lRec.Technician_Team, GetValueatCell(RowNo, 11));
            Evaluate(ContractRevenueMethodHist_lRec.YEAR1, GetValueatCell(RowNo, 12));
            Evaluate(ContractRevenueMethodHist_lRec.PERIODID, GetValueatCell(RowNo, 13));
            Evaluate(ContractRevenueMethodHist_lRec.DOCAMNT, GetValueatCell(RowNo, 14));
            Evaluate(ContractRevenueMethodHist_lRec.DATE1, GetValueatCell(RowNo, 15));
            Evaluate(ContractRevenueMethodHist_lRec.Wennsoft_Close_Date, GetValueatCell(RowNo, 16));
            Evaluate(ContractRevenueMethodHist_lRec.POSTDATE, GetValueatCell(RowNo, 17));
            Evaluate(ContractRevenueMethodHist_lRec.WS_Closed, GetValueatCell(RowNo, 18));
            Evaluate(ContractRevenueMethodHist_lRec.MODIFDT, GetValueatCell(RowNo, 19));
            Evaluate(ContractRevenueMethodHist_lRec.Modified_Time, GetValueatCell(RowNo, 20));
            Evaluate(ContractRevenueMethodHist_lRec.MDFUSRID, GetValueatCell(RowNo, 21));
            Evaluate(ContractRevenueMethodHist_lRec.Time_Zone, GetValueatCell(RowNo, 22));
            Evaluate(ContractRevenueMethodHist_lRec.Base_Currency_ID, GetValueatCell(RowNo, 23));
            Evaluate(ContractRevenueMethodHist_lRec.Base_Curr_Conv_Factor, GetValueatCell(RowNo, 24));
            Evaluate(ContractRevenueMethodHist_lRec.Billing_Currency_ID, GetValueatCell(RowNo, 25));
            Evaluate(ContractRevenueMethodHist_lRec.Billing_Curr_Conv_Factor, GetValueatCell(RowNo, 26));
            Evaluate(ContractRevenueMethodHist_lRec.Local_Currency_ID, GetValueatCell(RowNo, 27));
            Evaluate(ContractRevenueMethodHist_lRec.GLJournalEntry, GetValueatCell(RowNo, 28));
            Evaluate(ContractRevenueMethodHist_lRec.PB_ACTINDX, GetValueatCell(RowNo, 29));
            Evaluate(ContractRevenueMethodHist_lRec.CE_ACTINDX, GetValueatCell(RowNo, 30));
            Evaluate(ContractRevenueMethodHist_lRec.PB_SEQNUMBR, GetValueatCell(RowNo, 31));
            Evaluate(ContractRevenueMethodHist_lRec.CE_SEQNUMBR, GetValueatCell(RowNo, 32));
            Evaluate(ContractRevenueMethodHist_lRec.WSReserved_CB1, GetValueatCell(RowNo, 33));
            Evaluate(ContractRevenueMethodHist_lRec.WSReserved_CB2, GetValueatCell(RowNo, 34));
            Evaluate(ContractRevenueMethodHist_lRec.WSReserved_CB3, GetValueatCell(RowNo, 35));
            Evaluate(ContractRevenueMethodHist_lRec.WSReserved_CB4, GetValueatCell(RowNo, 36));
            Evaluate(ContractRevenueMethodHist_lRec.WSReserved_CB5, GetValueatCell(RowNo, 37));
            Evaluate(ContractRevenueMethodHist_lRec.WSReserved_STR1, GetValueatCell(RowNo, 38));
            Evaluate(ContractRevenueMethodHist_lRec.WSReserved_STR2, GetValueatCell(RowNo, 39));
            Evaluate(ContractRevenueMethodHist_lRec.RMDTYPAL, GetValueatCell(RowNo, 40));
            Evaluate(ContractRevenueMethodHist_lRec.ACTINDX_CR, GetValueatCell(RowNo, 41));
            Evaluate(ContractRevenueMethodHist_lRec.ACTINDX_DR, GetValueatCell(RowNo, 42));
            Evaluate(ContractRevenueMethodHist_lRec.Reference_TRX_Number, GetValueatCell(RowNo, 43));
            Evaluate(ContractRevenueMethodHist_lRec.JRNENTRY, GetValueatCell(RowNo, 44));
            Evaluate(ContractRevenueMethodHist_lRec.LNSEQNBR, GetValueatCell(RowNo, 45));
            Evaluate(ContractRevenueMethodHist_lRec.Contract_Sequence_Number, GetValueatCell(RowNo, 46));
            Evaluate(ContractRevenueMethodHist_lRec.DEX_ROW_ID, GetValueatCell(RowNo, 47));


            ContractRevenueMethodHist_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    procedure ImportContractRevenueMSTR()
    var
        ContractRevenueMethodMSTR_lRec: Record "Contract Revenue Method MSTR";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        ProgressWindow: Dialog;
        ProcessedCount: Integer;
        Text_gText: Label 'Processing...\Total: #1####################\Current: #2####################';
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        ProcessedCount := 0;
        ContractRevenueMethodMSTR_lRec.Reset();
        ProgressWindow.Open(Text_gText);
        ProgressWindow.Update(1, ContractRevenueMethodMSTR_lRec.Count);

        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            if ContractRevenueMethodMSTR_lRec.FindLast() then
                Entry_No_gInt := Entry_No_gInt + 1
            else
                Entry_No_gInt := 1;

            ContractRevenueMethodMSTR_lRec.Init();

            ContractRevenueMethodMSTR_lRec.EntryNo := Entry_No_gInt;
            Evaluate(ContractRevenueMethodMSTR_lRec.CUSTNMBR, GetValueatCell(RowNo, 1));
            Evaluate(ContractRevenueMethodMSTR_lRec.ADRSCODE, GetValueatCell(RowNo, 2));
            Evaluate(ContractRevenueMethodMSTR_lRec.Contract_Number, GetValueatCell(RowNo, 3));
            Evaluate(ContractRevenueMethodMSTR_lRec.WSCONTSQ, GetValueatCell(RowNo, 4));
            Evaluate(ContractRevenueMethodMSTR_lRec.SEQNUMBR, GetValueatCell(RowNo, 5));
            Evaluate(ContractRevenueMethodMSTR_lRec.Wennsoft_Affiliate, GetValueatCell(RowNo, 6));
            Evaluate(ContractRevenueMethodMSTR_lRec.Wennsoft_Region, GetValueatCell(RowNo, 7));
            Evaluate(ContractRevenueMethodMSTR_lRec.Wennsoft_Branch, GetValueatCell(RowNo, 8));
            Evaluate(ContractRevenueMethodMSTR_lRec.USERID, GetValueatCell(RowNo, 9));
            Evaluate(ContractRevenueMethodMSTR_lRec.Technician_ID, GetValueatCell(RowNo, 10));
            Evaluate(ContractRevenueMethodMSTR_lRec.Technician_Team, GetValueatCell(RowNo, 11));
            Evaluate(ContractRevenueMethodMSTR_lRec.YEAR1, GetValueatCell(RowNo, 12));
            Evaluate(ContractRevenueMethodMSTR_lRec.PERIODID, GetValueatCell(RowNo, 13));
            Evaluate(ContractRevenueMethodMSTR_lRec.DOCAMNT, GetValueatCell(RowNo, 14));
            Evaluate(ContractRevenueMethodMSTR_lRec.DATE1, GetValueatCell(RowNo, 15));
            Evaluate(ContractRevenueMethodMSTR_lRec.POSTDATE, GetValueatCell(RowNo, 16));
            Evaluate(ContractRevenueMethodMSTR_lRec.WS_Closed, GetValueatCell(RowNo, 17));
            Evaluate(ContractRevenueMethodMSTR_lRec.MODIFDT, GetValueatCell(RowNo, 18));
            Evaluate(ContractRevenueMethodMSTR_lRec.Modified_Time, GetValueatCell(RowNo, 19));
            Evaluate(ContractRevenueMethodMSTR_lRec.MDFUSRID, GetValueatCell(RowNo, 20));
            Evaluate(ContractRevenueMethodMSTR_lRec.Time_Zone, GetValueatCell(RowNo, 21));
            Evaluate(ContractRevenueMethodMSTR_lRec.Base_Currency_ID, GetValueatCell(RowNo, 22));
            Evaluate(ContractRevenueMethodMSTR_lRec.Base_Curr_Conv_Factor, GetValueatCell(RowNo, 23));
            Evaluate(ContractRevenueMethodMSTR_lRec.Billing_Currency_ID, GetValueatCell(RowNo, 24));
            Evaluate(ContractRevenueMethodMSTR_lRec.Billing_Curr_Conv_Factor, GetValueatCell(RowNo, 25));
            Evaluate(ContractRevenueMethodMSTR_lRec.Local_Currency_ID, GetValueatCell(RowNo, 26));
            Evaluate(ContractRevenueMethodMSTR_lRec.GLJournalEntry, GetValueatCell(RowNo, 27));
            Evaluate(ContractRevenueMethodMSTR_lRec.PB_ACTINDX, GetValueatCell(RowNo, 28));
            Evaluate(ContractRevenueMethodMSTR_lRec.CE_ACTINDX, GetValueatCell(RowNo, 29));
            Evaluate(ContractRevenueMethodMSTR_lRec.PB_SEQNUMBR, GetValueatCell(RowNo, 30));
            Evaluate(ContractRevenueMethodMSTR_lRec.CE_SEQNUMBR, GetValueatCell(RowNo, 31));
            Evaluate(ContractRevenueMethodMSTR_lRec.WSReserved_CB1, GetValueatCell(RowNo, 32));
            Evaluate(ContractRevenueMethodMSTR_lRec.WSReserved_CB2, GetValueatCell(RowNo, 33));
            Evaluate(ContractRevenueMethodMSTR_lRec.WSReserved_CB3, GetValueatCell(RowNo, 34));
            Evaluate(ContractRevenueMethodMSTR_lRec.WSReserved_CB4, GetValueatCell(RowNo, 35));
            Evaluate(ContractRevenueMethodMSTR_lRec.WSReserved_CB5, GetValueatCell(RowNo, 36));
            Evaluate(ContractRevenueMethodMSTR_lRec.WSReserved_STR1, GetValueatCell(RowNo, 37));
            Evaluate(ContractRevenueMethodMSTR_lRec.WSReserved_STR2, GetValueatCell(RowNo, 38));
            Evaluate(ContractRevenueMethodMSTR_lRec.RMDTYPAL, GetValueatCell(RowNo, 39));
            Evaluate(ContractRevenueMethodMSTR_lRec.ACTINDX_CR, GetValueatCell(RowNo, 40));
            Evaluate(ContractRevenueMethodMSTR_lRec.ACTINDX_DR, GetValueatCell(RowNo, 41));
            Evaluate(ContractRevenueMethodMSTR_lRec.Reference_TRX_Number, GetValueatCell(RowNo, 42));
            Evaluate(ContractRevenueMethodMSTR_lRec.JRNENTRY, GetValueatCell(RowNo, 43));
            Evaluate(ContractRevenueMethodMSTR_lRec.LNSEQNBR, GetValueatCell(RowNo, 44));
            Evaluate(ContractRevenueMethodMSTR_lRec.Contract_Sequence_Number, GetValueatCell(RowNo, 45));
            Evaluate(ContractRevenueMethodMSTR_lRec.DEX_ROW_ID, GetValueatCell(RowNo, 46));


            ContractRevenueMethodMSTR_lRec.Insert();
            ProcessedCount := ProcessedCount + 1;
            ProgressWindow.Update(2, ProcessedCount);
        end;
        Message(ExcelImportSucess_lbl);
        ProgressWindow.Close();
    end;


}
