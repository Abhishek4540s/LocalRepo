codeunit 50916 ImportSSTFilesCSV
{
    var
        TransName: Code[20];
        FileName: Text[100];
        Entry_No_gInt: Integer;
        TempCsvBuffer: Record "CSV Buffer" temporary;
        UploadMsg: Label 'Please choose the csv File';
        NoFileMsg: Label 'No CSV file found';
        BatchIsBlankmsg: Label 'Transaction Name is blank';
        CSVImportSuccess: Label 'CSV imported successfully';

    procedure ReadCSVData()
    var
        FileManagement_cdu: Codeunit "File Management";
        Istream: InStream;
        FromFile: Text[100];
    begin
        UploadIntoStream(UploadMsg, '', '', FromFile, Istream);
        if FromFile <> '' then begin
            FileName := FileManagement_cdu.GetFileName(FromFile);
        end else
            Error(NoFileMsg);

        TempCsvBuffer.Reset();
        TempCsvBuffer.DeleteAll();
        TempCsvBuffer.LoadDataFromStream(Istream, ',');
        TempCsvBuffer.GetNumberOfLines();
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin
        TempCsvBuffer.Reset();
        if TempCsvBuffer.Get(RowNo, ColNo) then
            exit(TempCsvBuffer.Value)
        else
            exit('');
    end;

    procedure ImportContractRevenueHIST()
    var
        ContractRevenueMethodHist_lRec: Record "Contract Revenue Method Hist";
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
        ContractRevenueMethodHist_lRec.Reset();

        if TempCsvBuffer.FindLast() then begin
            MaxRowNo := TempCsvBuffer."Line No.";
        end;

        ProgressWindow.Open(Text_gText);
        ProgressWindow.Update(1, MaxRowNo);


        for RowNo := 2 to MaxRowNo do begin
            ContractRevenueMethodHist_lRec.Reset();
            if ContractRevenueMethodHist_lRec.FindLast() then
                Entry_No_gInt := (ContractRevenueMethodHist_lRec.EntryNo) + 1
            else
                Entry_No_gInt := 1;

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
            Evaluate(ContractRevenueMethodHist_lRec.DATE1, Format(GetValueatCell(RowNo, 15), 0, 9));
            Evaluate(ContractRevenueMethodHist_lRec.Wennsoft_Close_Date, Format(GetValueatCell(RowNo, 16), 0, 9));
            Evaluate(ContractRevenueMethodHist_lRec.POSTDATE, format(GetValueatCell(RowNo, 17), 0, 9));
            Evaluate(ContractRevenueMethodHist_lRec.WS_Closed, Format(GetValueatCell(RowNo, 18), 0, 9));
            Evaluate(ContractRevenueMethodHist_lRec.MODIFDT, Format(GetValueatCell(RowNo, 19), 0, 9));
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

            ProcessedCount := ProcessedCount + 1;
            ProgressWindow.Update(2, ProcessedCount);

        end;
        Message(CSVImportSuccess);
        Message('Total Records Count : %1', ContractRevenueMethodHist_lRec.Count);
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

        if TempCsvBuffer.FindLast() then begin
            MaxRowNo := TempCsvBuffer."Line No.";
        end;

        ProgressWindow.Open(Text_gText);
        ProgressWindow.Update(1, MaxRowNo);

        for RowNo := 2 to MaxRowNo do begin

            ContractRevenueMethodMSTR_lRec.Reset();
            if ContractRevenueMethodMSTR_lRec.FindLast() then
                Entry_No_gInt := (ContractRevenueMethodMSTR_lRec.EntryNo) + 1
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
        Message(CSVImportSuccess);
        Message('Total Records Count : %1', ContractRevenueMethodMSTR_lRec.Count);
    end;

    procedure ImportSV_MAint_Invoice_MSTR()
    var
        RowNo: Integer;
        colNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
        SV_Maint_Invoice_MSTR_lRec: Record SSTAZ_SV_Maint_Invoice_MSTR;
        ProgressWindow: Dialog;
        ProcessedCount: Integer;
        Text_gText: Label 'Processing...\Total: #1####################\Current: #2####################';
    begin
        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        LineNo := 0;
        EntryNo := 0;

        if TempCsvBuffer.FindLast() then begin
            MaxRowNo := TempCsvBuffer."Line No.";
        end;

        ProgressWindow.Open(Text_gText);
        ProgressWindow.Update(1, MaxRowNo);

        for RowNo := 2 to MaxRowNo do begin
            SV_Maint_Invoice_MSTR_lRec.Reset();
            if SV_Maint_Invoice_MSTR_lRec.FindLast() then
                EntryNo := (SV_Maint_Invoice_MSTR_lRec."Entry No.") + 1
            else
                EntryNo := 1;
            SV_Maint_Invoice_MSTR_lRec.Init();
            SV_Maint_Invoice_MSTR_lRec."Entry No." := EntryNo;
            Evaluate(SV_Maint_Invoice_MSTR_lRec.CUSTNMBR, GetValueatCell(RowNo, 1));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.ADRSCODE, GetValueatCell(RowNo, 2));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Contract_Number, GetValueatCell(RowNo, 3));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WSCONTSQ, GetValueatCell(RowNo, 4));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.DATE1, GetValueatCell(RowNo, 5));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Wennsoft_Affiliate, GetValueatCell(RowNo, 6));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Wennsoft_Region, GetValueatCell(RowNo, 7));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Wennsoft_Branch, GetValueatCell(RowNo, 8));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.USERID, GetValueatCell(RowNo, 9));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Technician_ID, GetValueatCell(RowNo, 10));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Technician_Team, GetValueatCell(RowNo, 11));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Corporate_Invoice_Number, GetValueatCell(RowNo, 12));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Corporate_Contract_Nbr, GetValueatCell(RowNo, 13));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WSMSTRCONTSQ, GetValueatCell(RowNo, 14));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Position_on_Invoice, GetValueatCell(RowNo, 15));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Wennsoft_Billing_Date, GetValueatCell(RowNo, 16));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Wennsoft_Period_ID, GetValueatCell(RowNo, 17));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Billable_Tax, GetValueatCell(RowNo, 18));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Billable_Subtotal, GetValueatCell(RowNo, 19));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Tax_Detail_ID_1, GetValueatCell(RowNo, 20));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Tax_Amount1, GetValueatCell(RowNo, 21));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Tax_Detail_ID_2, GetValueatCell(RowNo, 22));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Tax_Amount2, GetValueatCell(RowNo, 23));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Tax_Detail_ID_3, GetValueatCell(RowNo, 24));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Tax_Amount3, GetValueatCell(RowNo, 25));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Tax_Detail_ID_4, GetValueatCell(RowNo, 26));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Tax_Amount_4, GetValueatCell(RowNo, 27));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Billable_All, GetValueatCell(RowNo, 28));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.PORDNMBR, GetValueatCell(RowNo, 29));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Invoice_Comment_ID_1, GetValueatCell(RowNo, 30));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Invoice_Comment_ID_2, GetValueatCell(RowNo, 31));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Contract_Billing_Desc, GetValueatCell(RowNo, 32));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Billing_Date, GetValueatCell(RowNo, 33));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.RMDNUMWK, GetValueatCell(RowNo, 34));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.RMDTYPAL, GetValueatCell(RowNo, 35));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.PB_ACTINDX, GetValueatCell(RowNo, 36));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.SLPRSNID, GetValueatCell(RowNo, 37));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.COMPRCNT, GetValueatCell(RowNo, 38));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Commission_Pct_of_Sale, GetValueatCell(RowNo, 39));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.COMMERNG, GetValueatCell(RowNo, 40));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.SALSTERR, GetValueatCell(RowNo, 41));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Salesperson_ID_2, GetValueatCell(RowNo, 42));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Commission_Percent_2, GetValueatCell(RowNo, 43));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Commission_Pct_of_Sale_2, GetValueatCell(RowNo, 44));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Commission_Earnings_2, GetValueatCell(RowNo, 45));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Sales_Territory_2, GetValueatCell(RowNo, 46));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Invoice_Style, GetValueatCell(RowNo, 47));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.No_Times_Printed, GetValueatCell(RowNo, 48));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Printed_Date, GetValueatCell(RowNo, 49));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Wennsoft_Posting_Status, GetValueatCell(RowNo, 50));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.MODIFDT, GetValueatCell(RowNo, 51));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Modified_Time, GetValueatCell(RowNo, 52));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.MDFUSRID, GetValueatCell(RowNo, 53));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Time_Zone, GetValueatCell(RowNo, 54));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.SV_Language_ID, GetValueatCell(RowNo, 55));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Base_Currency_ID, GetValueatCell(RowNo, 56));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Base_Curr_Conv_Factor, GetValueatCell(RowNo, 57));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Billing_Currency_ID, GetValueatCell(RowNo, 58));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Billing_Curr_Conv_Factor, GetValueatCell(RowNo, 59));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Local_Currency_ID, GetValueatCell(RowNo, 60));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Billable_Escalation, GetValueatCell(RowNo, 61));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Billing_Currency_Amount, GetValueatCell(RowNo, 62));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Billable_Escalation, GetValueatCell(RowNo, 63));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Billable_Total, GetValueatCell(RowNo, 64));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escalation_Idx_ID_Equip, GetValueatCell(RowNo, 65));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escal_Idx_ID_Material, GetValueatCell(RowNo, 66));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escalation_Idx_ID_Labor, GetValueatCell(RowNo, 67));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escalation_Index_ID_Subs, GetValueatCell(RowNo, 68));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escalation_Idx_ID_Other, GetValueatCell(RowNo, 69));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escalation_Pct_Equip, GetValueatCell(RowNo, 70));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escalation_Pct_Material, GetValueatCell(RowNo, 71));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escalation_Pct_Labor, GetValueatCell(RowNo, 72));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escalation_Pct_Subs, GetValueatCell(RowNo, 73));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escalation_Pct_Other, GetValueatCell(RowNo, 74));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escal_Fixed_Amt_Equip, GetValueatCell(RowNo, 75));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escalation_Fixed_Amt_Mat, GetValueatCell(RowNo, 76));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escal_Fixed_Amt_Labor, GetValueatCell(RowNo, 77));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escal_Fixed_Amt_Subs, GetValueatCell(RowNo, 78));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Escal_Fixed_Amt_Other, GetValueatCell(RowNo, 79));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Contract_Escalation_Desc, GetValueatCell(RowNo, 80));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Bill_Customer_Number, GetValueatCell(RowNo, 81));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.Bill_Address_Code, GetValueatCell(RowNo, 82));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WSReserved_CB1, GetValueatCell(RowNo, 83));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WSReserved_CB2, GetValueatCell(RowNo, 84));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WSReserved_CB3, GetValueatCell(RowNo, 85));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WSReserved_CB4, GetValueatCell(RowNo, 86));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WSReserved_CB5, GetValueatCell(RowNo, 87));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WSReserved_CB6, GetValueatCell(RowNo, 88));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WSReserved_CB7, GetValueatCell(RowNo, 89));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WSReserved_CB8, GetValueatCell(RowNo, 90));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WSReserved_CB9, GetValueatCell(RowNo, 91));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WSReserved_CB10, GetValueatCell(RowNo, 92));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WSReserved_STR1, GetValueatCell(RowNo, 93));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WSReserved_STR2, GetValueatCell(RowNo, 94));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.WS_GL_Posting_Date, GetValueatCell(RowNo, 95));
            Evaluate(SV_Maint_Invoice_MSTR_lRec.DEX_ROW_ID, GetValueatCell(RowNo, 96));
            SV_Maint_Invoice_MSTR_lRec.Insert();
            ProcessedCount := ProcessedCount + 1;
            ProgressWindow.Update(2, ProcessedCount);
        end;
        Message('Total Records Count : %1', SV_Maint_Invoice_MSTR_lRec.Count);
    end;

    procedure ImportSSTAZ_Contract_Billing()
    var
        RowNo: Integer;
        colNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        EntryNo: Integer;
        SSTAZ_Contract_Billing_lRec: Record SSTAZ_Contract_Billing;
        ProgressWindow: Dialog;
        ProcessedCount: Integer;
        Text_gText: Label 'Processing...\Total: #1####################\Current: #2####################';
    begin
        RowNo := 0;
        colNo := 0;
        MaxRowNo := 0;
        LineNo := 0;


        if TempCsvBuffer.FindLast() then begin
            MaxRowNo := TempCsvBuffer."Line No.";
        end;

        ProgressWindow.Open(Text_gText);
        ProgressWindow.Update(1, MaxRowNo);


        for RowNo := 2 to MaxRowNo do begin

            SSTAZ_Contract_Billing_lRec.Reset();
            if SSTAZ_Contract_Billing_lRec.FindLast() then
                EntryNo := (SSTAZ_Contract_Billing_lRec."Entry No.") + 1
            else
                EntryNo := 1;

            SSTAZ_Contract_Billing_lRec.Init();
            SSTAZ_Contract_Billing_lRec."Entry No." := EntryNo;
            Evaluate(SSTAZ_Contract_Billing_lRec.CUSTNMBR, GetValueatCell(RowNo, 1));
            Evaluate(SSTAZ_Contract_Billing_lRec.ADRSCODE, GetValueatCell(RowNo, 2));
            Evaluate(SSTAZ_Contract_Billing_lRec.Contract_Number, GetValueatCell(RowNo, 3));
            Evaluate(SSTAZ_Contract_Billing_lRec.WSCONTSQ, GetValueatCell(RowNo, 4));
            Evaluate(SSTAZ_Contract_Billing_lRec.SEQNUMBR, GetValueatCell(RowNo, 5));
            Evaluate(SSTAZ_Contract_Billing_lRec.Wennsoft_Affiliate, GetValueatCell(RowNo, 6));
            Evaluate(SSTAZ_Contract_Billing_lRec.Wennsoft_Region, GetValueatCell(RowNo, 7));
            Evaluate(SSTAZ_Contract_Billing_lRec.Wennsoft_Branch, GetValueatCell(RowNo, 8));
            Evaluate(SSTAZ_Contract_Billing_lRec.USERID, GetValueatCell(RowNo, 9));
            Evaluate(SSTAZ_Contract_Billing_lRec.Technician_ID, GetValueatCell(RowNo, 10));
            Evaluate(SSTAZ_Contract_Billing_lRec.Technician_Team, GetValueatCell(RowNo, 11));
            Evaluate(SSTAZ_Contract_Billing_lRec.Wennsoft_Close_Date, Format(GetValueatCell(RowNo, 12), 0, 9));
            Evaluate(SSTAZ_Contract_Billing_lRec.YEAR1, GetValueatCell(RowNo, 13));
            Evaluate(SSTAZ_Contract_Billing_lRec.PERIODID, GetValueatCell(RowNo, 14));
            Evaluate(SSTAZ_Contract_Billing_lRec.Contract_Billing_Desc, GetValueatCell(RowNo, 15));
            Evaluate(SSTAZ_Contract_Billing_lRec.Billing_Date, Format(GetValueatCell(RowNo, 16), 0, 9));
            Evaluate(SSTAZ_Contract_Billing_lRec.Corporate_Invoice_Number, GetValueatCell(RowNo, 17));
            Evaluate(SSTAZ_Contract_Billing_lRec.Corporate_Contract_Nbr, GetValueatCell(RowNo, 18));
            Evaluate(SSTAZ_Contract_Billing_lRec.WSMSTRCONTSQ, GetValueatCell(RowNo, 19));
            Evaluate(SSTAZ_Contract_Billing_lRec.RMDTYPAL, GetValueatCell(RowNo, 20));
            Evaluate(SSTAZ_Contract_Billing_lRec.Tax_Detail_ID_1, GetValueatCell(RowNo, 21));
            Evaluate(SSTAZ_Contract_Billing_lRec.Tax_Amount1, GetValueatCell(RowNo, 22));
            Evaluate(SSTAZ_Contract_Billing_lRec.Tax_Detail_ID_2, GetValueatCell(RowNo, 23));
            Evaluate(SSTAZ_Contract_Billing_lRec.Tax_Amount2, GetValueatCell(RowNo, 24));
            Evaluate(SSTAZ_Contract_Billing_lRec.Tax_Detail_ID_3, GetValueatCell(RowNo, 25));
            Evaluate(SSTAZ_Contract_Billing_lRec.Tax_Amount3, GetValueatCell(RowNo, 26));
            Evaluate(SSTAZ_Contract_Billing_lRec.Tax_Detail_ID_4, GetValueatCell(RowNo, 27));
            Evaluate(SSTAZ_Contract_Billing_lRec.Tax_Amount_4, GetValueatCell(RowNo, 28));
            Evaluate(SSTAZ_Contract_Billing_lRec.DOCAMNT, GetValueatCell(RowNo, 29));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escalation_Idx_ID_Equip, GetValueatCell(RowNo, 30));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escal_Idx_ID_Material, GetValueatCell(RowNo, 31));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escalation_Idx_ID_Labor, GetValueatCell(RowNo, 32));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escalation_Index_ID_Subs, GetValueatCell(RowNo, 33));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escalation_Idx_ID_Other, GetValueatCell(RowNo, 34));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escalation_Pct_Equip, GetValueatCell(RowNo, 35));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escalation_Pct_Material, GetValueatCell(RowNo, 36));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escalation_Pct_Labor, GetValueatCell(RowNo, 37));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escalation_Pct_Subs, GetValueatCell(RowNo, 38));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escalation_Pct_Other, GetValueatCell(RowNo, 39));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escal_Fixed_Amt_Equip, GetValueatCell(RowNo, 40));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escalation_Fixed_Amt_Mat, GetValueatCell(RowNo, 41));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escal_Fixed_Amt_Labor, GetValueatCell(RowNo, 42));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escal_Fixed_Amt_Subs, GetValueatCell(RowNo, 43));
            Evaluate(SSTAZ_Contract_Billing_lRec.Escal_Fixed_Amt_Other, GetValueatCell(RowNo, 44));
            Evaluate(SSTAZ_Contract_Billing_lRec.Billable_Escalation, GetValueatCell(RowNo, 45));
            Evaluate(SSTAZ_Contract_Billing_lRec.Billable_Total, GetValueatCell(RowNo, 46));
            Evaluate(SSTAZ_Contract_Billing_lRec.Contract_Escalation_Desc, GetValueatCell(RowNo, 47));
            Evaluate(SSTAZ_Contract_Billing_lRec.DATE1, Format(GetValueatCell(RowNo, 48), 0, 9));
            Evaluate(SSTAZ_Contract_Billing_lRec.POSTDATE, Format(GetValueatCell(RowNo, 49), 0, 9));
            Evaluate(SSTAZ_Contract_Billing_lRec.Period2, Format(GetValueatCell(RowNo, 50), 0, 9));
            Evaluate(SSTAZ_Contract_Billing_lRec.WS_Closed, GetValueatCell(RowNo, 51));
            Evaluate(SSTAZ_Contract_Billing_lRec.Invoice_Comment_ID_1, GetValueatCell(RowNo, 52));
            Evaluate(SSTAZ_Contract_Billing_lRec.Invoice_Comment_ID_2, GetValueatCell(RowNo, 53));
            Evaluate(SSTAZ_Contract_Billing_lRec.SLPRSNID, GetValueatCell(RowNo, 54));
            Evaluate(SSTAZ_Contract_Billing_lRec.COMPRCNT, GetValueatCell(RowNo, 55));
            Evaluate(SSTAZ_Contract_Billing_lRec.Commission_Pct_of_Sale, GetValueatCell(RowNo, 56));
            Evaluate(SSTAZ_Contract_Billing_lRec.COMMERNG, GetValueatCell(RowNo, 57));
            Evaluate(SSTAZ_Contract_Billing_lRec.SALSTERR, GetValueatCell(RowNo, 58));
            Evaluate(SSTAZ_Contract_Billing_lRec.Salesperson_ID_2, GetValueatCell(RowNo, 59));
            Evaluate(SSTAZ_Contract_Billing_lRec.Commission_Percent_2, GetValueatCell(RowNo, 60));
            Evaluate(SSTAZ_Contract_Billing_lRec.Commission_Pct_of_Sale_2, GetValueatCell(RowNo, 61));
            Evaluate(SSTAZ_Contract_Billing_lRec.Commission_Earnings_2, GetValueatCell(RowNo, 62));
            Evaluate(SSTAZ_Contract_Billing_lRec.Sales_Territory_2, GetValueatCell(RowNo, 63));
            Evaluate(SSTAZ_Contract_Billing_lRec.Invoice_Style, GetValueatCell(RowNo, 64));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_1, GetValueatCell(RowNo, 65));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_2, GetValueatCell(RowNo, 66));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_3, GetValueatCell(RowNo, 67));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_4, GetValueatCell(RowNo, 68));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_5, GetValueatCell(RowNo, 69));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_6, GetValueatCell(RowNo, 70));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_7, GetValueatCell(RowNo, 71));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_8, GetValueatCell(RowNo, 72));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_9, GetValueatCell(RowNo, 73));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_10, GetValueatCell(RowNo, 74));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_11, GetValueatCell(RowNo, 75));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_12, GetValueatCell(RowNo, 76));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_18, GetValueatCell(RowNo, 77));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_19, GetValueatCell(RowNo, 78));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_20, GetValueatCell(RowNo, 79));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_21, GetValueatCell(RowNo, 80));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_22, GetValueatCell(RowNo, 81));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_23, GetValueatCell(RowNo, 82));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_24, GetValueatCell(RowNo, 83));
            Evaluate(SSTAZ_Contract_Billing_lRec.Service_User_Define_25, GetValueatCell(RowNo, 84));
            Evaluate(SSTAZ_Contract_Billing_lRec.MODIFDT, Format(GetValueatCell(RowNo, 85), 0, 9));
            Evaluate(SSTAZ_Contract_Billing_lRec.Modified_Time, GetValueatCell(RowNo, 86));
            Evaluate(SSTAZ_Contract_Billing_lRec.MDFUSRID, GetValueatCell(RowNo, 87));
            Evaluate(SSTAZ_Contract_Billing_lRec.Time_Zone, GetValueatCell(RowNo, 88));
            Evaluate(SSTAZ_Contract_Billing_lRec.Base_Currency_ID, GetValueatCell(RowNo, 89));
            Evaluate(SSTAZ_Contract_Billing_lRec.Base_Curr_Conv_Factor, GetValueatCell(RowNo, 90));
            Evaluate(SSTAZ_Contract_Billing_lRec.Billing_Currency_ID, GetValueatCell(RowNo, 91));
            Evaluate(SSTAZ_Contract_Billing_lRec.Billing_Curr_Conv_Factor, GetValueatCell(RowNo, 92));
            Evaluate(SSTAZ_Contract_Billing_lRec.Local_Currency_ID, GetValueatCell(RowNo, 93));
            Evaluate(SSTAZ_Contract_Billing_lRec.Bill_Customer_Number, GetValueatCell(RowNo, 94));
            Evaluate(SSTAZ_Contract_Billing_lRec.Bill_Address_Code, GetValueatCell(RowNo, 95));
            Evaluate(SSTAZ_Contract_Billing_lRec.RMDNUMWK, GetValueatCell(RowNo, 96));
            Evaluate(SSTAZ_Contract_Billing_lRec.ACTINDX_CR, GetValueatCell(RowNo, 97));
            Evaluate(SSTAZ_Contract_Billing_lRec.ACTINDX_DR, GetValueatCell(RowNo, 98));
            Evaluate(SSTAZ_Contract_Billing_lRec.GLPOSTDT, Format(GetValueatCell(RowNo, 99), 0, 9));
            Evaluate(SSTAZ_Contract_Billing_lRec.JRNENTRY, GetValueatCell(RowNo, 100));
            Evaluate(SSTAZ_Contract_Billing_lRec.WSReserved_CB1, GetValueatCell(RowNo, 101));
            Evaluate(SSTAZ_Contract_Billing_lRec.WSReserved_CB2, GetValueatCell(RowNo, 102));
            Evaluate(SSTAZ_Contract_Billing_lRec.WSReserved_CB3, GetValueatCell(RowNo, 103));
            Evaluate(SSTAZ_Contract_Billing_lRec.WSReserved_CB4, GetValueatCell(RowNo, 104));
            Evaluate(SSTAZ_Contract_Billing_lRec.WSReserved_CB5, GetValueatCell(RowNo, 105));
            Evaluate(SSTAZ_Contract_Billing_lRec.WSReserved_STR1, GetValueatCell(RowNo, 106));
            Evaluate(SSTAZ_Contract_Billing_lRec.WSReserved_STR2, GetValueatCell(RowNo, 107));
            Evaluate(SSTAZ_Contract_Billing_lRec.DEX_ROW_ID, GetValueatCell(RowNo, 108));
            SSTAZ_Contract_Billing_lRec.Insert();
            ProcessedCount := ProcessedCount + 1;
            ProgressWindow.Update(2, ProcessedCount);
        end;
        Message('Total Records Count : %1', SSTAZ_Contract_Billing_lRec.Count);
    end;


}
