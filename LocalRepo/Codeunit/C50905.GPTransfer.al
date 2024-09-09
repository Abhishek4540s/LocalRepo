codeunit 50905 GPTransferData
{


    procedure AllGenJnlLine()
    var
        GPIntermediate_lRec: Record GPIntermediary;
        GenJnlLine_lRec: Record "Gen. Journal Line";
        SucessCounter_lInt: Integer;
        GPIntermediate_lRec1: Record GPIntermediary;
        TempBool: Boolean;
    begin
        GPSetup_gRec.Get();
        Counter := 0;
        ProgressWindow.Open(Txt001_cTxt);
        ProgressWindow.Update(1, GPIntermediate_lRec.Count);
        GPIntermediate_lRec.SetRange("Journal Line Created", false);
        GPIntermediate_lRec.SetRange("General Ledger Entry No", 0);
        TempBool := false;
        If GPIntermediate_lRec.FindSet() then begin
            repeat
                Counter += 1;
                ProgressWindow.Update(2, Counter);
                TransferData(GPIntermediate_lRec, TempBool);
                if GPIntermediate_lRec1."Journal Line Created" = true then
                    SucessCounter_lInt += 1;
            until GPIntermediate_lRec.Next() = 0;
            ProgressWindow.Close();
            Message('%1 Gen Journal Lines are created out of %2', SucessCounter_lInt, GPIntermediate_lRec.Count);
        end;
    end;

    procedure SingleGenJnlLine(var GPIntermediate_lRec: Record GPIntermediary)
    var
        TempBool: Boolean;
    begin
        TempBool := true;
        GPSetup_gRec.Get();
        If GPIntermediate_lRec."Journal Line Created" = true then
            Message('Gen Journal Line is already created');
        if GPIntermediate_lRec."General Ledger Entry No" <> 0 then
            Message('GL Entry is already created');
        if (GPIntermediate_lRec."Journal Line Created" = false) and (GPIntermediate_lRec."General Ledger Entry No" = 0) then
            TransferData(GPIntermediate_lRec, TempBool);
    end;

    [TryFunction]
    local procedure Errorlog_lFun(var GPIntermediate_lRec: Record GPIntermediary)
    var
        GLAccount_lRec: Record "G/L Account";
    begin
        if not (GLAccount_lRec.Get(GPIntermediate_lRec."BC GL No")) then
            Error('The %1 number is not present in GL Account', GPIntermediate_lRec."BC GL No")
        else begin
            GLAccount_lRec.Get(GPIntermediate_lRec."BC GL No");
            if GLAccount_lRec."Account Type" <> GLAccount_lRec."Account Type"::Posting then
                Error('The %1 No in GLaccount does not contaion Account type as posting', GPIntermediate_lRec."BC GL No");
            if GLAccount_lRec.Blocked = false then
                Error('The %1 No in GLaccount is blocked', GPIntermediate_lRec."BC GL No");
        end;

        if (GPSetup_gRec."Gen. Jnl. Template Name" = '') then
            Error('Define the Default Journal name in GP Setup');

        if (GPSetup_gRec."Gen. Jnl. batch Name" = '') then
            Error('Define the Default Journal Batch in GP Setup');

        if GPSetup_gRec."Global Dimension 1 Code" = '' then
            Error('Define the Dimensions in Job Setup');

    end;

    procedure TransferData(Rec: Record GPIntermediary; TempBool: Boolean)
    var
        GenJournal_lRec: Record "Gen. Journal Line";
        GenJournal_lRec1: Record "Gen. Journal Line";
        LineNo_lInt: Integer;

    begin
        if not Errorlog_lFun(Rec) then begin
            Rec."Error Log" := GetLastErrorText();
            Rec.Modify(true);
            Message('Please Check the Error log for more details');
        end
        else begin
            GPSetup_gRec.Get();
            GenJournal_lRec1.Reset();
            LineNo_lInt := 0;
            GenJournal_lRec1.SetRange("Journal Template Name", GPSetup_gRec."Gen. Jnl. Template Name");
            GenJournal_lRec1.SetRange("Journal Batch Name", GPSetup_gRec."Gen. Jnl. Batch Name");
            If GenJournal_lRec1.FindLast() then
                LineNo_lInt := GenJournal_lRec1."Line No." + 10000
            else
                LineNo_lInt := 10000;
            if not GenJournal_lRec.Get(GPSetup_gRec."Gen. Jnl. Template Name", GPSetup_gRec."Gen. Jnl. Batch Name", LineNo_lInt) then begin
                GenJournal_lRec.Init();
                GenJournal_lRec.Validate("Journal Template Name", GPSetup_gRec."Gen. Jnl. Template Name");
                GenJournal_lRec.Validate("Journal Batch Name", GPSetup_gRec."Gen. Jnl. Batch Name");
                GenJournal_lRec.Validate("Line No.", LineNo_lInt);
                GenJournal_lRec.Insert(true);
                GenJournal_lRec.Validate("Entry No", Rec.EntryNo);
                GenJournal_lRec.Validate(JRNENTRY, Rec.ORDOCNUM);
                GenJournal_lRec.Validate("Document No.", Format(Rec.JRNENTRY));
                GenJournal_lRec.Validate("Document Type", GenJournal_lRec."Document Type"::" ");
                GenJournal_lRec.Validate("Account Type", GenJournal_lRec."Account Type"::"G/L Account");
                GenJournal_lRec.Validate("Account No.", Rec."BC GL No");
                GenJournal_lRec.Validate("Fiscal Year", Rec.OPENYEAR);
                GenJournal_lRec.Validate(Period, Rec.PERIODID);
                GenJournal_lRec.Validate(Actnumst, Rec.ACTNUMST);
                GenJournal_lRec.Validate("Posting Date", Rec.TRXDATE);
                GenJournal_lRec.Validate(ORMSTRID, Rec.ORMSTRID);
                GenJournal_lRec.Validate("Debit Amount", Rec.DEBITAMT);
                GenJournal_lRec.Validate("Credit Amount", Rec.CRDTAMNT);
                GenJournal_lRec.Validate(Amount, Rec.Net_DrCr);
                GenJournal_lRec.Validate(SOURCDOC, Rec.SOURCDOC);
                GenJournal_lRec.Validate(ORMSTRNM, Rec.ORMSTRNM);
                GenJournal_lRec.Validate(Description, Rec.DSCRIPTN);
                GenJournal_lRec.Validate("Shortcut Dimension 1 Code", Rec.BCdimension1);
                GenJournal_lRec.Validate(BCdscriptnDim1, Rec.BCdscriptnDim1);
                GenJournal_lRec.Validate("BC GL Name", Rec."BC GL Name");
                GenJournal_lRec.Validate("BC Income/Balance", Rec."BC Income/Balance");
                GenJournal_lRec.Validate("BC Account Category", Rec."BC Account Category");
                GenJournal_lRec.Validate("BC Account Subcategory", Rec."BC Account Subcategory");
                GenJournal_lRec.Validate(REFRENCE, Rec.REFRENCE);
                GenJournal_lRec.Validate("Job or Null", Rec."Job or Null");
                GenJournal_lRec.Validate("Currency Code", '');
                GenJournal_lRec.Validate("GP  Data Import ", true);
                GenJournal_lRec.Modify(true);
                Rec."Journal Line Created" := true;
                Rec."Journal Line No." := LineNo_lInt;
                Rec."Journal Template Name" := GPSetup_gRec."Gen. Jnl. Template Name";
                Rec."Journal Batch Name" := GPSetup_gRec."Gen. Jnl. Batch Name";
                Rec."Error Log" := '';
                Rec.Modify(true);
                if TempBool then
                    Message('Gen Journal Line is created');
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnAfterDeleteGenJournalLine(var Rec: Record "Gen. Journal Line")
    var
        GPIntermediate_lRec: Record GPIntermediary;
    begin
        GPIntermediate_lRec.Reset();
        if GPIntermediate_lRec.Get(Rec."Entry No") then begin
            GPIntermediate_lRec.Validate("Journal Line Created", false);
            GPIntermediate_lRec.Validate("Journal Line No.", 0);
            GPIntermediate_lRec.Modify(true)
        end;
    end;

    var
        ProgressWindow: Dialog;
        Txt001_cTxt: Label 'Processing.. \Total: #1 \Current: #2';
        Counter: Integer;
        GPSetup_gRec: Record GPSetup;
}