codeunit 50913 "GL Transaction"
{
    var
        GenJnlLine: Record "Gen. Journal Line";

    procedure AllGenJnlLine()
    var
        GLTrans_lRec: Record "GL Trans";
        ModGLTrans_lRec: Record "GL Trans";
        StrTex: Text[50];
        PEriodTex: Integer;
    begin
        StrTex := '1,2,3,4,5,6,7';
        Counter := 0;
        ProgressWindow.Open(Txt001_cTxt);
        PEriodTex := StrMenu(StrTex, 1, 'Please select the period');

        GLTrans_lRec.SetRange("IsProcessed", false);
        GLTrans_lRec.SetFilter(PERIODID, '%1', PEriodTex);
        ProgressWindow.Update(1, GLTrans_lRec.Count);
        if GLTrans_lRec.FindSet() then begin

            repeat
                Counter += 1;
                ProgressWindow.Update(2, Counter);
                IF NOT CreateGnlJnlLines(GenJnlLine, GLTrans_lRec) then begin
                    ModGLTrans_lRec.Get(GLTrans_lRec.EntryNo);
                    //       ModGLTrans_lRec."Error Log" := GetLastErrorText();
                    ModGLTrans_lRec.IsProcessed := true;
                    ModGLTrans_lRec.Modify();
                end else begin
                    ModGLTrans_lRec.Get(GLTrans_lRec.EntryNo);
                    //ModGLTrans_lRec."Error Log" := '';
                    ModGLTrans_lRec."IsProcessed" := true;
                    ModGLTrans_lRec.Modify();
                end;
                GenJnlLine.Insert();
            until GLTrans_lRec.Next() = 0;
            ProgressWindow.Close();
            Message('%1 Gen Journal Lines are created out of %2.', Counter, GLTrans_lRec.Count);
        end;
    end;


    procedure SingleGenJnlLine(var GLTrans_lRec: Record "GL Trans")
    var
        ModGLTrans_lRec: Record "GL Trans";

    begin
        if GLTrans_lRec."IsProcessed" = false then begin
            IF NOT CreateGnlJnlLines(GenJnlLine, GLTrans_lRec) then begin
                ModGLTrans_lRec.Get(GLTrans_lRec.EntryNo);
                // ModGLTrans_lRec."Error Log" := GetLastErrorText();
                ModGLTrans_lRec."IsProcessed" := true;
                ModGLTrans_lRec.Modify();
                GenJnlLine.Insert();
            end else begin
                ModGLTrans_lRec.Get(GLTrans_lRec.EntryNo);
                // ModCreateJournalEntries_lRec."Error Log" := '';
                ModGLTrans_lRec."IsProcessed" := true;
                ModGLTrans_lRec.Modify();
                GenJnlLine.Insert();
            end;
            Message('Gen Journal Line is created');

        end else begin
            Message('Gen Journal Line is already created for this Entry No.: %1', GLTrans_lRec.EntryNo);
        end;
    end;

    procedure BasedonFilter()
    var
        SiCodeunit: Codeunit SingleInstance_CU;
        Filter_lTxt: Text[200];
        GLTrans_lRec: Record "GL Trans";
        ModGLTrans_lRec: Record "GL Trans";
        total: Integer;
    begin
        Filter_lTxt := SiCodeunit.GetFilter();
        Counter := 0;
        GLTrans_lRec.SetFilter(JRNENTRY, Filter_lTxt);
        GLTrans_lRec.SetRange("IsProcessed", false);
        total := GLTrans_lRec.Count;
        if Confirm('Can we continue with these filter %1\ Count: %2', false, Filter_lTxt, total) then begin
            ProgressWindow.Open(Txt001_cTxt);
            ProgressWindow.Update(1, total);
            if GLTrans_lRec.FindSet() then begin
                repeat
                    Counter += 1;
                    ProgressWindow.Update(2, Counter);
                    IF NOT CreateGnlJnlLines(GenJnlLine, GLTrans_lRec) then begin
                        ModGLTrans_lRec.Get(GLTrans_lRec.EntryNo);
                        //       ModGLTrans_lRec."Error Log" := GetLastErrorText();
                        ModGLTrans_lRec.IsProcessed := true;
                        ModGLTrans_lRec.Modify();
                    end else begin
                        ModGLTrans_lRec.Get(GLTrans_lRec.EntryNo);
                        //ModGLTrans_lRec."Error Log" := '';
                        ModGLTrans_lRec."IsProcessed" := true;
                        ModGLTrans_lRec.Modify();
                    end;
                    GenJnlLine.Insert();
                until GLTrans_lRec.Next() = 0;
                ProgressWindow.Close();
                Message('%1 Gen Journal Lines are created out of %2.', Counter, total);
            end;
        end;
    end;





    [TryFunction]
    local procedure CreateGnlJnlLines(var GenJnlLIne_vRec: Record "Gen. Journal Line"; var GLTrans_lRec: Record "GL Trans")
    var
        GenJnlLine_lRec: Record "Gen. Journal Line";
        GenJnlTemplate_lRec: Record "Gen. Journal Template";
        LineNo: Integer;
    begin
        GenJnlLine_lRec.Reset();
        LineNo := 0;
        GenJnlLine_lRec.SetRange("Journal Template Name", GLTrans_lRec.JournalTemplate);
        GenJnlLine_lRec.SetRange("Journal Batch Name", GLTrans_lRec.JournalbatchName);
        If GenJnlLine_lRec.FindLast() then
            LineNo := GenJnlLine_lRec."Line No." + 10000
        else
            LineNo := 10000;

        GenJnlLIne_vRec.Init();
        GenJnlLIne_vRec.Validate("Posting Date", GLTrans_lRec."TRXDATE");
        GenJnlLIne_vRec.Validate("Journal Template Name", GLTrans_lRec.JournalTemplate);
        GenJnlLIne_vRec.Validate("Journal Batch Name", GLTrans_lRec.JournalbatchName);
        GenJnlLIne_vRec.Validate("Line No.", LineNo);
        //GenJnlLIne_vRec.Validate("Entry No", CreateJournalEntries_lRec."Entry No.");
        GenJnlLIne_vRec.Validate("Document No.", Format(GLTrans_lRec.JRNENTRY));
        GenJnlLIne_vRec.Validate("Document Type", GenJnlLine_lRec."Document Type"::" ");
        GenJnlLIne_vRec.Validate("Account Type", GenJnlLine_lRec."Account Type"::"G/L Account");
        GenJnlLIne_vRec.Validate("Account No.", GLTrans_lRec."BCGLNo");
        GenJnlLIne_vRec.Validate(Description, GLTrans_lRec.ORMSTRNM);
        GenJnlLIne_vRec.Validate(Amount, GLTrans_lRec.Net_DrCr);
        GenJnlLIne_vRec.Validate("Amount (LCY)", GLTrans_lRec.Net_DrCr);
        GenJnlLIne_vRec.Validate("Bal. Account Type", GenJnlLine_lRec."Bal. Account Type"::"G/L Account");
        GenJnlLIne_vRec.Validate("Bal. Account No.", '');
        GenJnlLIne_vRec.Validate("Shortcut Dimension 1 Code", GLTrans_lRec.BCdimension1);
        // Evaluate(GenJnlLIne_vRec.JRNENTRY, GLTrans_lRec.ORDOCNUM);
        GenJnlLIne_vRec.Validate("JRNENTRY", GLTrans_lRec.ORDOCNUM);
        GenJnlLIne_vRec.Validate("Fiscal Year", GLTrans_lRec."OPENYEAR");
        GenJnlLIne_vRec.Validate("Period", GLTrans_lRec."PERIODID");
        GenJnlLIne_vRec.Validate("Actnumst", GLTrans_lRec."ACTNUMST");
        GenJnlLIne_vRec.Validate("ORMSTRID", GLTrans_lRec."ORMSTRID");
        GenJnlLIne_vRec.Validate("ORMSTRNM", GLTrans_lRec."ORMSTRNM");
        GenJnlLIne_vRec.Validate("BCdscriptnDim1", GLTrans_lRec."BCdscriptnDim1");
        GenJnlLIne_vRec.Validate("BC GL Name", GLTrans_lRec."BCGLName");
        GenJnlLIne_vRec.Validate("BC Income/Balance", GLTrans_lRec."BCIncomeBalance");
        GenJnlLIne_vRec.Validate("BC Account Category", GLTrans_lRec.BCAccountCategory);
        GenJnlLIne_vRec.Validate("BC Account Subcategory", GLTrans_lRec."BCAccountSubcategory");
        GenJnlLIne_vRec.Validate("REFRENCE", GLTrans_lRec."REFRENCE");
        GenJnlLIne_vRec.Validate("Job or Null", GLTrans_lRec."JobORNull");
        if GenJnlTemplate_lRec.Get(GLTrans_lRec."JournalTemplate") then
            GenJnlLIne_vRec."Source Code" := GenJnlTemplate_lRec."Source Code";


    end;




    // [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterDeleteEvent', '', false, false)]
    // local procedure OnAfterDeleteGenJournalLine(var Rec: Record "Gen. Journal Line")
    // var
    //     GenJnlLine: Record "Gen. Journal Line";
    //     GLTrans_lRec: Record "GL Trans";
    //     Temp_lInt: Integer;
    // begin
    //     GLTrans_lRec.Reset();
    //     if GenJnlLine."Document No."
    //     Evaluate(Temp_lInt, GenJnlLine."Document No.");
    //     GLTrans_lRec.SetRange(JRNENTRY, Temp_lInt);
    //     if GLTrans_lRec.FindSet() then begin
    //         repeat
    //             GLTrans_lRec.IsProcessed := false;
    //             GLTrans_lRec.Modify();

    //         until GLTrans_lRec.Next() = 0;
    //     end;
    // end;

    var
        GenJnlLine_gRec: Record "Gen. Journal Line";
        ProgressWindow: Dialog;
        Txt001_cTxt: Label 'Processing... \Total: #1######## \Current: #2######### ';
        Counter: Integer;


}
