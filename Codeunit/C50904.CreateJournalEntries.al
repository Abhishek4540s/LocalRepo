codeunit 50904 "Create Journal Entries"
{
    procedure AllGenJnlLine()
    var
        CreateJournalEntries_lRec: Record "Create Journal Entries";
    begin
        Counter := 0;
        SkippedCounter := 0;
        ProgressWindow.Open(Txt001_cTxt);
        ProgressWindow.Update(1, CreateJournalEntries_lRec.Count);

        CreateJournalEntries_lRec.SetRange("Is Processed", false);
        if CreateJournalEntries_lRec.FindSet() then begin
            repeat
                if CreateJournalEntries_lRec.perdblnc <> 0 then begin
		if ((CreateJournalEntries_lRec.periodid in [0 .. 12]) and (CreateJournalEntries_lRec.Year = 2020)) or
                   ((CreateJournalEntries_lRec.periodid in [1 .. 12]) and (CreateJournalEntries_lRec.Year in [2021, 2022, 2023])) then begin
                        Counter += 1;
                        ProgressWindow.Update(2, Counter);
                        ProgressWindow.Update(3, SkippedCounter);
                        CreateGnlJnlLines(CreateJournalEntries_lRec);
                    end else begin
                        SkippedCounter += 1;
                    end;
                end else begin
                    SkippedCounter += 1;
                end;
            until CreateJournalEntries_lRec.Next() = 0;
            ProgressWindow.Close();
            Message('%1 Gen Journal Lines are created out of %2. \%3 records were skipped.', Counter, CreateJournalEntries_lRec.Count, SkippedCounter);
        end;
    end;

    procedure SingleGenJnlLine(var CreateJournalEntries_lRec: Record "Create Journal Entries")
    var
        GenJnlLine_lRec: Record "Gen. Journal Line";
    begin
        if CreateJournalEntries_lRec."Is Processed" = false then begin
            if CreateJournalEntries_lRec.perdblnc <> 0 then begin
		if ((CreateJournalEntries_lRec.periodid in [0 .. 12]) and (CreateJournalEntries_lRec.Year = 2020)) or
                   ((CreateJournalEntries_lRec.periodid in [1 .. 12]) and (CreateJournalEntries_lRec.Year in [2021, 2022, 2023])) then begin
                    CreateGnlJnlLines(CreateJournalEntries_lRec);
                    Message('Gen Journal Line is created');
                end else begin
                    Message('Gen Journal Line is not created');
                end;
            end else begin
                Message('Gen Journal Line is not created because perdblnc is 0');
            end;
        end else begin
            Message('Gen Journal Line is already created for this Entry No.: %1', CreateJournalEntries_lRec."Entry No.");
        end;
    end;


    local procedure CreateGnlJnlLines(var CreateJournalEntries_lRec: Record "Create Journal Entries")
    var
        GenJnlLine_lRec: Record "Gen. Journal Line";
        GenJnlTemplate_lRec: Record "Gen. Journal Template";
        LineNo: Integer;
    begin
        GenJnlLine_lRec.Reset();
        CreateJournalEntries_lRec.Reset();
        LineNo := 0;
        GenJnlLine_lRec.SetRange("Journal Template Name", CreateJournalEntries_lRec."Journal Template");
        GenJnlLine_lRec.SetRange("Journal Batch Name", CreateJournalEntries_lRec."Journal Batch Name");
        If GenJnlLine_lRec.FindLast() then
            LineNo := GenJnlLine_lRec."Line No." + 10000
        else
            LineNo := 10000;
        GenJnlLine_lRec.Init();
        GenJnlLine_lRec.Validate("Journal Template Name", CreateJournalEntries_lRec."Journal Template");
        GenJnlLine_lRec.Validate("Journal Batch Name", CreateJournalEntries_lRec."Journal Batch Name");
        GenJnlLine_lRec.Validate("Line No.", LineNo);
        GenJnlLine_lRec.Insert();
        GenJnlLine_lRec.Validate("Entry No", CreateJournalEntries_lRec."Entry No.");
        GenJnlLine_lRec.Validate("Posting Date", CreateJournalEntries_lRec."Posting Date");
        GenJnlLine_lRec.Validate("Document No.", CreateJournalEntries_lRec."Document No");
        GenJnlLine_lRec.Validate("Document Type", GenJnlLine_lRec."Document Type"::" ");
        GenJnlLine_lRec.Validate("Account Type", GenJnlLine_lRec."Account Type"::"G/L Account");
        GenJnlLine_lRec.Validate("Account No.", CreateJournalEntries_lRec."BC GL No");
        GenJnlLine_lRec.Validate(Description, CreateJournalEntries_lRec."GP ACTNUMST ");
        GenJnlLine_lRec.Validate(Amount, CreateJournalEntries_lRec.perdblnc);
        GenJnlLine_lRec.Validate("Amount (LCY)", CreateJournalEntries_lRec.perdblnc);
        GenJnlLine_lRec.Validate("Bal. Account Type", GenJnlLine_lRec."Bal. Account Type"::"G/L Account");
        GenJnlLine_lRec.Validate("Bal. Account No.", '');
        GenJnlLine_lRec.Validate("Shortcut Dimension 1 Code",CreateJournalEntries_lRec.BCdimension1);
        GenJnlLine_lRec.Validate("Is GL History",true);
        if GenJnlTemplate_lRec.Get(CreateJournalEntries_lRec."Journal Template") then
            GenJnlLine_lRec."Source Code" := GenJnlTemplate_lRec."Source Code";
        GenJnlLine_lRec.Modify();

        CreateJournalEntries_lRec."Is Processed" := true;
        CreateJournalEntries_lRec.Modify();
        If GLAccount_gRec.Get(CreateJournalEntries_lRec."BC GL No") then begin
            CreateJournalEntries_lRec."Error Log" := '';
            CreateJournalEntries_lRec.Modify(true);
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnAfterDeleteGenJournalLine(var Rec: Record "Gen. Journal Line")
    var
        CreateJournalEntries_lRec: Record "Create Journal Entries";
        GenJnlLine: Record "Gen. Journal Line";
    begin
        CreateJournalEntries_lRec.Reset();
        CreateJournalEntries_lRec.SetRange("Entry No.", Rec."Entry No");
        CreateJournalEntries_lRec.SetRange("Is Processed", true);
        if CreateJournalEntries_lRec.FindFirst() then begin
            CreateJournalEntries_lRec.Validate("Is Processed", false);
            CreateJournalEntries_lRec.Validate("Error Log", '');
            CreateJournalEntries_lRec.Modify();
        end;
    end;

    var
        CreateJnlEntries_gRec: Record "Create Journal Entries";
        GLAccount_gRec: Record "G/L Account";
        GenJnlLine_gRec: Record "Gen. Journal Line";
        ProgressWindow: Dialog;
        Txt001_cTxt: Label 'Processing.. \Total: #1 \Current: #2 \Skipped: #3';
        Counter: Integer;
        SkippedCounter: Integer;
}
