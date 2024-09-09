codeunit 50902 ImportJobfiles
{
    var
        FileName_gTxt: Text[100];
        SheetName_gTxt: Text[100];
        TempExcelBuffer_gRec: Record "Excel Buffer" temporary;
        UploadExcelMsg_lbl: Label 'Please Choose the Excel file.';
        NoFileFoundMsg_lbl: Label 'No Excel file found!';
        BatchISBlankMsg_lbl: Label 'Batch name is blank';
        ExcelImportSucess_lbl: Label 'Excel is successfully imported.';

    procedure ImportJobPOC()
    begin
        ReadExcelSheet();
        ImportExcelData_JobPOC();
    end;


    procedure ImportJobItemdetails()
    var
    begin
        ReadExcelSheet();
        ImportExcelData_JobItems();
    end;


    //GP DATA
    procedure ImportGPData()
    begin
        ReadExcelSheet();
        ImportExcelData_GPData();
    end;

    //WennSoft_Items
    procedure ImportWennSoftItems()
    begin
        ReadExcelSheet();
        ImportExcelData_WennSoftItems();
    end;

    procedure ImportKitComponents()
    begin
        ReadExcelSheet();
        ImportExcelData_KitComponents();
    end;

    procedure ImportTechnician()
    begin
        ReadExcelSheet();
        ImportExcelData_Technician();
    end;

    procedure ImportKitMasterHeader()
    begin
        ReadExcelSheet();
        ImportExcelData_KitMasterHeader();
    end;

    procedure ImportMaintainceContract()
    begin
        ReadExcelSheet();
        ImportExcelData_MaintainceContract();
    end;

    procedure ImportContractHistory()
    begin
        ReadExcelSheet();
        ImportExcelData_ContractHistory();
    end;

    procedure ImportServiceAll()
    begin
        ReadExcelSheet();
        ImportExcelData_ServiceAll();
    end;

    procedure ImportCustomerMaintaince()
    begin
        ReadExcelSheet();
        ImportExcelData_CustomerMaintaince();
    end;

    procedure ImportJobMaster()
    begin
        ReadExcelSheet();
        ImportExcelData_JobMaster();
    end;

    procedure ImportCostCodeDetails()
    begin
        ReadExcelSheet();
        ImportExcelData_CostCodeDetails();
    end;

    procedure ImportJobSummary()
    begin
        ReadExcelSheet();
        ImportExcelData_JobSummary();
    end;

    procedure ImportJobDeatilsSummary()
    begin
        ReadExcelSheet();
        ImportExcelData_obDeatilsSummary();
    end;

    procedure ImportOpenTransactions()
    begin
        ReadExcelSheet();
        ImportExcelData_OpenTransactions();
    end;

    procedure ImportHistoricTransactions()
    begin
        ReadExcelSheet();
        ImportExcelData_HistoricTransactions();
    end;



    local procedure ReadExcelSheet()
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

    local procedure ImportExcelData_JobItems()
    var
        JobItemDetails_lRec: Record "Job Item Details";
        RowNo: Integer;
        colNo: Integer;
        LineNo1: Integer;
        MaxRowNo: Integer;
        Entry_No_lInt: Integer;
    begin

        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;

        JobItemDetails_lRec.Reset();
        if JobItemDetails_lRec.FindLast() then
            Entry_No_lInt := JobItemDetails_lRec.EntryNo;
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;

        JobItemDetails_lRec.SetRange(FileName, FileName_gTxt);
        if JobItemDetails_lRec.FindFirst() then
            Error('File already exists in the system. Import aborted.');

        for RowNo := 2 to MaxRowNo do begin
            Entry_No_lInt := Entry_No_lInt + 1;
            JobItemDetails_lRec.Init();
            JobItemDetails_lRec.EntryNo := Entry_No_lInt;
            Evaluate(JobItemDetails_lRec.CUSTNMBR, GetValueatCell(RowNo, 1));
            Evaluate(JobItemDetails_lRec.CUSTNAME, GetValueatCell(RowNo, 2));
            Evaluate(JobItemDetails_lRec.WS_Job_Number, GetValueatCell(RowNo, 3));
            Evaluate(JobItemDetails_lRec.SOPTYPE, GetValueatCell(RowNo, 4));
            Evaluate(JobItemDetails_lRec.SOPNUMBER, GetValueatCell(RowNo, 5));
            Evaluate(JobItemDetails_lRec.LNITMSEQ, GetValueatCell(RowNo, 6));
            Evaluate(JobItemDetails_lRec.CMPNTSEQ, GetValueatCell(RowNo, 7));
            Evaluate(JobItemDetails_lRec.ITEMNMBR, GetValueatCell(RowNo, 8));
            Evaluate(JobItemDetails_lRec.QTYFULFI, GetValueatCell(RowNo, 9));
            Evaluate(JobItemDetails_lRec.QTYTOINV, GetValueatCell(RowNo, 10));
            Evaluate(JobItemDetails_lRec.QUANTITY, GetValueatCell(RowNo, 11));
            Evaluate(JobItemDetails_lRec.QTYREMAI, GetValueatCell(RowNo, 12));
            Evaluate(JobItemDetails_lRec.UNITCOST, GetValueatCell(RowNo, 13));
            Evaluate(JobItemDetails_lRec.CURRCOST, GetValueatCell(RowNo, 14));
            Evaluate(JobItemDetails_lRec.EXTDCOST, GetValueatCell(RowNo, 15));
            Evaluate(JobItemDetails_lRec.XTNDPRCE, GetValueatCell(RowNo, 16));
            Evaluate(JobItemDetails_lRec.ITMCLSCD, GetValueatCell(RowNo, 17));
            Evaluate(JobItemDetails_lRec.STNDCOST, GetValueatCell(RowNo, 18));
            if (GetValueatCell(RowNo, 19) = '') or (GetValueatCell(RowNo, 19) = 'NULL') then
                Evaluate(JobItemDetails_lRec.LaborUnpExtCst, Format(0.00))
            else
                Evaluate(JobItemDetails_lRec.LaborUnpExtCst, GetValueatCell(RowNo, 19));
            Evaluate(JobItemDetails_lRec.GV_Ext_Cost_LaborExtCst, GetValueatCell(RowNo, 20));
            Evaluate(JobItemDetails_lRec.GVEXTDCOST2, GetValueatCell(RowNo, 21));
            Evaluate(JobItemDetails_lRec.Divisions, GetValueatCell(RowNo, 22));
            Evaluate(JobItemDetails_lRec.BCDimension1, GetValueatCell(RowNo, 23));
            Evaluate(JobItemDetails_lRec.BCdscriptnDim1, GetValueatCell(RowNo, 24));
            JobItemDetails_lRec.FileName := FileName_gTxt;
            JobItemDetails_lRec.FileImportedBy := UserId;
            JobItemDetails_lRec.FileimportedDate := Today;
            JobItemDetails_lRec.IsProcessed := false;
            JobItemDetails_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;



    local procedure ImportExcelData_JobPOC()
    var
        JobPOC_lRec: Record "Job POC";
        JobPOC_lRec1: Record "Job POC";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        JobPOC_lRec.Reset();
        if JobPOC_lRec.FindLast() then
            EntryNo := JobPOC_lRec."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        JobPOC_lRec1.SetRange("File Name", FileName_gTxt);
        if JobPOC_lRec1.Findset() then
            Error('%1 is already existed', FileName_gTxt);

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            JobPOC_lRec.Init();
            JobPOC_lRec."Entry No." := EntryNo;
            Evaluate(JobPOC_lRec.CUSTNMBR, GetValueAtCell(RowNo, 1));
            Evaluate(JobPOC_lRec.CUSTNAME, GetValueAtCell(RowNo, 2));
            Evaluate(JobPOC_lRec.WS_Job_Number, GetValueAtCell(RowNo, 3));
            Evaluate(JobPOC_lRec.Divisions, GetValueAtCell(RowNo, 4));
            Evaluate(JobPOC_lRec.AdjTotalPostedCost, GetValueAtCell(RowNo, 5));
            Evaluate(JobPOC_lRec."Adj Calc Est Cost", GetValueAtCell(RowNo, 6));
            Evaluate(JobPOC_lRec."Adj % Complete", GetValueAtCell(RowNo, 7));
            Evaluate(JobPOC_lRec."Calc Contract Amt", GetValueAtCell(RowNo, 8));
            Evaluate(JobPOC_lRec."Revenue Earned", GetValueAtCell(RowNo, 9));
            Evaluate(JobPOC_lRec."Net Billed", GetValueAtCell(RowNo, 10));
            Evaluate(JobPOC_lRec."Adj Accrual (Deferral)", GetValueAtCell(RowNo, 11));
            Evaluate(JobPOC_lRec."Adj Accrued Revenue", GetValueAtCell(RowNo, 12));
            Evaluate(JobPOC_lRec."Adj Deffered Revenue", GetValueAtCell(RowNo, 13));
            Evaluate(JobPOC_lRec."##", GetValueAtCell(RowNo, 14));
            Evaluate(JobPOC_lRec."Billing$", GetValueAtCell(RowNo, 15));
            Evaluate(JobPOC_lRec."%Billed", GetValueAtCell(RowNo, 16));
            Evaluate(JobPOC_lRec."Billing Returns$", GetValueAtCell(RowNo, 17));
            Evaluate(JobPOC_lRec."Orig Contract Amt", GetValueAtCell(RowNo, 18));
            Evaluate(JobPOC_lRec."Unposted Billing$", GetValueAtCell(RowNo, 19));
            Evaluate(JobPOC_lRec."Labor Unposted$", GetValueAtCell(RowNo, 20));
            Evaluate(JobPOC_lRec."Unposted Material Cost$", GetValueAtCell(RowNo, 21));
            Evaluate(JobPOC_lRec."Actual material Cost$", GetValueAtCell(RowNo, 22));
            Evaluate(JobPOC_lRec."SOP_Cost$", GetValueAtCell(RowNo, 23));
            Evaluate(JobPOC_lRec."Cost returns$", GetValueAtCell(RowNo, 24));
            Evaluate(JobPOC_lRec."Posted labor$", GetValueAtCell(RowNo, 25));
            Evaluate(JobPOC_lRec."Posted Other$", GetValueAtCell(RowNo, 26));
            Evaluate(JobPOC_lRec.BCdimension1, GetValueAtCell(RowNo, 27));
            Evaluate(JobPOC_lRec.BCdscriptnDim1, GetValueAtCell(RowNo, 28));
            JobPOC_lRec."File Name" := FileName_gTxt;
            JobPOC_lRec."File Imported Date" := CurrentDateTime;
            JobPOC_lRec."File Imported By" := UserId;
            JobPOC_lRec."Is processed" := false;
            if JobPOC_lRec."Error Message" <> '' then
                JobPOC_lRec.Error := true;
            JobPOC_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;


    //GP DATA
    local procedure ImportExcelData_GPData()
    var
        GPInter_lRec: Record GPIntermediary;
        GPInter_lRec1: Record GPIntermediary;
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        GPInter_lRec.Reset();
        if GPInter_lRec.FindLast() then
            EntryNo := GPInter_lRec.EntryNo;
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        GPInter_lRec1.SetRange("Imported File Name", FileName_gTxt);
        if GPInter_lRec1.Findset() then
            Error('%1 is already existed', FileName_gTxt);

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            GPInter_lRec.Init();
            GPInter_lRec.EntryNo := EntryNo;
            Evaluate(GPInter_lRec.JRNENTRY, GetValueAtCell(RowNo, 1));
            Evaluate(GPInter_lRec.OPENYEAR, GetValueAtCell(RowNo, 2));
            Evaluate(GPInter_lRec.PERIODID, GetValueAtCell(RowNo, 3));
            Evaluate(GPInter_lRec.ACTNUMBR_1, GetValueAtCell(RowNo, 4));
            Evaluate(GPInter_lRec.ACTNUMBR_3, GetValueAtCell(RowNo, 5));
            Evaluate(GPInter_lRec.ACTNUMST, GetValueAtCell(RowNo, 6));
            Evaluate(GPInter_lRec.TRXDATE, GetValueAtCell(RowNo, 7));
            Evaluate(GPInter_lRec.ORMSTRID, GetValueAtCell(RowNo, 8));
            Evaluate(GPInter_lRec.DEBITAMT, GetValueAtCell(RowNo, 9));
            Evaluate(GPInter_lRec.CRDTAMNT, GetValueAtCell(RowNo, 10));
            Evaluate(GPInter_lRec.Net_DrCr, GetValueAtCell(RowNo, 11));
            Evaluate(GPInter_lRec.SOURCDOC, GetValueAtCell(RowNo, 12));
            Evaluate(GPInter_lRec.ORMSTRNM, GetValueAtCell(RowNo, 13));
            Evaluate(GPInter_lRec.BACHNUMB, GetValueAtCell(RowNo, 14));
            Evaluate(GPInter_lRec.ORDOCNUM, GetValueAtCell(RowNo, 15));
            Evaluate(GPInter_lRec.DSCRIPTN, GetValueAtCell(RowNo, 16));
            Evaluate(GPInter_lRec.ORGNTSRC, GetValueAtCell(RowNo, 17));
            Evaluate(GPInter_lRec.VOIDED, GetValueAtCell(RowNo, 18));
            Evaluate(GPInter_lRec.GPsegmentID, GetValueAtCell(RowNo, 19));
            Evaluate(GPInter_lRec.BCdimension1, GetValueAtCell(RowNo, 20));
            Evaluate(GPInter_lRec.BCdscriptnDim1, GetValueAtCell(RowNo, 21));
            Evaluate(GPInter_lRec."GP AcctNmbrStrng", GetValueAtCell(RowNo, 22));
            Evaluate(GPInter_lRec."BC GL No", GetValueAtCell(RowNo, 23));
            Evaluate(GPInter_lRec."BC GL Name", GetValueAtCell(RowNo, 24));
            Evaluate(GPInter_lRec."BC Income/Balance", GetValueAtCell(RowNo, 25));
            Evaluate(GPInter_lRec."BC Account Category", GetValueAtCell(RowNo, 26));
            Evaluate(GPInter_lRec."BC Account Subcategory", GetValueAtCell(RowNo, 27));
            Evaluate(GPInter_lRec."BC Account Type", GetValueAtCell(RowNo, 28));
            Evaluate(GPInter_lRec.REFRENCE, GetValueAtCell(RowNo, 29));
            Evaluate(GPInter_lRec."Job related or not", GetValueAtCell(RowNo, 30));
            Evaluate(GPInter_lRec."Job or not Job related", GetValueAtCell(RowNo, 31));
            Evaluate(GPInter_lRec."Job or Null", GetValueAtCell(RowNo, 32));
            GPInter_lRec."Imported File Name" := FileName_gTxt;
            GPInter_lRec."Imported Date & Time" := CurrentDateTime;
            GPInter_lRec."Imported By" := UserId;
            GPInter_lRec."Journal Line Created" := false;
            GPInter_lRec.Insert(true);
        end;
        Message(ExcelImportSucess_lbl);
    end;


    //WennSoft_Items
    local procedure ImportExcelData_WennSoftItems()
    var
        WennItems_lRec: Record WennSoftItems;
        WennItems_lRec1: Record WennSoftItems;
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        WennItems_lRec.Reset();
        if WennItems_lRec.FindLast() then
            EntryNo := WennItems_lRec."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        WennItems_lRec1.SetRange("File Name", FileName_gTxt);
        if WennItems_lRec1.Findset() then
            Error('%1 is already existed', FileName_gTxt);

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            WennItems_lRec.Init();
            WennItems_lRec."Entry No." := EntryNo;
            Evaluate(WennItems_lRec.ITEMNMBR, GetValueAtCell(RowNo, 1));
            Evaluate(WennItems_lRec."Item Desc.", GetValueAtCell(RowNo, 2));
            Evaluate(WennItems_lRec."Short Desc.", GetValueAtCell(RowNo, 3));
            Evaluate(WennItems_lRec."Generic Desc.", GetValueAtCell(RowNo, 4));
            Evaluate(WennItems_lRec."Class ID", GetValueAtCell(RowNo, 5));
            Evaluate(WennItems_lRec."Item Type", GetValueAtCell(RowNo, 6));
            Evaluate(WennItems_lRec."Valuation Method", GetValueAtCell(RowNo, 7));
            Evaluate(WennItems_lRec."Valuation Method in Text", GetValueAtCell(RowNo, 8));
            Evaluate(WennItems_lRec."Qty. decimals", GetValueAtCell(RowNo, 9));
            Evaluate(WennItems_lRec."Currency Decimals", GetValueAtCell(RowNo, 10));
            Evaluate(WennItems_lRec."Sales Tax Options", GetValueAtCell(RowNo, 11));
            Evaluate(WennItems_lRec."Tax Schedule ID-1", GetValueAtCell(RowNo, 12));
            Evaluate(WennItems_lRec."UOM Schedule ID", GetValueAtCell(RowNo, 13));
            Evaluate(WennItems_lRec."Purchase Tax Options", GetValueAtCell(RowNo, 14));
            Evaluate(WennItems_lRec."Tax Schedule ID-2", GetValueAtCell(RowNo, 15));
            Evaluate(WennItems_lRec."Std. Cost", GetValueAtCell(RowNo, 16));
            Evaluate(WennItems_lRec."Current Cost", GetValueAtCell(RowNo, 17));
            Evaluate(WennItems_lRec."List Price", GetValueAtCell(RowNo, 18));
            Evaluate(WennItems_lRec."Qty. on Hold", GetValueAtCell(RowNo, 19));
            Evaluate(WennItems_lRec."Qty. Available", GetValueAtCell(RowNo, 20));
            Evaluate(WennItems_lRec."Qty Backorder", GetValueAtCell(RowNo, 21));
            Evaluate(WennItems_lRec."Available less backorder", GetValueAtCell(RowNo, 22));
            WennItems_lRec."File Name" := FileName_gTxt;
            WennItems_lRec."File Imported Date" := CurrentDateTime;
            WennItems_lRec."File Imported By" := UserId;
            WennItems_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    local procedure ImportExcelData_KitComponents()
    var
        KitComponents_lRec: Record "Kit Components";
        KitComponents_lRec1: Record "Kit Components";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        KitComponents_lRec.Reset();
        if KitComponents_lRec.FindLast() then
            EntryNo := KitComponents_lRec."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        KitComponents_lRec1.SetRange("File Name", FileName_gTxt);
        if KitComponents_lRec1.Findset() then
            Error('%1 is already existed', FileName_gTxt);

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            KitComponents_lRec.Init();
            KitComponents_lRec."Entry No." := EntryNo;
            Evaluate(KitComponents_lRec.ITEMNMBR, GetValueAtCell(RowNo, 1));
            Evaluate(KitComponents_lRec.ITEMDESC, GetValueAtCell(RowNo, 2));
            Evaluate(KitComponents_lRec.CMPTITNM, GetValueAtCell(RowNo, 3));
            Evaluate(KitComponents_lRec."Component Item Desc.", GetValueAtCell(RowNo, 4));
            Evaluate(KitComponents_lRec.CMPITUOM, GetValueAtCell(RowNo, 5));
            Evaluate(KitComponents_lRec.CMPITQTY, GetValueAtCell(RowNo, 6));
            Evaluate(KitComponents_lRec."Parent Current Cost", GetValueAtCell(RowNo, 7));
            Evaluate(KitComponents_lRec."Parent Standard Cost", GetValueAtCell(RowNo, 8));
            Evaluate(KitComponents_lRec."Component Current Cost", GetValueAtCell(RowNo, 9));
            Evaluate(KitComponents_lRec."Component Std Cost", GetValueAtCell(RowNo, 10));
            KitComponents_lRec."File Name" := FileName_gTxt;
            KitComponents_lRec."File Imported Date" := CurrentDateTime;
            KitComponents_lRec."File Imported By" := UserId;
            KitComponents_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    local procedure ImportExcelData_Technician()
    var
        Technician_lRec: Record Technician;
        Technician_lRec1: Record Technician;
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        Technician_lRec.Reset();
        if Technician_lRec.FindLast() then
            EntryNo := Technician_lRec."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        Technician_lRec1.SetRange("File Name", FileName_gTxt);
        if Technician_lRec1.Findset() then
            Error('%1 is already existed', FileName_gTxt);

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            Technician_lRec.Init();
            Technician_lRec."Entry No." := EntryNo;
            Evaluate(Technician_lRec."Technician ID", GetValueAtCell(RowNo, 1));
            Evaluate(Technician_lRec."Link To", GetValueAtCell(RowNo, 2));
            Evaluate(Technician_lRec."Emp ID", GetValueAtCell(RowNo, 3));
            Evaluate(Technician_lRec."Vendor ID", GetValueAtCell(RowNo, 4));
            Evaluate(Technician_lRec."Technician Name", GetValueAtCell(RowNo, 5));
            Evaluate(Technician_lRec."Primary Skill Level", GetValueAtCell(RowNo, 6));
            Evaluate(Technician_lRec."Technician Team", GetValueAtCell(RowNo, 7));
            Evaluate(Technician_lRec."Extended Hours", GetValueAtCell(RowNo, 8));
            Evaluate(Technician_lRec."Page Vendor", GetValueAtCell(RowNo, 9));
            Evaluate(Technician_lRec."Page Number", GetValueAtCell(RowNo, 10));
            Evaluate(Technician_lRec."Pager Pin/Email", GetValueAtCell(RowNo, 11));
            Evaluate(Technician_lRec."Refrigerant Certification", GetValueAtCell(RowNo, 12));
            Evaluate(Technician_lRec."Time zone", GetValueAtCell(RowNo, 13));
            Evaluate(Technician_lRec."Allow Double booking", GetValueAtCell(RowNo, 14));
            Technician_lRec."File Name" := FileName_gTxt;
            Technician_lRec."File Imported Date" := CurrentDateTime;
            Technician_lRec."File Imported By" := UserId;
            Technician_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    local procedure ImportExcelData_KitMasterHeader()
    var
        KitMasterHeader_lRec: Record "Kit Master Header";
        KitMasterHeader_lRec1: Record "Kit Master Header";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        KitMasterHeader_lRec.Reset();
        if KitMasterHeader_lRec.FindLast() then
            EntryNo := KitMasterHeader_lRec."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        KitMasterHeader_lRec1.SetRange("File Name", FileName_gTxt);
        if KitMasterHeader_lRec1.Findset() then
            Error('%1 is already existed', FileName_gTxt);
        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            KitMasterHeader_lRec.Init();
            KitMasterHeader_lRec."Entry No." := EntryNo;
            Evaluate(KitMasterHeader_lRec.ITEMNMBR, GetValueatCell(RowNo, 1));
            Evaluate(KitMasterHeader_lRec.ITEMDESC, GetValueatCell(RowNo, 2));
            Evaluate(KitMasterHeader_lRec.IVCOGSIX, GetValueatCell(RowNo, 3));
            Evaluate(KitMasterHeader_lRec.CURRCOST, GetValueatCell(RowNo, 4));
            Evaluate(KitMasterHeader_lRec.STNDCOST, GetValueatCell(RowNo, 5));
            KitMasterHeader_lRec."File Name" := FileName_gTxt;
            KitMasterHeader_lRec."File Imported Date" := CurrentDateTime;
            KitMasterHeader_lRec."File Imported By" := UserId;
            KitMasterHeader_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    local procedure ImportExcelData_MaintainceContract()
    var
        MaintenanceContract_lRec: Record "Maintenance Contract";
        MaintenanceContract_lRec1: Record "Maintenance Contract";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        MaintenanceContract_lRec.Reset();
        if MaintenanceContract_lRec.FindLast() then
            EntryNo := MaintenanceContract_lRec."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        MaintenanceContract_lRec1.SetRange("File Name", FileName_gTxt);
        if MaintenanceContract_lRec1.Findset() then
            Error('%1 is already existed', FileName_gTxt);

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            MaintenanceContract_lRec.Init();
            MaintenanceContract_lRec."Entry No." := EntryNo;
            Evaluate(MaintenanceContract_lRec.Customer, GetValueatCell(RowNo, 1));
            Evaluate(MaintenanceContract_lRec.CustomerName, GetValueatCell(RowNo, 2));
            Evaluate(MaintenanceContract_lRec.Location, GetValueatCell(RowNo, 3));
            Evaluate(MaintenanceContract_lRec.ADDRESS1, GetValueatCell(RowNo, 4));
            Evaluate(MaintenanceContract_lRec.ADDRESS2, GetValueatCell(RowNo, 5));
            Evaluate(MaintenanceContract_lRec.ADDRESS3, GetValueatCell(RowNo, 6));
            Evaluate(MaintenanceContract_lRec.COUNTRY, GetValueatCell(RowNo, 7));
            Evaluate(MaintenanceContract_lRec.CITY, GetValueatCell(RowNo, 8));
            Evaluate(MaintenanceContract_lRec.STATE, GetValueatCell(RowNo, 9));
            Evaluate(MaintenanceContract_lRec.ZIP, GetValueatCell(RowNo, 10));
            Evaluate(MaintenanceContract_lRec.ContractNumber, GetValueatCell(RowNo, 11));
            Evaluate(MaintenanceContract_lRec.MasterContractID, GetValueatCell(RowNo, 12));
            Evaluate(MaintenanceContract_lRec.ContractType, GetValueatCell(RowNo, 13));
            Evaluate(MaintenanceContract_lRec.CurrencyID, GetValueatCell(RowNo, 14));
            Evaluate(MaintenanceContract_lRec.ContractAmount, GetValueatCell(RowNo, 15));
            Evaluate(MaintenanceContract_lRec.StartDate, GetValueatCell(RowNo, 16));
            Evaluate(MaintenanceContract_lRec.ExpirationDate, GetValueatCell(RowNo, 17));
            Evaluate(MaintenanceContract_lRec.AnniversaryDate, GetValueatCell(RowNo, 18));
            Evaluate(MaintenanceContract_lRec.Divisions, GetValueatCell(RowNo, 19));
            Evaluate(MaintenanceContract_lRec.BillingFrequency, GetValueatCell(RowNo, 20));
            Evaluate(MaintenanceContract_lRec.AutomaticallyBilling, GetValueatCell(RowNo, 21));
            Evaluate(MaintenanceContract_lRec.InvoiceBillingDay, GetValueatCell(RowNo, 22));
            Evaluate(MaintenanceContract_lRec.BilltoCustomer, GetValueatCell(RowNo, 23));
            Evaluate(MaintenanceContract_lRec.CUSTNAME, GetValueatCell(RowNo, 24));
            Evaluate(MaintenanceContract_lRec.BilltoADDRESS1, GetValueatCell(RowNo, 25));
            Evaluate(MaintenanceContract_lRec.BilltoADDRESS2, GetValueatCell(RowNo, 26));
            Evaluate(MaintenanceContract_lRec.BilltoADDRESS3, GetValueatCell(RowNo, 27));
            Evaluate(MaintenanceContract_lRec.BilltoCOUNTRY, GetValueatCell(RowNo, 28));
            Evaluate(MaintenanceContract_lRec.BilltoCITY, GetValueatCell(RowNo, 29));
            Evaluate(MaintenanceContract_lRec.BilltoSTATE, GetValueatCell(RowNo, 30));
            Evaluate(MaintenanceContract_lRec.BilltoZIP, GetValueatCell(RowNo, 31));
            Evaluate(MaintenanceContract_lRec.BilltoLocation, GetValueatCell(RowNo, 32));
            Evaluate(MaintenanceContract_lRec.ServiceCallDay, GetValueatCell(RowNo, 33));
            Evaluate(MaintenanceContract_lRec.MasterTaxSchedule, GetValueatCell(RowNo, 34));
            Evaluate(MaintenanceContract_lRec.PONumber, GetValueatCell(RowNo, 35));
            Evaluate(MaintenanceContract_lRec.SalespersonID, GetValueatCell(RowNo, 36));
            Evaluate(MaintenanceContract_lRec.SalespersonName, GetValueatCell(RowNo, 37));
            Evaluate(MaintenanceContract_lRec.PrimaryTechnicianID, GetValueatCell(RowNo, 38));
            Evaluate(MaintenanceContract_lRec.ServiceLevelID, GetValueatCell(RowNo, 39));
            Evaluate(MaintenanceContract_lRec.Hold, GetValueatCell(RowNo, 40));
            Evaluate(MaintenanceContract_lRec.LeaveContractOpen, GetValueatCell(RowNo, 41));
            Evaluate(MaintenanceContract_lRec.RenewalValue, GetValueatCell(RowNo, 42));
            Evaluate(MaintenanceContract_lRec.Status, GetValueatCell(RowNo, 43));
            Evaluate(MaintenanceContract_lRec.User_Define_1a, GetValueatCell(RowNo, 44));
            Evaluate(MaintenanceContract_lRec.User_Define_2a, GetValueatCell(RowNo, 45));
            Evaluate(MaintenanceContract_lRec.User_Define_3a, GetValueatCell(RowNo, 46));
            Evaluate(MaintenanceContract_lRec.User_Define_4a, GetValueatCell(RowNo, 47));
            if (GetValueatCell(RowNo, 48) = 'NULL') then
                Evaluate(MaintenanceContract_lRec.OriginalStartDate, Format(0D))
            else
                Evaluate(MaintenanceContract_lRec.OriginalStartDate, GetValueatCell(RowNo, 48));
            if (GetValueatCell(RowNo, 49) = 'NULL') then
                Evaluate(MaintenanceContract_lRec.OriginalEndDate, Format(0D))
            else
                Evaluate(MaintenanceContract_lRec.OriginalEndDate, GetValueatCell(RowNo, 49));
            MaintenanceContract_lRec."File Name" := FileName_gTxt;
            MaintenanceContract_lRec."File Imported Date" := CurrentDateTime;
            MaintenanceContract_lRec."File Imported By" := UserId;
            MaintenanceContract_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    local procedure ImportExcelData_ContractHistory()
    var
        ContractHistory_lRec: Record "Contract History";
        ContractHistory_lRec1: Record "Contract History";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        ContractHistory_lRec.Reset();
        if ContractHistory_lRec.FindLast() then
            EntryNo := ContractHistory_lRec."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        ContractHistory_lRec1.SetRange("File Name", FileName_gTxt);
        if ContractHistory_lRec1.Findset() then
            Error('%1 is already existed', FileName_gTxt);

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            ContractHistory_lRec.Init();
            ContractHistory_lRec."Entry No." := EntryNo;
            Evaluate(ContractHistory_lRec.Contract, GetValueatCell(RowNo, 1));
            Evaluate(ContractHistory_lRec.Description, GetValueatCell(RowNo, 2));
            Evaluate(ContractHistory_lRec.Amount, GetValueatCell(RowNo, 3));
            Evaluate(ContractHistory_lRec.CloseDate, Format(GetValueatCell(RowNo, 4), 0, 9));
            Evaluate(ContractHistory_lRec.CustomerID, GetValueatCell(RowNo, 5));
            Evaluate(ContractHistory_lRec.CustomerName, GetValueatCell(RowNo, 6));
            Evaluate(ContractHistory_lRec.ShipToAddressID, GetValueatCell(RowNo, 7));
            Evaluate(ContractHistory_lRec.ADDRESS1, GetValueatCell(RowNo, 8));
            Evaluate(ContractHistory_lRec.ADDRESS2, GetValueatCell(RowNo, 9));
            Evaluate(ContractHistory_lRec.ADDRESS3, GetValueatCell(RowNo, 10));
            Evaluate(ContractHistory_lRec.COUNTRY, GetValueatCell(RowNo, 11));
            Evaluate(ContractHistory_lRec.CITY, GetValueatCell(RowNo, 12));
            Evaluate(ContractHistory_lRec.STATE, GetValueatCell(RowNo, 13));
            Evaluate(ContractHistory_lRec.ZIP, GetValueatCell(RowNo, 14));
            ContractHistory_lRec."File Name" := FileName_gTxt;
            ContractHistory_lRec."File Imported Date" := CurrentDateTime;
            ContractHistory_lRec."File Imported By" := UserId;
            ContractHistory_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    local procedure ImportExcelData_ServiceAll()
    var
        ServiceCallAll_lRec: Record "Service Call(All)";
        ServiceCallAll_lRec1: Record "Service Call(All)";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
        Text_lVar: Label 'Processing...\Total: #1##############\Current: #2#############';

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        ServiceCallAll_lRec.Reset();
        if ServiceCallAll_lRec.FindLast() then
            EntryNo := ServiceCallAll_lRec."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        ServiceCallAll_lRec1.SetRange("File Name", FileName_gTxt);
        if ServiceCallAll_lRec1.Findset() then
            Error('%1 is already existed', FileName_gTxt);
        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            ServiceCallAll_lRec.Init();
            ServiceCallAll_lRec."Entry No." := EntryNo;
            Evaluate(ServiceCallAll_lRec.Customer, GetValueatCell(RowNo, 1));
            Evaluate(ServiceCallAll_lRec."Customer Name", GetValueatCell(RowNo, 2));
            Evaluate(ServiceCallAll_lRec.Location, GetValueatCell(RowNo, 3));
            Evaluate(ServiceCallAll_lRec.ADDRESS1, GetValueatCell(RowNo, 4));
            Evaluate(ServiceCallAll_lRec.ADDRESS2, GetValueatCell(RowNo, 5));
            Evaluate(ServiceCallAll_lRec.ADDRESS3, GetValueatCell(RowNo, 6));
            Evaluate(ServiceCallAll_lRec.COUNTRY, GetValueatCell(RowNo, 7));
            Evaluate(ServiceCallAll_lRec.CITY, GetValueatCell(RowNo, 8));
            Evaluate(ServiceCallAll_lRec.STATE, GetValueatCell(RowNo, 9));
            Evaluate(ServiceCallAll_lRec.ZIP, GetValueatCell(RowNo, 10));
            Evaluate(ServiceCallAll_lRec.ServiceCallId, GetValueatCell(RowNo, 11));
            Evaluate(ServiceCallAll_lRec.Description, GetValueatCell(RowNo, 12));
            Evaluate(ServiceCallAll_lRec.ProblemType, GetValueatCell(RowNo, 13));
            Evaluate(ServiceCallAll_lRec.Division, GetValueatCell(RowNo, 14));
            Evaluate(ServiceCallAll_lRec.SalespersonID, GetValueatCell(RowNo, 15));
            Evaluate(ServiceCallAll_lRec."Salesperson Name", GetValueatCell(RowNo, 16));
            Evaluate(ServiceCallAll_lRec.CallType, GetValueatCell(RowNo, 17));
            Evaluate(ServiceCallAll_lRec.Priority, GetValueatCell(RowNo, 18));
            Evaluate(ServiceCallAll_lRec.CustomerPONumber, GetValueatCell(RowNo, 19));
            Evaluate(ServiceCallAll_lRec.ContactNumber, GetValueatCell(RowNo, 20));
            Evaluate(ServiceCallAll_lRec.EquimpentID, GetValueatCell(RowNo, 21));
            Evaluate(ServiceCallAll_lRec.TaskCode, GetValueatCell(RowNo, 22));
            Evaluate(ServiceCallAll_lRec.TechnicianID, GetValueatCell(RowNo, 23));
            Evaluate(ServiceCallAll_lRec.Technician_Long_Name, GetValueatCell(RowNo, 24));
            Evaluate(ServiceCallAll_lRec.Date, Format(GetValueatCell(RowNo, 25), 0, 9));
            Evaluate(ServiceCallAll_lRec.EstimatedHours, GetValueatCell(RowNo, 26));
            if (GetValueatCell(RowNo, 27) = 'NULL') then
                Evaluate(ServiceCallAll_lRec.StartingTime, Format(0T))
            else
                Evaluate(ServiceCallAll_lRec.StartingTime, GetValueatCell(RowNo, 27));
            Evaluate(ServiceCallAll_lRec.CallStatus, GetValueatCell(RowNo, 28));
            Evaluate(ServiceCallAll_lRec.CompletionDate, Format(GetValueatCell(RowNo, 29), 0, 9));
            Evaluate(ServiceCallAll_lRec.Resolution, GetValueatCell(RowNo, 30));
            Evaluate(ServiceCallAll_lRec.UserDefineda, GetValueatCell(RowNo, 31));
            Evaluate(ServiceCallAll_lRec.Order, GetValueatCell(RowNo, 32));
            Evaluate(ServiceCallAll_lRec.UserDefinedc, GetValueatCell(RowNo, 33));
            Evaluate(ServiceCallAll_lRec.BillCustomer, GetValueatCell(RowNo, 34));
            Evaluate(ServiceCallAll_lRec.CUSTNAME, GetValueatCell(RowNo, 35));
            Evaluate(ServiceCallAll_lRec.BillADDRESS1, GetValueatCell(RowNo, 36));
            Evaluate(ServiceCallAll_lRec.BillADDRESS2, GetValueatCell(RowNo, 37));
            Evaluate(ServiceCallAll_lRec.BillADDRESS3, GetValueatCell(RowNo, 38));
            Evaluate(ServiceCallAll_lRec.BillCOUNTRY, GetValueatCell(RowNo, 39));
            Evaluate(ServiceCallAll_lRec.BillCITY, GetValueatCell(RowNo, 40));
            Evaluate(ServiceCallAll_lRec.BillSTATE, GetValueatCell(RowNo, 41));
            Evaluate(ServiceCallAll_lRec.BillZIP, GetValueatCell(RowNo, 42));
            Evaluate(ServiceCallAll_lRec.BillAddress, GetValueatCell(RowNo, 43));
            Evaluate(ServiceCallAll_lRec.JobNumber, GetValueatCell(RowNo, 44));
            Evaluate(ServiceCallAll_lRec.OriginatingCallID, GetValueatCell(RowNo, 45));
            Evaluate(ServiceCallAll_lRec.DateTimeLock, GetValueatCell(RowNo, 46));
            ServiceCallAll_lRec."File Name" := FileName_gTxt;
            ServiceCallAll_lRec."File Imported Date" := CurrentDateTime;
            ServiceCallAll_lRec."File Imported By" := UserId;
            ServiceCallAll_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;


    local procedure ImportExcelData_CustomerMaintaince()
    var
        CustomerMainatnce_lRec: Record "Customer Maintainence";
        CustomerMainatnce_lRec1: Record "Customer Maintainence";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        CustomerMainatnce_lRec.Reset();
        if CustomerMainatnce_lRec.FindLast() then
            EntryNo := CustomerMainatnce_lRec."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        CustomerMainatnce_lRec1.SetRange("File Name", FileName_gTxt);
        if CustomerMainatnce_lRec1.Findset() then
            Error('%1 is already existed', FileName_gTxt);
        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            CustomerMainatnce_lRec.Init();
            CustomerMainatnce_lRec."Entry No." := EntryNo;
            Evaluate(CustomerMainatnce_lRec."Customer ID", GetValueatCell(RowNo, 1));
            Evaluate(CustomerMainatnce_lRec.Name, GetValueatCell(RowNo, 2));
            Evaluate(CustomerMainatnce_lRec."Short Name", GetValueatCell(RowNo, 3));
            Evaluate(CustomerMainatnce_lRec."Parent Customer ID ", GetValueatCell(RowNo, 4));
            Evaluate(CustomerMainatnce_lRec."Statment Name", GetValueatCell(RowNo, 5));
            Evaluate(CustomerMainatnce_lRec."Class ID", GetValueatCell(RowNo, 6));
            Evaluate(CustomerMainatnce_lRec."SalesPerson ID", GetValueatCell(RowNo, 7));
            Evaluate(CustomerMainatnce_lRec."Salesperson Name", GetValueatCell(RowNo, 8));
            Evaluate(CustomerMainatnce_lRec."Territory ID", GetValueatCell(RowNo, 9));
            Evaluate(CustomerMainatnce_lRec."User Defined 1", GetValueatCell(RowNo, 10));
            Evaluate(CustomerMainatnce_lRec."User Defined2", GetValueatCell(RowNo, 11));
            Evaluate(CustomerMainatnce_lRec."UPS Zone", GetValueatCell(RowNo, 12));
            Evaluate(CustomerMainatnce_lRec."Shipping Method", GetValueatCell(RowNo, 13));
            Evaluate(CustomerMainatnce_lRec."Tax Schedule ID", GetValueatCell(RowNo, 14));
            Evaluate(CustomerMainatnce_lRec."Comment 1", GetValueatCell(RowNo, 15));
            Evaluate(CustomerMainatnce_lRec."Comment 2", GetValueatCell(RowNo, 16));
            Evaluate(CustomerMainatnce_lRec."Trade Discount", GetValueatCell(RowNo, 17));
            Evaluate(CustomerMainatnce_lRec."Payment Terms", GetValueatCell(RowNo, 18));
            Evaluate(CustomerMainatnce_lRec."Discout Grace Period", GetValueatCell(RowNo, 19));
            Evaluate(CustomerMainatnce_lRec."Due Date Grace Period", GetValueatCell(RowNo, 20));
            Evaluate(CustomerMainatnce_lRec."Price Level", GetValueatCell(RowNo, 21));
            Evaluate(CustomerMainatnce_lRec.Priority, GetValueatCell(RowNo, 22));
            Evaluate(CustomerMainatnce_lRec."Contact Person 1", GetValueatCell(RowNo, 23));
            Evaluate(CustomerMainatnce_lRec."Phone 1", GetValueatCell(RowNo, 24));
            Evaluate(CustomerMainatnce_lRec."Contact Person 2", GetValueatCell(RowNo, 25));
            Evaluate(CustomerMainatnce_lRec."Phone 2", GetValueatCell(RowNo, 26));
            Evaluate(CustomerMainatnce_lRec."Phone 3", GetValueatCell(RowNo, 27));
            Evaluate(CustomerMainatnce_lRec.Fax, GetValueatCell(RowNo, 28));
            Evaluate(CustomerMainatnce_lRec.Hold, GetValueatCell(RowNo, 29));
            Evaluate(CustomerMainatnce_lRec.Inactive, GetValueatCell(RowNo, 30));
            Evaluate(CustomerMainatnce_lRec."Address ID", GetValueatCell(RowNo, 31));
            Evaluate(CustomerMainatnce_lRec."Location Name", GetValueatCell(RowNo, 32));
            Evaluate(CustomerMainatnce_lRec.Address, GetValueatCell(RowNo, 33));
            Evaluate(CustomerMainatnce_lRec.City, GetValueatCell(RowNo, 34));
            Evaluate(CustomerMainatnce_lRec.State, GetValueatCell(RowNo, 35));
            Evaluate(CustomerMainatnce_lRec."Zip Code", GetValueatCell(RowNo, 36));
            Evaluate(CustomerMainatnce_lRec."Country Code", GetValueatCell(RowNo, 37));
            Evaluate(CustomerMainatnce_lRec.Country, GetValueatCell(RowNo, 38));
            Evaluate(CustomerMainatnce_lRec."Ship to", GetValueatCell(RowNo, 39));
            Evaluate(CustomerMainatnce_lRec."Bill to", GetValueatCell(RowNo, 40));
            Evaluate(CustomerMainatnce_lRec."Statment To", GetValueatCell(RowNo, 41));
            Evaluate(CustomerMainatnce_lRec."Service Area", GetValueatCell(RowNo, 42));
            Evaluate(CustomerMainatnce_lRec."Primary Technician ", GetValueatCell(RowNo, 43));
            Evaluate(CustomerMainatnce_lRec."Secondary Technician", GetValueatCell(RowNo, 44));
            Evaluate(CustomerMainatnce_lRec."Labor Rate Group", GetValueatCell(RowNo, 45));
            Evaluate(CustomerMainatnce_lRec."Price Matrix", GetValueatCell(RowNo, 46));
            Evaluate(CustomerMainatnce_lRec.Division, GetValueatCell(RowNo, 47));
            Evaluate(CustomerMainatnce_lRec."Service Call Priority", GetValueatCell(RowNo, 48));
            Evaluate(CustomerMainatnce_lRec."PO Required", GetValueatCell(RowNo, 49));
            Evaluate(CustomerMainatnce_lRec."Service Level ID", GetValueatCell(RowNo, 50));
            Evaluate(CustomerMainatnce_lRec."Time Zone", GetValueatCell(RowNo, 51));
            CustomerMainatnce_lRec."File Name" := FileName_gTxt;
            CustomerMainatnce_lRec."File Imported Date" := CurrentDateTime;
            CustomerMainatnce_lRec."File Imported By" := UserId;
            CustomerMainatnce_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;


    local procedure ImportExcelData_JobMaster()
    var
        WennsoftjobMaster_lRec: Record "Wennsoft Job Master";
        WennsoftjobMaster_lRec1: Record "Wennsoft Job Master";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        WennsoftjobMaster_lRec.Reset();
        if WennsoftjobMaster_lRec.FindLast() then
            EntryNo := WennsoftjobMaster_lRec."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        WennsoftjobMaster_lRec1.SetRange("File Name", FileName_gTxt);
        if WennsoftjobMaster_lRec1.Findset() then
            Error('%1 is already existed', FileName_gTxt);

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            WennsoftjobMaster_lRec.Init();
            WennsoftjobMaster_lRec."Entry No." := EntryNo;
            Evaluate(WennsoftjobMaster_lRec.WS_Job_Number, GetValueatCell(RowNo, 1));
            Evaluate(WennsoftjobMaster_lRec.Project_Number, GetValueatCell(RowNo, 2));
            Evaluate(WennsoftjobMaster_lRec.WS_Job_Name, GetValueatCell(RowNo, 3));
            Evaluate(WennsoftjobMaster_lRec.Divisions, GetValueatCell(RowNo, 4));
            Evaluate(WennsoftjobMaster_lRec.CUSTNMBR, GetValueatCell(RowNo, 5));
            Evaluate(WennsoftjobMaster_lRec.Job_Address_Code, GetValueatCell(RowNo, 6));
            Evaluate(WennsoftjobMaster_lRec.Bill_Customer_Number, GetValueatCell(RowNo, 7));
            Evaluate(WennsoftjobMaster_lRec.Job_Billto_Address_Code, GetValueatCell(RowNo, 8));
            Evaluate(WennsoftjobMaster_lRec.Estimator_ID, GetValueatCell(RowNo, 9));
            Evaluate(WennsoftjobMaster_lRec.WS_Manager_ID, GetValueatCell(RowNo, 10));
            Evaluate(WennsoftjobMaster_lRec.USERID, GetValueatCell(RowNo, 11));
            Evaluate(WennsoftjobMaster_lRec.Bid_Due_Date, GetValueatCell(RowNo, 12));
            Evaluate(WennsoftjobMaster_lRec.Schedule_Start_Date, GetValueatCell(RowNo, 13));
            Evaluate(WennsoftjobMaster_lRec.Sched_Completion_Date, GetValueatCell(RowNo, 14));
            Evaluate(WennsoftjobMaster_lRec.ACTCOMPDATE, GetValueatCell(RowNo, 15));
            Evaluate(WennsoftjobMaster_lRec.Est_Labor_Cost, GetValueatCell(RowNo, 16));
            Evaluate(WennsoftjobMaster_lRec.Est_Material_Cost, GetValueatCell(RowNo, 17));
            Evaluate(WennsoftjobMaster_lRec.Est_Equipment_Cost, GetValueatCell(RowNo, 18));
            Evaluate(WennsoftjobMaster_lRec.Est_Subs_Cost, GetValueatCell(RowNo, 19));
            Evaluate(WennsoftjobMaster_lRec.Est_Misc_Other_Cost, GetValueatCell(RowNo, 20));
            Evaluate(WennsoftjobMaster_lRec.Est_Cost_UserDef1, GetValueatCell(RowNo, 21));
            Evaluate(WennsoftjobMaster_lRec.Est_Cost_UserDef2, GetValueatCell(RowNo, 22));
            Evaluate(WennsoftjobMaster_lRec.Est_Cost_UserDef3, GetValueatCell(RowNo, 23));
            Evaluate(WennsoftjobMaster_lRec.Est_Cost_UserDef4, GetValueatCell(RowNo, 24));
            Evaluate(WennsoftjobMaster_lRec.Total_Estimated_Cost, GetValueatCell(RowNo, 25));
            Evaluate(WennsoftjobMaster_lRec.Est_Labor_Cost_Mkup, GetValueatCell(RowNo, 26));
            Evaluate(WennsoftjobMaster_lRec.Est_Equip_Cost_Mkup, GetValueatCell(RowNo, 27));
            Evaluate(WennsoftjobMaster_lRec.Est_Materials_Cost_Mkup, GetValueatCell(RowNo, 28));
            Evaluate(WennsoftjobMaster_lRec.Est_Subs_Cost_Markup, GetValueatCell(RowNo, 29));
            Evaluate(WennsoftjobMaster_lRec.Est_Misc_Other_Cst_Mkup, GetValueatCell(RowNo, 30));
            Evaluate(WennsoftjobMaster_lRec.Est_UserDef1_Cost_Mkup, GetValueatCell(RowNo, 31));
            Evaluate(WennsoftjobMaster_lRec.Est_UserDef2_Cost_Mkup, GetValueatCell(RowNo, 32));
            Evaluate(WennsoftjobMaster_lRec.Est_UserDef3_Cost_Mkup, GetValueatCell(RowNo, 33));
            Evaluate(WennsoftjobMaster_lRec.Est_UserDef4_Cost_Mkup, GetValueatCell(RowNo, 34));
            Evaluate(WennsoftjobMaster_lRec.Total_Est_Plus_Markup, GetValueatCell(RowNo, 35));
            Evaluate(WennsoftjobMaster_lRec.Calc_Pct_Compl_to_Date, GetValueatCell(RowNo, 36));
            Evaluate(WennsoftjobMaster_lRec.Est_Pct_Complete_to_Date, GetValueatCell(RowNo, 37));
            Evaluate(WennsoftjobMaster_lRec.JC_Contract_Number, GetValueatCell(RowNo, 38));
            Evaluate(WennsoftjobMaster_lRec.Contract_Type, GetValueatCell(RowNo, 39));
            Evaluate(WennsoftjobMaster_lRec.WS_Billing_Type, GetValueatCell(RowNo, 40));
            Evaluate(WennsoftjobMaster_lRec.Project_Billing, GetValueatCell(RowNo, 41));
            Evaluate(WennsoftjobMaster_lRec.Overhead_Labor_Pct, GetValueatCell(RowNo, 42));
            Evaluate(WennsoftjobMaster_lRec.Overhead_User_Def_Pct, GetValueatCell(RowNo, 43));
            Evaluate(WennsoftjobMaster_lRec.Overhead_Flat_Amount, GetValueatCell(RowNo, 44));
            Evaluate(WennsoftjobMaster_lRec.Orig_Contract_Amount, GetValueatCell(RowNo, 45));
            Evaluate(WennsoftjobMaster_lRec.Originating_Contract_Amt, GetValueatCell(RowNo, 46));
            Evaluate(WennsoftjobMaster_lRec.Contract_Max_Bill_Amt, GetValueatCell(RowNo, 47));
            Evaluate(WennsoftjobMaster_lRec.Confirmed_Chg_Order_Amt, GetValueatCell(RowNo, 48));
            Evaluate(WennsoftjobMaster_lRec.In_Process_Chg_Ord_Amt, GetValueatCell(RowNo, 49));
            Evaluate(WennsoftjobMaster_lRec.CO_Amount_UserDef1, GetValueatCell(RowNo, 50));
            Evaluate(WennsoftjobMaster_lRec.CO_Amount_UserDef2, GetValueatCell(RowNo, 51));
            Evaluate(WennsoftjobMaster_lRec.CO_Amount_UserDef3, GetValueatCell(RowNo, 52));
            Evaluate(WennsoftjobMaster_lRec.Contract_to_Date, GetValueatCell(RowNo, 53));
            Evaluate(WennsoftjobMaster_lRec.Orig_Contract_To_Date, GetValueatCell(RowNo, 54));
            Evaluate(WennsoftjobMaster_lRec.Retention_Pct, GetValueatCell(RowNo, 55));
            Evaluate(WennsoftjobMaster_lRec.Act_Labor_Cost_TTD, GetValueatCell(RowNo, 56));
            Evaluate(WennsoftjobMaster_lRec.Act_Materials_Cost_TTD, GetValueatCell(RowNo, 57));
            Evaluate(WennsoftjobMaster_lRec.Act_Equipment_Cost_TTD, GetValueatCell(RowNo, 58));
            Evaluate(WennsoftjobMaster_lRec.Act_Subs_Cost_TTD, GetValueatCell(RowNo, 59));
            Evaluate(WennsoftjobMaster_lRec.Act_Misc_Other_Cost_TTD, GetValueatCell(RowNo, 60));
            Evaluate(WennsoftjobMaster_lRec.Act_Cost_TTD_UserDef1, GetValueatCell(RowNo, 61));
            Evaluate(WennsoftjobMaster_lRec.Act_Cost_TTD_UserDef2, GetValueatCell(RowNo, 62));
            Evaluate(WennsoftjobMaster_lRec.Act_Cost_TTD_UserDef3, GetValueatCell(RowNo, 63));
            Evaluate(WennsoftjobMaster_lRec.Act_Cost_TTD_UserDef4, GetValueatCell(RowNo, 64));
            Evaluate(WennsoftjobMaster_lRec.Total_Actual_Cost, GetValueatCell(RowNo, 65));
            Evaluate(WennsoftjobMaster_lRec.Act_Labor_Cost_TTD_Mkup, GetValueatCell(RowNo, 66));
            Evaluate(WennsoftjobMaster_lRec.Act_Equip_Cost_TTD_Mkup, GetValueatCell(RowNo, 67));
            Evaluate(WennsoftjobMaster_lRec.Act_Materials_TTD_Mkup, GetValueatCell(RowNo, 68));
            Evaluate(WennsoftjobMaster_lRec.Act_Subs_Cost_TTD_Mkup, GetValueatCell(RowNo, 69));
            Evaluate(WennsoftjobMaster_lRec.Act_Other_Cost_TTD_Mkup, GetValueatCell(RowNo, 70));
            Evaluate(WennsoftjobMaster_lRec.Act_UserDef1_TTD_Mkup, GetValueatCell(RowNo, 71));
            Evaluate(WennsoftjobMaster_lRec.Act_UserDef2_TTD_Mkup, GetValueatCell(RowNo, 72));
            Evaluate(WennsoftjobMaster_lRec.Act_UserDef3_TTD_Mkup, GetValueatCell(RowNo, 73));
            Evaluate(WennsoftjobMaster_lRec.Act_UserDef4_TTD_Mkup, GetValueatCell(RowNo, 74));
            Evaluate(WennsoftjobMaster_lRec.Billed_Labor_TTD_Mkup, GetValueatCell(RowNo, 75));
            Evaluate(WennsoftjobMaster_lRec.Billed_Mat_Cst_TTD_Mkup, GetValueatCell(RowNo, 76));
            Evaluate(WennsoftjobMaster_lRec.Billed_EquipTTD_Mkup, GetValueatCell(RowNo, 77));
            Evaluate(WennsoftjobMaster_lRec.Billed_Subs_TTD_Mkup, GetValueatCell(RowNo, 78));
            Evaluate(WennsoftjobMaster_lRec.Billed_Other_TTD_Mkup, GetValueatCell(RowNo, 79));
            Evaluate(WennsoftjobMaster_lRec.Billed_UsrDef1_TTD_Mkup, GetValueatCell(RowNo, 80));
            Evaluate(WennsoftjobMaster_lRec.Billed_UsrDef2_TTD_Mkup, GetValueatCell(RowNo, 81));
            Evaluate(WennsoftjobMaster_lRec.Billed_UsrDef3_TTD_Mkup, GetValueatCell(RowNo, 82));
            Evaluate(WennsoftjobMaster_lRec.Billed_UsrDef4_TTD_Mkup, GetValueatCell(RowNo, 83));
            Evaluate(WennsoftjobMaster_lRec.Billed_Amount_TTD, GetValueatCell(RowNo, 84));
            Evaluate(WennsoftjobMaster_lRec.Retention_Amount_TTD, GetValueatCell(RowNo, 85));
            Evaluate(WennsoftjobMaster_lRec.Retention_Billed_TTD, GetValueatCell(RowNo, 86));
            Evaluate(WennsoftjobMaster_lRec.Net_Billed_TTD, GetValueatCell(RowNo, 87));
            Evaluate(WennsoftjobMaster_lRec.Cash_Received_TTD, GetValueatCell(RowNo, 88));
            Evaluate(WennsoftjobMaster_lRec.Billed_YTD, GetValueatCell(RowNo, 89));
            Evaluate(WennsoftjobMaster_lRec.Retention_Amount_YTD, GetValueatCell(RowNo, 90));
            Evaluate(WennsoftjobMaster_lRec.Retention_Billed_YTD, GetValueatCell(RowNo, 91));
            Evaluate(WennsoftjobMaster_lRec.MSCTXAMT, GetValueatCell(RowNo, 92));
            Evaluate(WennsoftjobMaster_lRec.TAXAMNT, GetValueatCell(RowNo, 93));
            Evaluate(WennsoftjobMaster_lRec.DISCAMNT, GetValueatCell(RowNo, 94));
            Evaluate(WennsoftjobMaster_lRec.WROFAMNT, GetValueatCell(RowNo, 95));
            Evaluate(WennsoftjobMaster_lRec.Net_Billed_YTD, GetValueatCell(RowNo, 96));
            Evaluate(WennsoftjobMaster_lRec.Cash_Received_YTD, GetValueatCell(RowNo, 97));
            Evaluate(WennsoftjobMaster_lRec.Last_Billing_Date, GetValueatCell(RowNo, 98));
            Evaluate(WennsoftjobMaster_lRec.Expected_Contract, GetValueatCell(RowNo, 99));
            Evaluate(WennsoftjobMaster_lRec.Orig_Expected_Contract, GetValueatCell(RowNo, 100));
            Evaluate(WennsoftjobMaster_lRec.CURNCYID, GetValueatCell(RowNo, 101));
            Evaluate(WennsoftjobMaster_lRec.CURRNIDX, GetValueatCell(RowNo, 102));
            Evaluate(WennsoftjobMaster_lRec.XCHGRATE, GetValueatCell(RowNo, 103));
            Evaluate(WennsoftjobMaster_lRec.EXCHDATE, GetValueatCell(RowNo, 104));
            Evaluate(WennsoftjobMaster_lRec.TIME1, GetValueatCell(RowNo, 105));
            Evaluate(WennsoftjobMaster_lRec.RATETPID, GetValueatCell(RowNo, 106));
            Evaluate(WennsoftjobMaster_lRec.EXGTBLID, GetValueatCell(RowNo, 107));
            Evaluate(WennsoftjobMaster_lRec.Act_Labor_Cost_YTD, GetValueatCell(RowNo, 108));
            Evaluate(WennsoftjobMaster_lRec.Act_Materials_Cost_YTD, GetValueatCell(RowNo, 109));
            Evaluate(WennsoftjobMaster_lRec.Act_Equipment_Cost_YTD, GetValueatCell(RowNo, 110));
            Evaluate(WennsoftjobMaster_lRec.Act_Subs_Cost_YTD, GetValueatCell(RowNo, 111));
            Evaluate(WennsoftjobMaster_lRec.Act_Misc_Other_YTD, GetValueatCell(RowNo, 112));
            Evaluate(WennsoftjobMaster_lRec.Act_Cost_YTD_UserDef1, GetValueatCell(RowNo, 113));
            Evaluate(WennsoftjobMaster_lRec.Act_Cost_YTD_UserDef2, GetValueatCell(RowNo, 114));
            Evaluate(WennsoftjobMaster_lRec.Act_Cost_YTD_UserDef3, GetValueatCell(RowNo, 115));
            Evaluate(WennsoftjobMaster_lRec.Act_Cost_YTD_UserDef4, GetValueatCell(RowNo, 116));
            Evaluate(WennsoftjobMaster_lRec.Tax_Exempt_Number, GetValueatCell(RowNo, 117));
            Evaluate(WennsoftjobMaster_lRec.TAXSCHID, GetValueatCell(RowNo, 118));
            Evaluate(WennsoftjobMaster_lRec.Committed_Equipment_TTD, GetValueatCell(RowNo, 119));
            Evaluate(WennsoftjobMaster_lRec.Committed_Materials_TTD, GetValueatCell(RowNo, 120));
            Evaluate(WennsoftjobMaster_lRec.Committed_Labor_TTD, GetValueatCell(RowNo, 121));
            Evaluate(WennsoftjobMaster_lRec.Committed_Subs_TTD, GetValueatCell(RowNo, 122));
            Evaluate(WennsoftjobMaster_lRec.Committed_Other_TTD, GetValueatCell(RowNo, 123));
            Evaluate(WennsoftjobMaster_lRec.Committed_TTD_UserDef1, GetValueatCell(RowNo, 124));
            Evaluate(WennsoftjobMaster_lRec.Committed_TTD_UserDef2, GetValueatCell(RowNo, 125));
            Evaluate(WennsoftjobMaster_lRec.Committed_TTD_UserDef3, GetValueatCell(RowNo, 126));
            Evaluate(WennsoftjobMaster_lRec.Committed_TTD_UserDef4, GetValueatCell(RowNo, 127));
            Evaluate(WennsoftjobMaster_lRec.Committed_Cost, GetValueatCell(RowNo, 128));
            Evaluate(WennsoftjobMaster_lRec.Forecast_Equipment_TTD, GetValueatCell(RowNo, 129));
            Evaluate(WennsoftjobMaster_lRec.Forecasted_Labor_TTD, GetValueatCell(RowNo, 130));
            Evaluate(WennsoftjobMaster_lRec.Forecast_Materials_TTD, GetValueatCell(RowNo, 131));
            Evaluate(WennsoftjobMaster_lRec.Forecast_Misc_Other_TTD, GetValueatCell(RowNo, 132));
            Evaluate(WennsoftjobMaster_lRec.Forecasted_Subs_TTD, GetValueatCell(RowNo, 133));
            Evaluate(WennsoftjobMaster_lRec.Forecast_UserDef1, GetValueatCell(RowNo, 134));
            Evaluate(WennsoftjobMaster_lRec.Forecast_UserDef2, GetValueatCell(RowNo, 135));
            Evaluate(WennsoftjobMaster_lRec.Forecast_UserDef3, GetValueatCell(RowNo, 136));
            Evaluate(WennsoftjobMaster_lRec.Forecast_UserDef4, GetValueatCell(RowNo, 137));
            Evaluate(WennsoftjobMaster_lRec.Total_Forecasted_Cost, GetValueatCell(RowNo, 138));
            Evaluate(WennsoftjobMaster_lRec.Revsd_Equip_Forecasted, GetValueatCell(RowNo, 139));
            Evaluate(WennsoftjobMaster_lRec.Revsd_Labor_Forecasted, GetValueatCell(RowNo, 140));
            Evaluate(WennsoftjobMaster_lRec.Revsd_Materials_Forecst, GetValueatCell(RowNo, 141));
            Evaluate(WennsoftjobMaster_lRec.Revsd_Subs_Forecast_Cst, GetValueatCell(RowNo, 142));
            Evaluate(WennsoftjobMaster_lRec.Revsd_Other_Forecst_Cst, GetValueatCell(RowNo, 143));
            Evaluate(WennsoftjobMaster_lRec.Revsd_Forecast_UserDef1, GetValueatCell(RowNo, 144));
            Evaluate(WennsoftjobMaster_lRec.Revsd_Forecast_UserDef2, GetValueatCell(RowNo, 145));
            Evaluate(WennsoftjobMaster_lRec.Revsd_Forecast_UserDef3, GetValueatCell(RowNo, 146));
            Evaluate(WennsoftjobMaster_lRec.Revsd_Forecast_UserDef4, GetValueatCell(RowNo, 147));
            Evaluate(WennsoftjobMaster_lRec.Tot_Revsd_Forecast_Cost, GetValueatCell(RowNo, 148));
            Evaluate(WennsoftjobMaster_lRec.Est_Labor_Units_TTD, GetValueatCell(RowNo, 149));
            Evaluate(WennsoftjobMaster_lRec.Act_Labor_Units_TTD, GetValueatCell(RowNo, 150));
            Evaluate(WennsoftjobMaster_lRec.Anticipated_Markup, GetValueatCell(RowNo, 151));
            Evaluate(WennsoftjobMaster_lRec.SUTASTAT, GetValueatCell(RowNo, 152));
            Evaluate(WennsoftjobMaster_lRec.LOCALTAX, GetValueatCell(RowNo, 153));
            Evaluate(WennsoftjobMaster_lRec.Certified_Payroll, GetValueatCell(RowNo, 154));
            Evaluate(WennsoftjobMaster_lRec.RATECLSS, GetValueatCell(RowNo, 155));
            Evaluate(WennsoftjobMaster_lRec.Exclude_from_POC_Calc, GetValueatCell(RowNo, 156));
            Evaluate(WennsoftjobMaster_lRec.WS_Markup_Percent, GetValueatCell(RowNo, 157));
            Evaluate(WennsoftjobMaster_lRec.Revsd_Forecast_Lab_Units, GetValueatCell(RowNo, 158));
            Evaluate(WennsoftjobMaster_lRec.Total_Act_Plus_Markup, GetValueatCell(RowNo, 159));
            Evaluate(WennsoftjobMaster_lRec.User_Define_1, GetValueatCell(RowNo, 160));
            Evaluate(WennsoftjobMaster_lRec.User_Define_2, GetValueatCell(RowNo, 161));
            Evaluate(WennsoftjobMaster_lRec.USERDEF1, GetValueatCell(RowNo, 162));
            Evaluate(WennsoftjobMaster_lRec.USERDEF2, GetValueatCell(RowNo, 163));
            Evaluate(WennsoftjobMaster_lRec.User_Def_Integer_1, GetValueatCell(RowNo, 164));
            Evaluate(WennsoftjobMaster_lRec.User_Def_Integer_2, GetValueatCell(RowNo, 165));
            Evaluate(WennsoftjobMaster_lRec.User_Defined_Integer_3, GetValueatCell(RowNo, 166));
            Evaluate(WennsoftjobMaster_lRec.User_Defined_Integer_4, GetValueatCell(RowNo, 167));
            Evaluate(WennsoftjobMaster_lRec.User_Defined_Dollar_1, GetValueatCell(RowNo, 168));
            Evaluate(WennsoftjobMaster_lRec.User_Defined_Dollar_2, GetValueatCell(RowNo, 169));
            Evaluate(WennsoftjobMaster_lRec.User_Defined_Dollar_3, GetValueatCell(RowNo, 170));
            Evaluate(WennsoftjobMaster_lRec.User_Defined_Dollar_4, GetValueatCell(RowNo, 171));
            Evaluate(WennsoftjobMaster_lRec.USRDAT01, GetValueatCell(RowNo, 172));
            Evaluate(WennsoftjobMaster_lRec.USRDAT02, GetValueatCell(RowNo, 173));
            Evaluate(WennsoftjobMaster_lRec.User_Defined_Date_3, GetValueatCell(RowNo, 174));
            Evaluate(WennsoftjobMaster_lRec.User_Defined_Date_4, GetValueatCell(RowNo, 175));
            Evaluate(WennsoftjobMaster_lRec.User_Defined_CB_1, GetValueatCell(RowNo, 176));
            Evaluate(WennsoftjobMaster_lRec.User_Defined_CB_2, GetValueatCell(RowNo, 177));
            Evaluate(WennsoftjobMaster_lRec.User_Defined_CB_3, GetValueatCell(RowNo, 178));
            Evaluate(WennsoftjobMaster_lRec.User_Defined_CB_4, GetValueatCell(RowNo, 179));
            Evaluate(WennsoftjobMaster_lRec.Wennsoft_Affiliate, GetValueatCell(RowNo, 180));
            Evaluate(WennsoftjobMaster_lRec.Wennsoft_Branch, GetValueatCell(RowNo, 181));
            Evaluate(WennsoftjobMaster_lRec.Wennsoft_Region, GetValueatCell(RowNo, 182));
            Evaluate(WennsoftjobMaster_lRec.MODIFDT, GetValueatCell(RowNo, 183));
            Evaluate(WennsoftjobMaster_lRec.Modified_Time, GetValueatCell(RowNo, 184));
            Evaluate(WennsoftjobMaster_lRec.MDFUSRID, GetValueatCell(RowNo, 185));
            Evaluate(WennsoftjobMaster_lRec.SV_Language_ID, GetValueatCell(RowNo, 186));
            Evaluate(WennsoftjobMaster_lRec.Time_Zone, GetValueatCell(RowNo, 187));
            Evaluate(WennsoftjobMaster_lRec.Technician_ID, GetValueatCell(RowNo, 188));
            Evaluate(WennsoftjobMaster_lRec.Technician_Team, GetValueatCell(RowNo, 189));
            Evaluate(WennsoftjobMaster_lRec.WS_Inactive, GetValueatCell(RowNo, 190));
            Evaluate(WennsoftjobMaster_lRec.WSReserved_CB1, GetValueatCell(RowNo, 191));
            Evaluate(WennsoftjobMaster_lRec.WSReserved_CB2, GetValueatCell(RowNo, 192));
            Evaluate(WennsoftjobMaster_lRec.WSReserved_CB3, GetValueatCell(RowNo, 193));
            Evaluate(WennsoftjobMaster_lRec.WSReserved_CB4, GetValueatCell(RowNo, 194));
            Evaluate(WennsoftjobMaster_lRec.WSReserved_CB5, GetValueatCell(RowNo, 195));
            Evaluate(WennsoftjobMaster_lRec.WSReserved_CB6, GetValueatCell(RowNo, 196));
            Evaluate(WennsoftjobMaster_lRec.WSReserved_CB7, GetValueatCell(RowNo, 197));
            Evaluate(WennsoftjobMaster_lRec.WSReserved_CB8, GetValueatCell(RowNo, 198));
            Evaluate(WennsoftjobMaster_lRec.WSReserved_CB9, GetValueatCell(RowNo, 199));
            Evaluate(WennsoftjobMaster_lRec.WSReserved_CB10, GetValueatCell(RowNo, 200));
            Evaluate(WennsoftjobMaster_lRec.WSReserved_STR1, GetValueatCell(RowNo, 201));
            Evaluate(WennsoftjobMaster_lRec.WSReserved_STR2, GetValueatCell(RowNo, 202));
            Evaluate(WennsoftjobMaster_lRec.CREATDDT, GetValueatCell(RowNo, 203));
            Evaluate(WennsoftjobMaster_lRec.CRUSRID, GetValueatCell(RowNo, 204));
            Evaluate(WennsoftjobMaster_lRec.Reimbursable, GetValueatCell(RowNo, 205));
            Evaluate(WennsoftjobMaster_lRec.Job_Customer_ID, GetValueatCell(RowNo, 206));
            Evaluate(WennsoftjobMaster_lRec.USETAXSCHID, GetValueatCell(RowNo, 207));
            Evaluate(WennsoftjobMaster_lRec.STATECD, GetValueatCell(RowNo, 208));
            Evaluate(WennsoftjobMaster_lRec.Invoice_Style, GetValueatCell(RowNo, 209));
            Evaluate(WennsoftjobMaster_lRec.Revenue_Rec_Method_ID, GetValueatCell(RowNo, 210));
            Evaluate(WennsoftjobMaster_lRec.Exclude_from_RPO_Calc, GetValueatCell(RowNo, 211));
            Evaluate(WennsoftjobMaster_lRec.DEX_ROW_ID, GetValueatCell(RowNo, 212));
            WennsoftjobMaster_lRec."File Name" := FileName_gTxt;
            WennsoftjobMaster_lRec."File Imported Date" := CurrentDateTime;
            WennsoftjobMaster_lRec."File Imported By" := UserId;
            WennsoftjobMaster_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    local procedure ImportExcelData_CostCodeDetails()
    var
        Wensoft_cost_cold_Details: Record "Wensoft Cost Code Details";
        Wensoft_cost_cold_Details1: Record "Wensoft Cost Code Details";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        Wensoft_cost_cold_Details.Reset();
        if Wensoft_cost_cold_Details.FindLast() then
            EntryNo := Wensoft_cost_cold_Details."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        Wensoft_cost_cold_Details1.SetRange("File Name", FileName_gTxt);
        if Wensoft_cost_cold_Details1.Findset() then
            Error('%1 is already existed', FileName_gTxt);

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            Wensoft_cost_cold_Details.Init();
            Wensoft_cost_cold_Details."Entry No." := EntryNo;
            Evaluate(Wensoft_cost_cold_Details.WS_Job_Number, GetValueatCell(RowNo, 1));
            Evaluate(Wensoft_cost_cold_Details.Project_Number, GetValueatCell(RowNo, 2));
            Evaluate(Wensoft_cost_cold_Details.Cost_Code_Number_1, GetValueatCell(RowNo, 3));
            Evaluate(Wensoft_cost_cold_Details.Cost_Code_Number_2, GetValueatCell(RowNo, 4));
            Evaluate(Wensoft_cost_cold_Details.Cost_Code_Number_3, GetValueatCell(RowNo, 5));
            Evaluate(Wensoft_cost_cold_Details.Cost_Code_Number_4, GetValueatCell(RowNo, 6));
            Evaluate(Wensoft_cost_cold_Details.Cost_Code_Alias, GetValueatCell(RowNo, 7));
            Evaluate(Wensoft_cost_cold_Details.Cost_Code_Description, GetValueatCell(RowNo, 8));
            Evaluate(Wensoft_cost_cold_Details.Cost_Element, GetValueatCell(RowNo, 9));
            Evaluate(Wensoft_cost_cold_Details.WS_Manager_ID, GetValueatCell(RowNo, 10));
            Evaluate(Wensoft_cost_cold_Details.WS_Inactive, GetValueatCell(RowNo, 11));
            Evaluate(Wensoft_cost_cold_Details.Profit_Type_Number, GetValueatCell(RowNo, 12));
            Evaluate(Wensoft_cost_cold_Details.Profit_Amount, GetValueatCell(RowNo, 13));
            Evaluate(Wensoft_cost_cold_Details.Type_of_Transaction, GetValueatCell(RowNo, 14));
            Evaluate(Wensoft_cost_cold_Details.Next_Subdivision_Type, GetValueatCell(RowNo, 15));
            Evaluate(Wensoft_cost_cold_Details.WS_Account_Index_1, GetValueatCell(RowNo, 16));
            Evaluate(Wensoft_cost_cold_Details.WS_Account_Index_2, GetValueatCell(RowNo, 17));
            Evaluate(Wensoft_cost_cold_Details.Added_By_CO_Module, GetValueatCell(RowNo, 18));
            Evaluate(Wensoft_cost_cold_Details.Track_Production_Qty, GetValueatCell(RowNo, 19));
            Evaluate(Wensoft_cost_cold_Details.Cost_Code_Act_Cost_TTD, GetValueatCell(RowNo, 20));
            Evaluate(Wensoft_cost_cold_Details.Cost_Code_Act_Cost_YTD, GetValueatCell(RowNo, 21));
            Evaluate(Wensoft_cost_cold_Details.Actual_Units_TTD, GetValueatCell(RowNo, 22));
            Evaluate(Wensoft_cost_cold_Details.Cost_Code_Estimated_Cst, GetValueatCell(RowNo, 23));
            Evaluate(Wensoft_cost_cold_Details.Change_Order_Est_Cost, GetValueatCell(RowNo, 24));
            Evaluate(Wensoft_cost_cold_Details.Cost_Code_Rvsd_Est_Cost, GetValueatCell(RowNo, 25));
            Evaluate(Wensoft_cost_cold_Details.Cost_Code_Forecast_Cost, GetValueatCell(RowNo, 26));
            Evaluate(Wensoft_cost_cold_Details.Cost_Code_Rvsd_Forecast, GetValueatCell(RowNo, 27));
            Evaluate(Wensoft_cost_cold_Details.Forecasted_Units, GetValueatCell(RowNo, 28));
            Evaluate(Wensoft_cost_cold_Details.Committed_Cost, GetValueatCell(RowNo, 29));
            Evaluate(Wensoft_cost_cold_Details.Committed_Units, GetValueatCell(RowNo, 30));
            Evaluate(Wensoft_cost_cold_Details.Cost_Code_Est_Unit, GetValueatCell(RowNo, 31));
            Evaluate(Wensoft_cost_cold_Details.Estimated_Amt_Units, GetValueatCell(RowNo, 32));
            Evaluate(Wensoft_cost_cold_Details.Production_Estimate_Qty, GetValueatCell(RowNo, 33));
            Evaluate(Wensoft_cost_cold_Details.Production_Actual_Qty, GetValueatCell(RowNo, 34));
            Evaluate(Wensoft_cost_cold_Details.Production_Qty_Unit, GetValueatCell(RowNo, 35));
            Evaluate(Wensoft_cost_cold_Details.Production_Qty_Curr_Per, GetValueatCell(RowNo, 36));
            Evaluate(Wensoft_cost_cold_Details.Production_Best, GetValueatCell(RowNo, 37));
            Evaluate(Wensoft_cost_cold_Details.Production_Best_Date, GetValueatCell(RowNo, 38));
            Evaluate(Wensoft_cost_cold_Details.Production_Measure_Code, GetValueatCell(RowNo, 39));
            Evaluate(Wensoft_cost_cold_Details.OVHD1_UOM, GetValueatCell(RowNo, 40));
            Evaluate(Wensoft_cost_cold_Details.OVHD1_Type, GetValueatCell(RowNo, 41));
            Evaluate(Wensoft_cost_cold_Details.OVHD1_Percent, GetValueatCell(RowNo, 42));
            Evaluate(Wensoft_cost_cold_Details.OVHD1_Estimated_Units, GetValueatCell(RowNo, 43));
            Evaluate(Wensoft_cost_cold_Details.OVHD1_Actual_Units, GetValueatCell(RowNo, 44));
            Evaluate(Wensoft_cost_cold_Details.OVHD1_Forecasted_Units, GetValueatCell(RowNo, 45));
            Evaluate(Wensoft_cost_cold_Details.OVHD1_Amt_Per_Unit, GetValueatCell(RowNo, 46));
            Evaluate(Wensoft_cost_cold_Details.OVHD1_Estimated_Amount, GetValueatCell(RowNo, 47));
            Evaluate(Wensoft_cost_cold_Details.OVHD1_Actual_Amount, GetValueatCell(RowNo, 48));
            Evaluate(Wensoft_cost_cold_Details.OVHD1_Profit_Type, GetValueatCell(RowNo, 49));
            Evaluate(Wensoft_cost_cold_Details.OVHD1_Profit_Amount, GetValueatCell(RowNo, 50));
            Evaluate(Wensoft_cost_cold_Details.OVHD2_UOM, GetValueatCell(RowNo, 51));
            Evaluate(Wensoft_cost_cold_Details.OVHD2_Type, GetValueatCell(RowNo, 52));
            Evaluate(Wensoft_cost_cold_Details.OVHD2_Percent, GetValueatCell(RowNo, 53));
            Evaluate(Wensoft_cost_cold_Details.OVHD2_Estimated_Units, GetValueatCell(RowNo, 54));
            Evaluate(Wensoft_cost_cold_Details.OVHD2_Actual_Units, GetValueatCell(RowNo, 55));
            Evaluate(Wensoft_cost_cold_Details.OVHD2_Forecasted_Units, GetValueatCell(RowNo, 56));
            Evaluate(Wensoft_cost_cold_Details.OVHD2_Amt_Per_Unit, GetValueatCell(RowNo, 57));
            Evaluate(Wensoft_cost_cold_Details.OVHD2_Estimated_Amount, GetValueatCell(RowNo, 58));
            Evaluate(Wensoft_cost_cold_Details.OVHD2_Actual_Amount, GetValueatCell(RowNo, 59));
            Evaluate(Wensoft_cost_cold_Details.OVHD2_Profit_Type, GetValueatCell(RowNo, 60));
            Evaluate(Wensoft_cost_cold_Details.OVHD2_Profit_Amount, GetValueatCell(RowNo, 61));
            Evaluate(Wensoft_cost_cold_Details.Bill_Type, GetValueatCell(RowNo, 62));
            IF (GetValueatCell(RowNo, 63)) <> '0' then
                Evaluate(Wensoft_cost_cold_Details.Sched_Completion_Date, (GetValueatCell(RowNo, 63)));
            if (GetValueatCell(RowNo, 64)) <> '0' then
                Evaluate(Wensoft_cost_cold_Details.ACTCOMPDATE, (GetValueatCell(RowNo, 64)));
            if (GetValueatCell(RowNo, 65)) <> '0' then
                Evaluate(Wensoft_cost_cold_Details.Schedule_Start_Date, (GetValueatCell(RowNo, 65)));
            if (GetValueatCell(RowNo, 66)) <> '0' then
                Evaluate(Wensoft_cost_cold_Details.ACTSTARTDATE, (GetValueatCell(RowNo, 66)));
            Evaluate(Wensoft_cost_cold_Details.Billing_Schedule_Line, (GetValueatCell(RowNo, 67)));
            Evaluate(Wensoft_cost_cold_Details.Estimated_Measure_Code, GetValueatCell(RowNo, 68));
            Evaluate(Wensoft_cost_cold_Details.Amount_Pct_Complete, GetValueatCell(RowNo, 69));
            Evaluate(Wensoft_cost_cold_Details.Units_Pct_Complete, GetValueatCell(RowNo, 70));
            Evaluate(Wensoft_cost_cold_Details.Production_Pct_Complete, GetValueatCell(RowNo, 71));
            Evaluate(Wensoft_cost_cold_Details.Field_Pct_Complete, GetValueatCell(RowNo, 72));
            Evaluate(Wensoft_cost_cold_Details.Posted_To, GetValueatCell(RowNo, 73));
            Evaluate(Wensoft_cost_cold_Details.WRKRCOMP, GetValueatCell(RowNo, 74));
            Evaluate(Wensoft_cost_cold_Details.Change_Order_Est_Units, GetValueatCell(RowNo, 75));
            Evaluate(Wensoft_cost_cold_Details.Labor_Group_Name, GetValueatCell(RowNo, 76));
            Evaluate(Wensoft_cost_cold_Details.USERID, GetValueatCell(RowNo, 77));
            Evaluate(Wensoft_cost_cold_Details.User_Define_1, GetValueatCell(RowNo, 78));
            Evaluate(Wensoft_cost_cold_Details.User_Define_2, GetValueatCell(RowNo, 79));
            Evaluate(Wensoft_cost_cold_Details.USERDEF1, GetValueatCell(RowNo, 80));
            Evaluate(Wensoft_cost_cold_Details.USERDEF2, GetValueatCell(RowNo, 81));
            Evaluate(Wensoft_cost_cold_Details.User_Def_Integer_1, GetValueatCell(RowNo, 82));
            Evaluate(Wensoft_cost_cold_Details.User_Def_Integer_2, GetValueatCell(RowNo, 83));
            Evaluate(Wensoft_cost_cold_Details.User_Defined_Integer_3, GetValueatCell(RowNo, 84));
            Evaluate(Wensoft_cost_cold_Details.User_Defined_Integer_4, GetValueatCell(RowNo, 85));
            Evaluate(Wensoft_cost_cold_Details.User_Defined_Dollar_1, GetValueatCell(RowNo, 86));
            Evaluate(Wensoft_cost_cold_Details.User_Defined_Dollar_2, GetValueatCell(RowNo, 87));
            Evaluate(Wensoft_cost_cold_Details.User_Defined_Dollar_3, GetValueatCell(RowNo, 88));
            Evaluate(Wensoft_cost_cold_Details.User_Defined_Dollar_4, GetValueatCell(RowNo, 89));
            if (GetValueatCell(RowNo, 90)) <> '0' then
                Evaluate(Wensoft_cost_cold_Details.USRDAT01, (GetValueatCell(RowNo, 90)));
            if (GetValueatCell(RowNo, 91)) <> '0' then
                Evaluate(Wensoft_cost_cold_Details.USRDAT02, (GetValueatCell(RowNo, 91)));
            if (GetValueatCell(RowNo, 92)) <> '0' then
                Evaluate(Wensoft_cost_cold_Details.User_Defined_Date_3, (GetValueatCell(RowNo, 92)));
            if (GetValueatCell(RowNo, 93)) <> '0' then
                Evaluate(Wensoft_cost_cold_Details.User_Defined_Date_4, (GetValueatCell(RowNo, 93)));
            Evaluate(Wensoft_cost_cold_Details.User_Defined_CB_1, GetValueatCell(RowNo, 94));
            Evaluate(Wensoft_cost_cold_Details.User_Defined_CB_2, GetValueatCell(RowNo, 95));
            Evaluate(Wensoft_cost_cold_Details.User_Defined_CB_3, GetValueatCell(RowNo, 96));
            Evaluate(Wensoft_cost_cold_Details.User_Defined_CB_4, GetValueatCell(RowNo, 97));
            Evaluate(Wensoft_cost_cold_Details.VNDRNMBR, GetValueatCell(RowNo, 98));
            Evaluate(Wensoft_cost_cold_Details.ITEMNMBR, GetValueatCell(RowNo, 99));
            Evaluate(Wensoft_cost_cold_Details.PORDNMBR, GetValueatCell(RowNo, 100));
            Evaluate(Wensoft_cost_cold_Details.CC_Rvsd_Forecast_Units, GetValueatCell(RowNo, 10));
            Evaluate(Wensoft_cost_cold_Details.Rate_Per_Unit, GetValueatCell(RowNo, 102));
            Evaluate(Wensoft_cost_cold_Details.Original_Estimate_Units, GetValueatCell(RowNo, 103));
            Evaluate(Wensoft_cost_cold_Details.Original_Forecast_Units, GetValueatCell(RowNo, 104));
            Evaluate(Wensoft_cost_cold_Details.Wennsoft_Affiliate, GetValueatCell(RowNo, 105));
            Evaluate(Wensoft_cost_cold_Details.Wennsoft_Branch, GetValueatCell(RowNo, 106));
            Evaluate(Wensoft_cost_cold_Details.Wennsoft_Region, GetValueatCell(RowNo, 107));
            //  if (GetValueatCell(RowNo, 108)) <> '0' then
            Evaluate(Wensoft_cost_cold_Details.MODIFDT, (GetValueatCell(RowNo, 108)));
            Evaluate(Wensoft_cost_cold_Details.Modified_Time, (GetValueatCell(RowNo, 109)));
            Evaluate(Wensoft_cost_cold_Details.MDFUSRID, GetValueatCell(RowNo, 110));
            Evaluate(Wensoft_cost_cold_Details.SV_Language_ID, GetValueatCell(RowNo, 111));
            Evaluate(Wensoft_cost_cold_Details.Time_Zone, GetValueatCell(RowNo, 112));
            Evaluate(Wensoft_cost_cold_Details.WSReserved_CB1, GetValueatCell(RowNo, 113));
            Evaluate(Wensoft_cost_cold_Details.WSReserved_CB2, GetValueatCell(RowNo, 114));
            Evaluate(Wensoft_cost_cold_Details.WSReserved_CB3, GetValueatCell(RowNo, 115));
            Evaluate(Wensoft_cost_cold_Details.WSReserved_CB4, GetValueatCell(RowNo, 116));
            Evaluate(Wensoft_cost_cold_Details.WSReserved_CB5, GetValueatCell(RowNo, 117));
            Evaluate(Wensoft_cost_cold_Details.WSReserved_CB6, GetValueatCell(RowNo, 118));
            Evaluate(Wensoft_cost_cold_Details.WSReserved_CB7, GetValueatCell(RowNo, 119));
            Evaluate(Wensoft_cost_cold_Details.WSReserved_CB8, GetValueatCell(RowNo, 120));
            Evaluate(Wensoft_cost_cold_Details.WSReserved_CB9, GetValueatCell(RowNo, 121));
            Evaluate(Wensoft_cost_cold_Details.WSReserved_CB10, GetValueatCell(RowNo, 122));
            Evaluate(Wensoft_cost_cold_Details.WSReserved_STR1, GetValueatCell(RowNo, 123));
            Evaluate(Wensoft_cost_cold_Details.WSReserved_STR2, GetValueatCell(RowNo, 124));
            Evaluate(Wensoft_cost_cold_Details.Revenue_Code, GetValueatCell(RowNo, 125));
            Evaluate(Wensoft_cost_cold_Details.DEX_ROW_ID, GetValueatCell(RowNo, 126));
            Wensoft_cost_cold_Details."File Name" := FileName_gTxt;
            Wensoft_cost_cold_Details."File Imported Date" := CurrentDateTime;
            Wensoft_cost_cold_Details."File Imported By" := UserId;
            Wensoft_cost_cold_Details.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    local procedure ImportExcelData_JobSummary()
    var
        WennsoftJobSummary_lRec: Record "Wennsoft Job Summary";
        WennsoftJobSummary_lRec1: Record "Wennsoft Job Summary";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        WennsoftJobSummary_lRec.Reset();
        if WennsoftJobSummary_lRec.FindLast() then
            EntryNo := WennsoftJobSummary_lRec."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        WennsoftJobSummary_lRec1.SetRange("File Name", FileName_gTxt);
        if WennsoftJobSummary_lRec1.Findset() then
            Error('%1 is already existed', FileName_gTxt);

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            WennsoftJobSummary_lRec.Init();
            WennsoftJobSummary_lRec."Entry No." := EntryNo;
            Evaluate(WennsoftJobSummary_lRec.WS_Job_Number, GetValueatCell(RowNo, 1));
            Evaluate(WennsoftJobSummary_lRec.PERIODID, GetValueatCell(RowNo, 2));
            Evaluate(WennsoftJobSummary_lRec.YEAR1, GetValueatCell(RowNo, 3));
            Evaluate(WennsoftJobSummary_lRec.Project_Number, GetValueatCell(RowNo, 4));
            Evaluate(WennsoftJobSummary_lRec.WS_Job_Name, GetValueatCell(RowNo, 5));
            Evaluate(WennsoftJobSummary_lRec.Divisions, GetValueatCell(RowNo, 6));
            Evaluate(WennsoftJobSummary_lRec.CUSTNMBR, GetValueatCell(RowNo, 7));
            Evaluate(WennsoftJobSummary_lRec.JC_Contract_Number, GetValueatCell(RowNo, 8));
            Evaluate(WennsoftJobSummary_lRec.Contract_Type, GetValueatCell(RowNo, 9));
            Evaluate(WennsoftJobSummary_lRec.WS_Billing_Type, GetValueatCell(RowNo, 10));
            Evaluate(WennsoftJobSummary_lRec.Contract_to_Date, GetValueatCell(RowNo, 11));
            Evaluate(WennsoftJobSummary_lRec.Retention_Pct, GetValueatCell(RowNo, 12));
            Evaluate(WennsoftJobSummary_lRec.Actual_Units_TTD, GetValueatCell(RowNo, 13));
            Evaluate(WennsoftJobSummary_lRec.Act_Labor_Cost_TTD, GetValueatCell(RowNo, 14));
            Evaluate(WennsoftJobSummary_lRec.Act_Materials_Cost_TTD, GetValueatCell(RowNo, 15));
            Evaluate(WennsoftJobSummary_lRec.Act_Equipment_Cost_TTD, GetValueatCell(RowNo, 16));
            Evaluate(WennsoftJobSummary_lRec.Act_Subs_Cost_TTD, GetValueatCell(RowNo, 17));
            Evaluate(WennsoftJobSummary_lRec.Act_Misc_Other_Cost_TTD, GetValueatCell(RowNo, 18));
            Evaluate(WennsoftJobSummary_lRec.Act_Cost_TTD_UserDef1, GetValueatCell(RowNo, 19));
            Evaluate(WennsoftJobSummary_lRec.Act_Cost_TTD_UserDef2, GetValueatCell(RowNo, 20));
            Evaluate(WennsoftJobSummary_lRec.Act_Cost_TTD_UserDef3, GetValueatCell(RowNo, 21));
            Evaluate(WennsoftJobSummary_lRec.Act_Cost_TTD_UserDef4, GetValueatCell(RowNo, 22));
            Evaluate(WennsoftJobSummary_lRec.Total_Actual_Cost, GetValueatCell(RowNo, 23));
            Evaluate(WennsoftJobSummary_lRec.Orig_Contract_Amount, GetValueatCell(RowNo, 24));
            Evaluate(WennsoftJobSummary_lRec.Contract_Earned, GetValueatCell(RowNo, 25));
            Evaluate(WennsoftJobSummary_lRec.Contract_Earned_Curr_Mo, GetValueatCell(RowNo, 26));
            Evaluate(WennsoftJobSummary_lRec.Billed_Labor_TTD_Mkup, GetValueatCell(RowNo, 27));
            Evaluate(WennsoftJobSummary_lRec.Billed_Mat_Cst_TTD_Mkup, GetValueatCell(RowNo, 28));
            Evaluate(WennsoftJobSummary_lRec.Billed_EquipTTD_Mkup, GetValueatCell(RowNo, 29));
            Evaluate(WennsoftJobSummary_lRec.Billed_Subs_TTD_Mkup, GetValueatCell(RowNo, 30));
            Evaluate(WennsoftJobSummary_lRec.Billed_Other_TTD_Mkup, GetValueatCell(RowNo, 31));
            Evaluate(WennsoftJobSummary_lRec.Billed_UsrDef1_TTD_Mkup, GetValueatCell(RowNo, 32));
            Evaluate(WennsoftJobSummary_lRec.Billed_UsrDef2_TTD_Mkup, GetValueatCell(RowNo, 33));
            Evaluate(WennsoftJobSummary_lRec.Billed_UsrDef3_TTD_Mkup, GetValueatCell(RowNo, 34));
            Evaluate(WennsoftJobSummary_lRec.Billed_UsrDef4_TTD_Mkup, GetValueatCell(RowNo, 35));
            Evaluate(WennsoftJobSummary_lRec.Billed_Amount_TTD, GetValueatCell(RowNo, 36));
            Evaluate(WennsoftJobSummary_lRec.Retention_Amount_TTD, GetValueatCell(RowNo, 37));
            Evaluate(WennsoftJobSummary_lRec.Retention_Billed_TTD, GetValueatCell(RowNo, 38));
            Evaluate(WennsoftJobSummary_lRec.Net_Billed_TTD, GetValueatCell(RowNo, 39));
            Evaluate(WennsoftJobSummary_lRec.Cash_Received_TTD, GetValueatCell(RowNo, 40));
            Evaluate(WennsoftJobSummary_lRec.MSCTXAMT, GetValueatCell(RowNo, 41));
            Evaluate(WennsoftJobSummary_lRec.TAXAMNT, GetValueatCell(RowNo, 42));
            Evaluate(WennsoftJobSummary_lRec.DISCAMNT, GetValueatCell(RowNo, 43));
            Evaluate(WennsoftJobSummary_lRec.WROFAMNT, GetValueatCell(RowNo, 44));
            Evaluate(WennsoftJobSummary_lRec.Last_Billing_Date, GetValueatCell(RowNo, 45));
            Evaluate(WennsoftJobSummary_lRec.Expected_Contract, GetValueatCell(RowNo, 46));
            Evaluate(WennsoftJobSummary_lRec.Committed_Equipment_TTD, GetValueatCell(RowNo, 47));
            Evaluate(WennsoftJobSummary_lRec.Committed_Materials_TTD, GetValueatCell(RowNo, 48));
            Evaluate(WennsoftJobSummary_lRec.Committed_Labor_TTD, GetValueatCell(RowNo, 49));
            Evaluate(WennsoftJobSummary_lRec.Committed_Subs_TTD, GetValueatCell(RowNo, 50));
            Evaluate(WennsoftJobSummary_lRec.Committed_Other_TTD, GetValueatCell(RowNo, 51));
            Evaluate(WennsoftJobSummary_lRec.Committed_TTD_UserDef1, GetValueatCell(RowNo, 52));
            Evaluate(WennsoftJobSummary_lRec.Committed_TTD_UserDef2, GetValueatCell(RowNo, 53));
            Evaluate(WennsoftJobSummary_lRec.Committed_TTD_UserDef3, GetValueatCell(RowNo, 54));
            Evaluate(WennsoftJobSummary_lRec.Committed_TTD_UserDef4, GetValueatCell(RowNo, 55));
            Evaluate(WennsoftJobSummary_lRec.Committed_Cost, GetValueatCell(RowNo, 56));
            Evaluate(WennsoftJobSummary_lRec.Revsd_Equip_Forecasted, GetValueatCell(RowNo, 57));
            Evaluate(WennsoftJobSummary_lRec.Revsd_Labor_Forecasted, GetValueatCell(RowNo, 58));
            Evaluate(WennsoftJobSummary_lRec.Revsd_Materials_Forecst, GetValueatCell(RowNo, 59));
            Evaluate(WennsoftJobSummary_lRec.Revsd_Subs_Forecast_Cst, GetValueatCell(RowNo, 60));
            Evaluate(WennsoftJobSummary_lRec.Revsd_Other_Forecst_Cst, GetValueatCell(RowNo, 61));
            Evaluate(WennsoftJobSummary_lRec.Revsd_Forecast_UserDef1, GetValueatCell(RowNo, 62));
            Evaluate(WennsoftJobSummary_lRec.Revsd_Forecast_UserDef2, GetValueatCell(RowNo, 63));
            Evaluate(WennsoftJobSummary_lRec.Revsd_Forecast_UserDef3, GetValueatCell(RowNo, 64));
            Evaluate(WennsoftJobSummary_lRec.Revsd_Forecast_UserDef4, GetValueatCell(RowNo, 65));
            Evaluate(WennsoftJobSummary_lRec.Tot_Revsd_Forecast_Cost, GetValueatCell(RowNo, 66));
            Evaluate(WennsoftJobSummary_lRec.Confirmed_Chg_Order_Amt, GetValueatCell(RowNo, 67));
            Evaluate(WennsoftJobSummary_lRec.In_Process_Chg_Ord_Amt, GetValueatCell(RowNo, 68));
            Evaluate(WennsoftJobSummary_lRec.CO_Amount_UserDef1, GetValueatCell(RowNo, 69));
            Evaluate(WennsoftJobSummary_lRec.CO_Amount_UserDef2, GetValueatCell(RowNo, 70));
            Evaluate(WennsoftJobSummary_lRec.CO_Amount_UserDef3, GetValueatCell(RowNo, 71));
            Evaluate(WennsoftJobSummary_lRec.Est_Labor_Units_TTD, GetValueatCell(RowNo, 72));
            Evaluate(WennsoftJobSummary_lRec.Act_Labor_Units_TTD, GetValueatCell(RowNo, 73));
            Evaluate(WennsoftJobSummary_lRec.Total_Act_Plus_Markup, GetValueatCell(RowNo, 74));
            Evaluate(WennsoftJobSummary_lRec.Revsd_Forecast_Lab_Units, GetValueatCell(RowNo, 75));
            Evaluate(WennsoftJobSummary_lRec.User_Define_1, GetValueatCell(RowNo, 76));
            Evaluate(WennsoftJobSummary_lRec.User_Define_2, GetValueatCell(RowNo, 77));
            Evaluate(WennsoftJobSummary_lRec.USERDEF1, GetValueatCell(RowNo, 78));
            Evaluate(WennsoftJobSummary_lRec.USERDEF2, GetValueatCell(RowNo, 79));
            Evaluate(WennsoftJobSummary_lRec.User_Def_Integer_1, GetValueatCell(RowNo, 80));
            Evaluate(WennsoftJobSummary_lRec.User_Def_Integer_2, GetValueatCell(RowNo, 81));
            Evaluate(WennsoftJobSummary_lRec.User_Defined_Integer_3, GetValueatCell(RowNo, 82));
            Evaluate(WennsoftJobSummary_lRec.User_Defined_Integer_4, GetValueatCell(RowNo, 83));
            Evaluate(WennsoftJobSummary_lRec.User_Defined_Dollar_1, GetValueatCell(RowNo, 84));
            Evaluate(WennsoftJobSummary_lRec.User_Defined_Dollar_2, GetValueatCell(RowNo, 85));
            Evaluate(WennsoftJobSummary_lRec.User_Defined_Dollar_3, GetValueatCell(RowNo, 86));
            Evaluate(WennsoftJobSummary_lRec.User_Defined_Dollar_4, GetValueatCell(RowNo, 87));
            Evaluate(WennsoftJobSummary_lRec.USRDAT01, GetValueatCell(RowNo, 88));
            Evaluate(WennsoftJobSummary_lRec.USRDAT02, GetValueatCell(RowNo, 89));
            Evaluate(WennsoftJobSummary_lRec.User_Defined_Date_3, GetValueatCell(RowNo, 90));
            Evaluate(WennsoftJobSummary_lRec.User_Defined_Date_4, GetValueatCell(RowNo, 91));
            Evaluate(WennsoftJobSummary_lRec.User_Defined_CB_1, GetValueatCell(RowNo, 92));
            Evaluate(WennsoftJobSummary_lRec.User_Defined_CB_2, GetValueatCell(RowNo, 93));
            Evaluate(WennsoftJobSummary_lRec.User_Defined_CB_3, GetValueatCell(RowNo, 94));
            Evaluate(WennsoftJobSummary_lRec.User_Defined_CB_4, GetValueatCell(RowNo, 95));
            Evaluate(WennsoftJobSummary_lRec.Wennsoft_Affiliate, GetValueatCell(RowNo, 96));
            Evaluate(WennsoftJobSummary_lRec.Wennsoft_Branch, GetValueatCell(RowNo, 97));
            Evaluate(WennsoftJobSummary_lRec.Wennsoft_Region, GetValueatCell(RowNo, 98));
            Evaluate(WennsoftJobSummary_lRec.MODIFDT, GetValueatCell(RowNo, 99));
            Evaluate(WennsoftJobSummary_lRec.Modified_Time, GetValueatCell(RowNo, 100));
            Evaluate(WennsoftJobSummary_lRec.MDFUSRID, GetValueatCell(RowNo, 101));
            Evaluate(WennsoftJobSummary_lRec.SV_Language_ID, GetValueatCell(RowNo, 102));
            Evaluate(WennsoftJobSummary_lRec.Time_Zone, GetValueatCell(RowNo, 103));
            Evaluate(WennsoftJobSummary_lRec.Technician_ID, GetValueatCell(RowNo, 104));
            Evaluate(WennsoftJobSummary_lRec.Technician_Team, GetValueatCell(RowNo, 105));
            Evaluate(WennsoftJobSummary_lRec.DEX_ROW_ID, GetValueatCell(RowNo, 106));
            WennsoftJobSummary_lRec."File Name" := FileName_gTxt;
            WennsoftJobSummary_lRec."File Imported Date" := CurrentDateTime;
            WennsoftJobSummary_lRec."File Imported By" := UserId;
            WennsoftJobSummary_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    local procedure ImportExcelData_obDeatilsSummary()
    var
        JC_Job_Detail_Summary_lRec: Record JC_Job_Detail_Summary;
        JC_Job_Detail_Summary_lRec1: Record JC_Job_Detail_Summary;
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        JC_Job_Detail_Summary_lRec.Reset();
        if JC_Job_Detail_Summary_lRec.FindLast() then
            EntryNo := JC_Job_Detail_Summary_lRec."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        JC_Job_Detail_Summary_lRec1.SetRange("File Name", FileName_gTxt);
        if JC_Job_Detail_Summary_lRec1.Findset() then
            Error('%1 is already existed', FileName_gTxt);

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            JC_Job_Detail_Summary_lRec.Init();
            JC_Job_Detail_Summary_lRec."Entry No." := EntryNo;
            Evaluate(JC_Job_Detail_Summary_lRec.WS_Job_Number, GetValueatCell(RowNo, 1));
            Evaluate(JC_Job_Detail_Summary_lRec.Project_Number, GetValueatCell(RowNo, 2));
            Evaluate(JC_Job_Detail_Summary_lRec.YEAR1, GetValueatCell(RowNo, 3));
            Evaluate(JC_Job_Detail_Summary_lRec.PERIODID, GetValueatCell(RowNo, 4));
            Evaluate(JC_Job_Detail_Summary_lRec.Cost_Code_Number_1, GetValueatCell(RowNo, 5));
            Evaluate(JC_Job_Detail_Summary_lRec.Cost_Code_Number_2, GetValueatCell(RowNo, 6));
            Evaluate(JC_Job_Detail_Summary_lRec.Cost_Code_Number_3, GetValueatCell(RowNo, 7));
            Evaluate(JC_Job_Detail_Summary_lRec.Cost_Code_Number_4, GetValueatCell(RowNo, 8));
            Evaluate(JC_Job_Detail_Summary_lRec.Cost_Element, GetValueatCell(RowNo, 9));
            Evaluate(JC_Job_Detail_Summary_lRec.Cost_Code_Actual_Cost, GetValueatCell(RowNo, 10));
            Evaluate(JC_Job_Detail_Summary_lRec.Actual_Units_TTD, GetValueatCell(RowNo, 11));
            Evaluate(JC_Job_Detail_Summary_lRec.Cost_Code_Actual_Mkp_Cst, GetValueatCell(RowNo, 12));
            Evaluate(JC_Job_Detail_Summary_lRec.Revsd_Forecast_Cost, GetValueatCell(RowNo, 13));
            Evaluate(JC_Job_Detail_Summary_lRec.Revsd_Forecast_Units, GetValueatCell(RowNo, 14));
            Evaluate(JC_Job_Detail_Summary_lRec.USERID, GetValueatCell(RowNo, 15));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Define_1, GetValueatCell(RowNo, 16));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Define_2, GetValueatCell(RowNo, 17));
            Evaluate(JC_Job_Detail_Summary_lRec.USERDEF1, GetValueatCell(RowNo, 18));
            Evaluate(JC_Job_Detail_Summary_lRec.USERDEF2, GetValueatCell(RowNo, 19));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Def_Integer_1, GetValueatCell(RowNo, 20));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Def_Integer_2, GetValueatCell(RowNo, 21));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Defined_Integer_3, GetValueatCell(RowNo, 22));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Defined_Integer_4, GetValueatCell(RowNo, 23));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Defined_Dollar_1, GetValueatCell(RowNo, 24));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Defined_Dollar_2, GetValueatCell(RowNo, 25));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Defined_Dollar_3, GetValueatCell(RowNo, 26));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Defined_Dollar_4, GetValueatCell(RowNo, 27));
            Evaluate(JC_Job_Detail_Summary_lRec.USRDAT01, Format(GetValueatCell(RowNo, 28), 0, 9));
            Evaluate(JC_Job_Detail_Summary_lRec.USRDAT02, Format(GetValueatCell(RowNo, 29), 0, 9));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Defined_Date_3, GetValueatCell(RowNo, 30));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Defined_Date_4, GetValueatCell(RowNo, 31));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Defined_CB_1, GetValueatCell(RowNo, 32));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Defined_CB_2, GetValueatCell(RowNo, 33));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Defined_CB_3, GetValueatCell(RowNo, 34));
            Evaluate(JC_Job_Detail_Summary_lRec.User_Defined_CB_4, GetValueatCell(RowNo, 35));
            Evaluate(JC_Job_Detail_Summary_lRec.Wennsoft_Affiliate, GetValueatCell(RowNo, 36));
            Evaluate(JC_Job_Detail_Summary_lRec.Wennsoft_Branch, GetValueatCell(RowNo, 37));
            Evaluate(JC_Job_Detail_Summary_lRec.Wennsoft_Region, GetValueatCell(RowNo, 38));
            Evaluate(JC_Job_Detail_Summary_lRec.MODIFDT, Format(GetValueatCell(RowNo, 39), 0, 9));
            Evaluate(JC_Job_Detail_Summary_lRec.Modified_Time, Format(GetValueatCell(RowNo, 40)));
            Evaluate(JC_Job_Detail_Summary_lRec.MDFUSRID, GetValueatCell(RowNo, 41));
            Evaluate(JC_Job_Detail_Summary_lRec.SV_Language_ID, GetValueatCell(RowNo, 42));
            Evaluate(JC_Job_Detail_Summary_lRec.Time_Zone, GetValueatCell(RowNo, 43));
            Evaluate(JC_Job_Detail_Summary_lRec.WSReserved_CB1, GetValueatCell(RowNo, 44));
            Evaluate(JC_Job_Detail_Summary_lRec.WSReserved_CB2, GetValueatCell(RowNo, 45));
            Evaluate(JC_Job_Detail_Summary_lRec.WSReserved_CB3, GetValueatCell(RowNo, 46));
            Evaluate(JC_Job_Detail_Summary_lRec.WSReserved_CB4, GetValueatCell(RowNo, 47));
            Evaluate(JC_Job_Detail_Summary_lRec.WSReserved_CB5, GetValueatCell(RowNo, 48));
            Evaluate(JC_Job_Detail_Summary_lRec.WSReserved_STR1, GetValueatCell(RowNo, 49));
            Evaluate(JC_Job_Detail_Summary_lRec.WSReserved_STR2, GetValueatCell(RowNo, 50));
            Evaluate(JC_Job_Detail_Summary_lRec.DEX_ROW_ID, GetValueatCell(RowNo, 51));
            JC_Job_Detail_Summary_lRec."File Name" := FileName_gTxt;
            JC_Job_Detail_Summary_lRec."File Imported Date" := CurrentDateTime;
            JC_Job_Detail_Summary_lRec."File Imported By" := UserId;
            JC_Job_Detail_Summary_lRec.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    local procedure ImportExcelData_OpenTransactions()
    var
        Wensoft_JC: Record "Wennsoft Open Transacitons";
        Wensoft_JC1: Record "Wennsoft Open Transacitons";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        Wensoft_JC.Reset();
        if Wensoft_JC.FindLast() then
            EntryNo := Wensoft_JC."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        Wensoft_JC1.SetRange("File Name", FileName_gTxt);
        if Wensoft_JC1.Findset() then
            Error('%1 is already existed', FileName_gTxt);

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            Wensoft_JC.Init();
            Wensoft_JC."Entry No." := EntryNo;
            Evaluate(Wensoft_JC.WS_Job_Number, GetValueatCell(RowNo, 1));
            Evaluate(Wensoft_JC.Project_Number, GetValueatCell(RowNo, 2));
            Evaluate(Wensoft_JC.Cost_Code_Number_1, GetValueatCell(RowNo, 3));
            Evaluate(Wensoft_JC.Cost_Code_Number_2, GetValueatCell(RowNo, 4));
            Evaluate(Wensoft_JC.Cost_Code_Number_3, GetValueatCell(RowNo, 5));
            Evaluate(Wensoft_JC.Cost_Code_Number_4, GetValueatCell(RowNo, 6));
            Evaluate(Wensoft_JC.Cost_Code_Description, GetValueatCell(RowNo, 7));
            Evaluate(Wensoft_JC.Cost_Element, GetValueatCell(RowNo, 8));
            Evaluate(Wensoft_JC.Job_TRX_Number, GetValueatCell(RowNo, 9));
            Evaluate(Wensoft_JC.Document_Source, GetValueatCell(RowNo, 10));
            Evaluate(Wensoft_JC.TRXSORCE, GetValueatCell(RowNo, 11));
            Evaluate(Wensoft_JC.JRNENTRY, GetValueatCell(RowNo, 12));
            Evaluate(Wensoft_JC.ACTINDX, GetValueatCell(RowNo, 13));
            Evaluate(Wensoft_JC.DISTTYPE, GetValueatCell(RowNo, 14));
            Evaluate(Wensoft_JC.DOCNUMBR, GetValueatCell(RowNo, 15));
            Evaluate(Wensoft_JC.LNSEQNBR, GetValueatCell(RowNo, 16));
            Evaluate(Wensoft_JC.PYADNMBR, GetValueatCell(RowNo, 17));
            Evaluate(Wensoft_JC.VOIDPYADNMBR, GetValueatCell(RowNo, 18));
            Evaluate(Wensoft_JC.TRXDSCRN, GetValueatCell(RowNo, 19));
            Evaluate(Wensoft_JC.Cost_Code_Act_Cost_TTD, GetValueatCell(RowNo, 20));
            Evaluate(Wensoft_JC.Cost_Code_Actual_Org_Cst, GetValueatCell(RowNo, 21));
            Evaluate(Wensoft_JC.DOCDATE, GetValueatCell(RowNo, 22));
            Evaluate(Wensoft_JC.DOCAMNT, GetValueatCell(RowNo, 23));
            Evaluate(Wensoft_JC.DOCTYPE, GetValueatCell(RowNo, 24));
            Evaluate(Wensoft_JC.GLPOSTDT, GetValueatCell(RowNo, 25));
            Evaluate(Wensoft_JC.Profit_Type_Number, GetValueatCell(RowNo, 26));
            Evaluate(Wensoft_JC.Profit_Amount, GetValueatCell(RowNo, 27));
            Evaluate(Wensoft_JC.Job_Type, GetValueatCell(RowNo, 28));
            Evaluate(Wensoft_JC.IVDOCTYP, GetValueatCell(RowNo, 29));
            Evaluate(Wensoft_JC.VENDORID, GetValueatCell(RowNo, 30));
            Evaluate(Wensoft_JC.ITEMNMBR, GetValueatCell(RowNo, 31));
            Evaluate(Wensoft_JC.UOFM, GetValueatCell(RowNo, 32));
            Evaluate(Wensoft_JC.TRXQTY, GetValueatCell(RowNo, 33));
            Evaluate(Wensoft_JC.TRX_QTY_PR, GetValueatCell(RowNo, 34));
            Evaluate(Wensoft_JC.TRXLOCTN, GetValueatCell(RowNo, 35));
            Evaluate(Wensoft_JC.UNITCOST, GetValueatCell(RowNo, 36));
            Evaluate(Wensoft_JC.BACHNUMB, GetValueatCell(RowNo, 37));
            Evaluate(Wensoft_JC.BCHSOURC, GetValueatCell(RowNo, 38));
            Evaluate(Wensoft_JC.EMPLOYID, GetValueatCell(RowNo, 39));
            Evaluate(Wensoft_JC.Payroll_Pay_Type, GetValueatCell(RowNo, 40));
            Evaluate(Wensoft_JC.COMPTRTP, GetValueatCell(RowNo, 41));
            Evaluate(Wensoft_JC.UPRTRXCD, GetValueatCell(RowNo, 42));
            Evaluate(Wensoft_JC.TRXHRUNT, GetValueatCell(RowNo, 43));
            Evaluate(Wensoft_JC.PAYRTAMT, GetValueatCell(RowNo, 44));
            Evaluate(Wensoft_JC.VARDBAMT, GetValueatCell(RowNo, 45));
            Evaluate(Wensoft_JC.Transaction_Pay_Period, GetValueatCell(RowNo, 46));
            Evaluate(Wensoft_JC.TRXBEGDT, GetValueatCell(RowNo, 47));
            Evaluate(Wensoft_JC.TRXENDDT, GetValueatCell(RowNo, 48));
            Evaluate(Wensoft_JC.WS_Transaction_Date, GetValueatCell(RowNo, 49));
            Evaluate(Wensoft_JC.Unit_Decimal_Places, GetValueatCell(RowNo, 50));
            Evaluate(Wensoft_JC.Cost_Decimal_Places, GetValueatCell(RowNo, 51));
            Evaluate(Wensoft_JC.Ovrhd_1_Unit_Dec_Places, GetValueatCell(RowNo, 52));
            Evaluate(Wensoft_JC.Overhead_1_Cst_Dec_Plcs, GetValueatCell(RowNo, 53));
            Evaluate(Wensoft_JC.Overhead_Units_1, GetValueatCell(RowNo, 54));
            Evaluate(Wensoft_JC.Overhead_1_Cst_Per_Unit, GetValueatCell(RowNo, 55));
            Evaluate(Wensoft_JC.Overhead_1_Pct_Rate, GetValueatCell(RowNo, 56));
            Evaluate(Wensoft_JC.UNIONCD, GetValueatCell(RowNo, 57));
            Evaluate(Wensoft_JC.DAYSWRDK, GetValueatCell(RowNo, 58));
            Evaluate(Wensoft_JC.WKSWRKD, GetValueatCell(RowNo, 59));
            Evaluate(Wensoft_JC.DEPRTMNT, GetValueatCell(RowNo, 60));
            Evaluate(Wensoft_JC.JOBTITLE, GetValueatCell(RowNo, 61));
            Evaluate(Wensoft_JC.STATECD, GetValueatCell(RowNo, 62));
            Evaluate(Wensoft_JC.LOCALTAX, GetValueatCell(RowNo, 63));
            Evaluate(Wensoft_JC.SUTASTAT, GetValueatCell(RowNo, 64));
            Evaluate(Wensoft_JC.WRKRCOMP, GetValueatCell(RowNo, 65));
            Evaluate(Wensoft_JC.FEDCLSSCD, GetValueatCell(RowNo, 66));
            Evaluate(Wensoft_JC.Production_Actual_Qty, GetValueatCell(RowNo, 67));
            Evaluate(Wensoft_JC.Est_Pct_Complete_to_Date, GetValueatCell(RowNo, 68));
            Evaluate(Wensoft_JC.Overhead_Group_Code, GetValueatCell(RowNo, 69));
            Evaluate(Wensoft_JC.Labor_Fixed_OH, GetValueatCell(RowNo, 70));
            Evaluate(Wensoft_JC.Labor_OH_Percentage, GetValueatCell(RowNo, 71));
            Evaluate(Wensoft_JC.Certified_Payroll, GetValueatCell(RowNo, 72));
            Evaluate(Wensoft_JC.Monday, GetValueatCell(RowNo, 73));
            Evaluate(Wensoft_JC.Tuesday, GetValueatCell(RowNo, 74));
            Evaluate(Wensoft_JC.Wednesday, GetValueatCell(RowNo, 75));
            Evaluate(Wensoft_JC.Thursday, GetValueatCell(RowNo, 76));
            Evaluate(Wensoft_JC.Friday, GetValueatCell(RowNo, 77));
            Evaluate(Wensoft_JC.Saturday, GetValueatCell(RowNo, 78));
            Evaluate(Wensoft_JC.Sunday, GetValueatCell(RowNo, 79));
            Evaluate(Wensoft_JC.PSTGSTUS, GetValueatCell(RowNo, 80));
            Evaluate(Wensoft_JC.CURNCYID, GetValueatCell(RowNo, 81));
            Evaluate(Wensoft_JC.CURRNIDX, GetValueatCell(RowNo, 82));
            Evaluate(Wensoft_JC.PORDNMBR, GetValueatCell(RowNo, 83));
            Evaluate(Wensoft_JC.Rate_Per_Unit, GetValueatCell(RowNo, 84));
            Evaluate(Wensoft_JC.Billed_Amount, GetValueatCell(RowNo, 85));
            Evaluate(Wensoft_JC.Billed_Invoice_Number_1, (GetValueatCell(RowNo, 86)));
            Evaluate(Wensoft_JC.Billed_Invoice_Number_2, GetValueatCell(RowNo, 87));
            Evaluate(Wensoft_JC.Billed_Transaction, GetValueatCell(RowNo, 88));
            Evaluate(Wensoft_JC.Credit_Memo_Number, GetValueatCell(RowNo, 89));
            Evaluate(Wensoft_JC.Credit_Transaction, GetValueatCell(RowNo, 90));
            Evaluate(Wensoft_JC.Unbillable_Transaction, GetValueatCell(RowNo, 91));
            Evaluate(Wensoft_JC.RATECLSS, GetValueatCell(RowNo, 92));
            Evaluate(Wensoft_JC.WS_Cost_Type, GetValueatCell(RowNo, 93));
            Evaluate(Wensoft_JC.ICCURRID, GetValueatCell(RowNo, 94));
            Evaluate(Wensoft_JC.ICCURRIX, GetValueatCell(RowNo, 95));
            Evaluate(Wensoft_JC.SHFTCODE, GetValueatCell(RowNo, 96));
            Evaluate(Wensoft_JC.SHFTPREM, GetValueatCell(RowNo, 97));
            Evaluate(Wensoft_JC.Tax_Date, GetValueatCell(RowNo, 98));
            Evaluate(Wensoft_JC.USERID, GetValueatCell(RowNo, 99));
            Evaluate(Wensoft_JC.User_Define_1, GetValueatCell(RowNo, 100));
            Evaluate(Wensoft_JC.User_Define_2, GetValueatCell(RowNo, 101));
            Evaluate(Wensoft_JC.USERDEF1, GetValueatCell(RowNo, 102));
            Evaluate(Wensoft_JC.USERDEF2, GetValueatCell(RowNo, 103));
            Evaluate(Wensoft_JC.User_Def_Integer_1, GetValueatCell(RowNo, 104));
            Evaluate(Wensoft_JC.User_Def_Integer_2, GetValueatCell(RowNo, 105));
            Evaluate(Wensoft_JC.User_Defined_Integer_3, GetValueatCell(RowNo, 106));
            Evaluate(Wensoft_JC.User_Defined_Integer_4, GetValueatCell(RowNo, 107));
            Evaluate(Wensoft_JC.User_Defined_Dollar_1, GetValueatCell(RowNo, 108));
            Evaluate(Wensoft_JC.User_Defined_Dollar_2, GetValueatCell(RowNo, 109));
            Evaluate(Wensoft_JC.User_Defined_Dollar_3, GetValueatCell(RowNo, 110));
            Evaluate(Wensoft_JC.User_Defined_Dollar_4, GetValueatCell(RowNo, 111));
            Evaluate(Wensoft_JC.USRDAT01, (GetValueatCell(RowNo, 112)));
            Evaluate(Wensoft_JC.USRDAT02, (GetValueatCell(RowNo, 113)));
            Evaluate(Wensoft_JC.User_Defined_Date_3, (GetValueatCell(RowNo, 114)));
            Evaluate(Wensoft_JC.User_Defined_Date_4, (GetValueatCell(RowNo, 115)));
            Evaluate(Wensoft_JC.User_Defined_CB_1, GetValueatCell(RowNo, 116));
            Evaluate(Wensoft_JC.User_Defined_CB_2, GetValueatCell(RowNo, 117));
            Evaluate(Wensoft_JC.User_Defined_CB_3, GetValueatCell(RowNo, 118));
            Evaluate(Wensoft_JC.User_Defined_CB_4, GetValueatCell(RowNo, 119));
            Evaluate(Wensoft_JC.Wennsoft_Affiliate, GetValueatCell(RowNo, 120));
            Evaluate(Wensoft_JC.Wennsoft_Branch, GetValueatCell(RowNo, 121));
            Evaluate(Wensoft_JC.Wennsoft_Region, GetValueatCell(RowNo, 122));
            Evaluate(Wensoft_JC.MODIFDT, (GetValueatCell(RowNo, 123)));
            Evaluate(Wensoft_JC.Modified_Time, (GetValueatCell(RowNo, 124)));
            Evaluate(Wensoft_JC.MDFUSRID, GetValueatCell(RowNo, 125));
            Evaluate(Wensoft_JC.SV_Language_ID, GetValueatCell(RowNo, 126));
            Evaluate(Wensoft_JC.Time_Zone, GetValueatCell(RowNo, 127));
            Evaluate(Wensoft_JC.WSReserved_CB1, GetValueatCell(RowNo, 128));
            Evaluate(Wensoft_JC.WSReserved_CB2, GetValueatCell(RowNo, 129));
            Evaluate(Wensoft_JC.WSReserved_CB3, GetValueatCell(RowNo, 130));
            Evaluate(Wensoft_JC.WSReserved_CB4, GetValueatCell(RowNo, 131));
            Evaluate(Wensoft_JC.WSReserved_CB5, GetValueatCell(RowNo, 132));
            Evaluate(Wensoft_JC.WSReserved_STR1, GetValueatCell(RowNo, 133));
            Evaluate(Wensoft_JC.WSReserved_STR2, GetValueatCell(RowNo, 134));
            Evaluate(Wensoft_JC.OPENYEAR, GetValueatCell(RowNo, 135));
            Evaluate(Wensoft_JC.DEX_ROW_ID, GetValueatCell(RowNo, 136));
            Wensoft_JC."File Name" := FileName_gTxt;
            Wensoft_JC."File Imported Date" := CurrentDateTime;
            Wensoft_JC."File Imported By" := UserId;
            Wensoft_JC.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    local procedure ImportExcelData_HistoricTransactions()
    var
        Wensoft_JC: Record "Historical Transactions";
        Wensoft_JC1: Record "Historical Transactions";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
        DateTime1: DateTime;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        Wensoft_JC.Reset();
        if Wensoft_JC.FindLast() then
            EntryNo := Wensoft_JC."Entry No.";
        TempExcelBuffer_gRec.Reset();
        if TempExcelBuffer_gRec.FindLast() then begin
            MaxRowNo := TempExcelBuffer_gRec."Row No.";
        end;
        Wensoft_JC1.SetRange("File Name", FileName_gTxt);
        if Wensoft_JC1.Findset() then
            Error('%1 is already existed', FileName_gTxt);

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            Wensoft_JC.Init();
            Wensoft_JC."Entry No." := EntryNo;
            Evaluate(Wensoft_JC.WS_Job_Number, GetValueatCell(RowNo, 1));
            Evaluate(Wensoft_JC.Project_Number, GetValueatCell(RowNo, 2));
            Evaluate(Wensoft_JC.Cost_Code_Number_1, GetValueatCell(RowNo, 3));
            Evaluate(Wensoft_JC.Cost_Code_Number_2, GetValueatCell(RowNo, 4));
            Evaluate(Wensoft_JC.Cost_Code_Number_3, GetValueatCell(RowNo, 5));
            Evaluate(Wensoft_JC.Cost_Code_Number_4, GetValueatCell(RowNo, 6));
            Evaluate(Wensoft_JC.Cost_Code_Description, GetValueatCell(RowNo, 7));
            Evaluate(Wensoft_JC.Cost_Element, GetValueatCell(RowNo, 8));
            Evaluate(Wensoft_JC.Job_TRX_Number, GetValueatCell(RowNo, 9));
            Evaluate(Wensoft_JC.Document_Source, GetValueatCell(RowNo, 10));
            Evaluate(Wensoft_JC.TRXSORCE, GetValueatCell(RowNo, 11));
            Evaluate(Wensoft_JC.JRNENTRY, GetValueatCell(RowNo, 12));
            Evaluate(Wensoft_JC.ACTINDX, GetValueatCell(RowNo, 13));
            Evaluate(Wensoft_JC.DISTTYPE, GetValueatCell(RowNo, 14));
            Evaluate(Wensoft_JC.DOCNUMBR, GetValueatCell(RowNo, 15));
            Evaluate(Wensoft_JC.LNSEQNBR, GetValueatCell(RowNo, 16));
            Evaluate(Wensoft_JC.PYADNMBR, GetValueatCell(RowNo, 17));
            Evaluate(Wensoft_JC.VOIDPYADNMBR, GetValueatCell(RowNo, 18));
            Evaluate(Wensoft_JC.TRXDSCRN, GetValueatCell(RowNo, 19));
            Evaluate(Wensoft_JC.Cost_Code_Act_Cost_TTD, GetValueatCell(RowNo, 20));
            Evaluate(Wensoft_JC.Cost_Code_Actual_Org_Cst, GetValueatCell(RowNo, 21));
            Evaluate(DateTime1, GetValueatCell(RowNo, 22));
            Evaluate(Wensoft_JC.DOCDATE, Format(DT2Date(DateTime1)));
            Evaluate(Wensoft_JC.DOCAMNT, GetValueatCell(RowNo, 23));
            Evaluate(Wensoft_JC.DOCTYPE, GetValueatCell(RowNo, 24));
            Evaluate(DateTime1, GetValueatCell(RowNo, 25));
            Evaluate(Wensoft_JC.GLPOSTDT, Format(DT2Date(DateTime1)));
            Evaluate(Wensoft_JC.Profit_Type_Number, GetValueatCell(RowNo, 26));
            Evaluate(Wensoft_JC.Profit_Amount, GetValueatCell(RowNo, 27));
            Evaluate(Wensoft_JC.Job_Type, GetValueatCell(RowNo, 28));
            Evaluate(Wensoft_JC.IVDOCTYP, GetValueatCell(RowNo, 29));
            Evaluate(Wensoft_JC.VENDORID, GetValueatCell(RowNo, 30));
            Evaluate(Wensoft_JC.ITEMNMBR, GetValueatCell(RowNo, 31));
            Evaluate(Wensoft_JC.UOFM, GetValueatCell(RowNo, 32));
            Evaluate(Wensoft_JC.TRXQTY, GetValueatCell(RowNo, 33));
            Evaluate(Wensoft_JC.TRX_QTY_PR, GetValueatCell(RowNo, 34));
            Evaluate(Wensoft_JC.TRXLOCTN, GetValueatCell(RowNo, 35));
            Evaluate(Wensoft_JC.UNITCOST, GetValueatCell(RowNo, 36));
            Evaluate(Wensoft_JC.BACHNUMB, GetValueatCell(RowNo, 37));
            Evaluate(Wensoft_JC.BCHSOURC, GetValueatCell(RowNo, 38));
            Evaluate(Wensoft_JC.EMPLOYID, GetValueatCell(RowNo, 39));
            Evaluate(Wensoft_JC.Payroll_Pay_Type, GetValueatCell(RowNo, 40));
            Evaluate(Wensoft_JC.COMPTRTP, GetValueatCell(RowNo, 41));
            Evaluate(Wensoft_JC.UPRTRXCD, GetValueatCell(RowNo, 42));
            Evaluate(Wensoft_JC.TRXHRUNT, GetValueatCell(RowNo, 43));
            Evaluate(Wensoft_JC.PAYRTAMT, GetValueatCell(RowNo, 44));
            Evaluate(Wensoft_JC.VARDBAMT, GetValueatCell(RowNo, 45));
            Evaluate(Wensoft_JC.Transaction_Pay_Period, GetValueatCell(RowNo, 46));
            Evaluate(DateTime1, GetValueatCell(RowNo, 47));
            Evaluate(Wensoft_JC.TRXBEGDT, Format(DT2Date(DateTime1)));
            Evaluate(DateTime1, GetValueatCell(RowNo, 48));
            Evaluate(Wensoft_JC.TRXENDDT, Format(DT2Date(DateTime1)));
            Evaluate(DateTime1, GetValueatCell(RowNo, 49));
            Evaluate(Wensoft_JC.WS_Transaction_Date, Format(DT2Date(DateTime1)));
            Evaluate(Wensoft_JC.Unit_Decimal_Places, GetValueatCell(RowNo, 50));
            Evaluate(Wensoft_JC.Cost_Decimal_Places, GetValueatCell(RowNo, 51));
            Evaluate(Wensoft_JC.Ovrhd_1_Unit_Dec_Places, GetValueatCell(RowNo, 52));
            Evaluate(Wensoft_JC.Overhead_1_Cst_Dec_Plcs, GetValueatCell(RowNo, 53));
            Evaluate(Wensoft_JC.Overhead_Units_1, GetValueatCell(RowNo, 54));
            Evaluate(Wensoft_JC.Overhead_1_Cst_Per_Unit, GetValueatCell(RowNo, 55));
            Evaluate(Wensoft_JC.Overhead_1_Pct_Rate, GetValueatCell(RowNo, 56));
            Evaluate(Wensoft_JC.UNIONCD, GetValueatCell(RowNo, 57));
            Evaluate(Wensoft_JC.DAYSWRDK, GetValueatCell(RowNo, 58));
            Evaluate(Wensoft_JC.WKSWRKD, GetValueatCell(RowNo, 59));
            Evaluate(Wensoft_JC.DEPRTMNT, GetValueatCell(RowNo, 60));
            Evaluate(Wensoft_JC.JOBTITLE, GetValueatCell(RowNo, 61));
            Evaluate(Wensoft_JC.STATECD, GetValueatCell(RowNo, 62));
            Evaluate(Wensoft_JC.LOCALTAX, GetValueatCell(RowNo, 63));
            Evaluate(Wensoft_JC.SUTASTAT, GetValueatCell(RowNo, 64));
            Evaluate(Wensoft_JC.WRKRCOMP, GetValueatCell(RowNo, 65));
            Evaluate(Wensoft_JC.FEDCLSSCD, GetValueatCell(RowNo, 66));
            Evaluate(Wensoft_JC.Production_Actual_Qty, GetValueatCell(RowNo, 67));
            Evaluate(Wensoft_JC.Est_Pct_Complete_to_Date, GetValueatCell(RowNo, 68));
            Evaluate(Wensoft_JC.Overhead_Group_Code, GetValueatCell(RowNo, 69));
            Evaluate(Wensoft_JC.Labor_Fixed_OH, GetValueatCell(RowNo, 70));
            Evaluate(Wensoft_JC.Labor_OH_Percentage, GetValueatCell(RowNo, 71));
            Evaluate(Wensoft_JC.Certified_Payroll, GetValueatCell(RowNo, 72));
            Evaluate(Wensoft_JC.Monday, GetValueatCell(RowNo, 73));
            Evaluate(Wensoft_JC.Tuesday, GetValueatCell(RowNo, 74));
            Evaluate(Wensoft_JC.Wednesday, GetValueatCell(RowNo, 75));
            Evaluate(Wensoft_JC.Thursday, GetValueatCell(RowNo, 76));
            Evaluate(Wensoft_JC.Friday, GetValueatCell(RowNo, 77));
            Evaluate(Wensoft_JC.Saturday, GetValueatCell(RowNo, 78));
            Evaluate(Wensoft_JC.Sunday, GetValueatCell(RowNo, 79));
            Evaluate(Wensoft_JC.PSTGSTUS, GetValueatCell(RowNo, 80));
            Evaluate(Wensoft_JC.CURNCYID, GetValueatCell(RowNo, 81));
            Evaluate(Wensoft_JC.CURRNIDX, GetValueatCell(RowNo, 82));
            Evaluate(Wensoft_JC.PORDNMBR, GetValueatCell(RowNo, 83));
            Evaluate(Wensoft_JC.Rate_Per_Unit, GetValueatCell(RowNo, 84));
            Evaluate(Wensoft_JC.Billed_Amount, GetValueatCell(RowNo, 85));
            Evaluate(Wensoft_JC.Billed_Invoice_Number_1, (GetValueatCell(RowNo, 86)));
            Evaluate(Wensoft_JC.Billed_Invoice_Number_2, GetValueatCell(RowNo, 87));
            Evaluate(Wensoft_JC.Billed_Transaction, GetValueatCell(RowNo, 88));
            Evaluate(Wensoft_JC.Credit_Memo_Number, GetValueatCell(RowNo, 89));
            Evaluate(Wensoft_JC.Credit_Transaction, GetValueatCell(RowNo, 90));
            Evaluate(Wensoft_JC.Unbillable_Transaction, GetValueatCell(RowNo, 91));
            Evaluate(Wensoft_JC.RATECLSS, GetValueatCell(RowNo, 92));
            Evaluate(Wensoft_JC.WS_Cost_Type, GetValueatCell(RowNo, 93));
            Evaluate(Wensoft_JC.ICCURRID, GetValueatCell(RowNo, 94));
            Evaluate(Wensoft_JC.ICCURRIX, GetValueatCell(RowNo, 95));
            Evaluate(Wensoft_JC.SHFTCODE, GetValueatCell(RowNo, 96));
            Evaluate(Wensoft_JC.SHFTPREM, GetValueatCell(RowNo, 97));
            Evaluate(DateTime1, GetValueatCell(RowNo, 98));
            Evaluate(Wensoft_JC.Tax_Date, Format(DT2Date(DateTime1)));
            Evaluate(Wensoft_JC.USERID, GetValueatCell(RowNo, 99));
            Evaluate(Wensoft_JC.User_Define_1, GetValueatCell(RowNo, 100));
            Evaluate(Wensoft_JC.User_Define_2, GetValueatCell(RowNo, 101));
            Evaluate(Wensoft_JC.USERDEF1, GetValueatCell(RowNo, 102));
            Evaluate(Wensoft_JC.USERDEF2, GetValueatCell(RowNo, 103));
            Evaluate(Wensoft_JC.User_Def_Integer_1, GetValueatCell(RowNo, 104));
            Evaluate(Wensoft_JC.User_Def_Integer_2, GetValueatCell(RowNo, 105));
            Evaluate(Wensoft_JC.User_Defined_Integer_3, GetValueatCell(RowNo, 106));
            Evaluate(Wensoft_JC.User_Defined_Integer_4, GetValueatCell(RowNo, 107));
            Evaluate(Wensoft_JC.User_Defined_Dollar_1, GetValueatCell(RowNo, 108));
            Evaluate(Wensoft_JC.User_Defined_Dollar_2, GetValueatCell(RowNo, 109));
            Evaluate(Wensoft_JC.User_Defined_Dollar_3, GetValueatCell(RowNo, 110));
            Evaluate(Wensoft_JC.User_Defined_Dollar_4, GetValueatCell(RowNo, 111));
            Evaluate(DateTime1, GetValueatCell(RowNo, 112));
            Evaluate(Wensoft_JC.USRDAT01, Format(DT2Date(DateTime1)));
            Evaluate(DateTime1, GetValueatCell(RowNo, 113));
            Evaluate(Wensoft_JC.USRDAT02, Format(DT2Date(DateTime1)));
            Evaluate(DateTime1, GetValueatCell(RowNo, 114));
            Evaluate(Wensoft_JC.User_Defined_Date_3, Format(DT2Date(DateTime1)));
            Evaluate(DateTime1, GetValueatCell(RowNo, 115));
            Evaluate(Wensoft_JC.User_Defined_Date_4, Format(DT2Date(DateTime1)));
            Evaluate(Wensoft_JC.User_Defined_CB_1, GetValueatCell(RowNo, 116));
            Evaluate(Wensoft_JC.User_Defined_CB_2, GetValueatCell(RowNo, 117));
            Evaluate(Wensoft_JC.User_Defined_CB_3, GetValueatCell(RowNo, 118));
            Evaluate(Wensoft_JC.User_Defined_CB_4, GetValueatCell(RowNo, 119));
            Evaluate(Wensoft_JC.Wennsoft_Affiliate, GetValueatCell(RowNo, 120));
            Evaluate(Wensoft_JC.Wennsoft_Branch, GetValueatCell(RowNo, 121));
            Evaluate(Wensoft_JC.Wennsoft_Region, GetValueatCell(RowNo, 122));
            Evaluate(DateTime1, GetValueatCell(RowNo, 123));
            Evaluate(Wensoft_JC.MODIFDT, Format(DT2Date(DateTime1)));
            Evaluate(DateTime1, GetValueatCell(RowNo, 124));
            Evaluate(Wensoft_JC.Modified_Time, Format(DT2Time(DateTime1)));
            //Evaluate(Wensoft_JC.Modified_Time, GetValueatCell(RowNo, 124));
            Evaluate(Wensoft_JC.MDFUSRID, GetValueatCell(RowNo, 125));
            Evaluate(Wensoft_JC.SV_Language_ID, GetValueatCell(RowNo, 126));
            Evaluate(Wensoft_JC.Time_Zone, GetValueatCell(RowNo, 127));
            Evaluate(Wensoft_JC.WSReserved_CB1, GetValueatCell(RowNo, 128));
            Evaluate(Wensoft_JC.WSReserved_CB2, GetValueatCell(RowNo, 129));
            Evaluate(Wensoft_JC.WSReserved_CB3, GetValueatCell(RowNo, 130));
            Evaluate(Wensoft_JC.WSReserved_CB4, GetValueatCell(RowNo, 131));
            Evaluate(Wensoft_JC.WSReserved_CB5, GetValueatCell(RowNo, 132));
            Evaluate(Wensoft_JC.WSReserved_STR1, GetValueatCell(RowNo, 133));
            Evaluate(Wensoft_JC.WSReserved_STR2, GetValueatCell(RowNo, 134));
            Evaluate(Wensoft_JC.OPENYEAR, GetValueatCell(RowNo, 135));
            Evaluate(Wensoft_JC.DEX_ROW_ID, GetValueatCell(RowNo, 136));
            Wensoft_JC."File Name" := FileName_gTxt;
            Wensoft_JC."File Imported Date" := CurrentDateTime;
            Wensoft_JC."File Imported By" := UserId;
            Wensoft_JC.Insert();
        end;
        Message(ExcelImportSucess_lbl);
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin
        TempExcelBuffer_gRec.Reset();
        If TempExcelBuffer_gRec.Get(RowNo, ColNo) then
            exit(TempExcelBuffer_gRec."Cell Value as Text")
        else
            exit('');
    end;
}