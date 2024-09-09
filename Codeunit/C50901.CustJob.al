codeunit 50901 CustomJobLedEntry
{
    Permissions = TableData "Job Ledger Entry" = rim, tabledata "Job Register" = rim, tabledata Job = ri, tabledata "Job Planning Line Invoice" = r, tabledata "Default Dimension" = rd, tabledata "Job Task Dimension" = rd;

    var
        Text_lVar: Label 'Processing...\Total: #1##############\Current: #2#############\Job No: #3##############\Total Job Task Lines: #4##############\Total Job Planning Lines: #5##############\Total Job Invoice Lines: #6##############\Total Job Led Entrys: #7##############';
        ProgressWindow: Dialog;
        JobSetup_gRec: Record "Jobs Setup";
        SourceSetup_gRec: Record "Source Code Setup";
        GeneralLedSetup_gRec: Record "General Ledger Setup";
        CopyJobItemDetails_gRec: Record "Job Item Details";


    procedure JobEntryTransfer()
    Var
        CustJobLedEntry: Record "Custom Job Ledger Entry";
        ModCustJobLedEntry: Record "Custom Job Ledger Entry";
        JobLedEntry: Record "Job Ledger Entry";
        JobReg: Record "Job Register";
        TempFromInt: Integer;
        TempToInt: Integer;
        TempEntry: Integer;
        TotalEntries: Integer;
    begin
        CustJobLedEntry.Reset();
        TempFromInt := 0;
        TempToInt := 0;
        TempEntry := 0;
        CustJobLedEntry.SetRange(Transferred, false);
        TotalEntries := CustJobLedEntry.Count;
        if CustJobLedEntry.FindSet() then begin
            repeat
                if not JobLedEntry.Get(CustJobLedEntry."Entry No.") then begin
                    JobLedEntry.Init();
                    IF TempFromInt = 0 then
                        TempFromInt := CustJobLedEntry."Entry No.";
                    TempToInt := CustJobLedEntry."Entry No.";
                    JobLedEntry.TransferFields(CustJobLedEntry);
                    JobLedEntry.Insert();
                    ModCustJobLedEntry.Get(CustJobLedEntry."Entry No.");
                    ModCustJobLedEntry.Transferred := true;
                    ModCustJobLedEntry.Modify();
                end;
            until CustJobLedEntry.Next() = 0;

            JobReg.Reset();
            if JobReg.FindLast() then
                TempEntry := JobReg."No.";
            JobReg.Reset();
            JobReg.INIT;
            JobReg."No." := TempEntry + 1;
            JobReg."From Entry No." := TempFromInt;
            JobReg."To Entry No." := TempToInt;
            JobReg."Creation Date" := TODAY;
            JobReg."Creation Time" := TIME;
            JobReg."Source Code" := CustJobLedEntry."Source Code";
            JobReg."Journal Batch Name" := CustJobLedEntry."Journal Batch Name";
            JobReg."User ID" := USERID;
            JobReg.INSERT;
        end;
        if TotalEntries <> 0 then
            Message('Total %1 entries are created in Job Ledger Entry', TotalEntries)
        Else
            Message('Nothing to create');
    end;


    procedure BatchJobEntries()
    var
        Job_lRec: Record Job;
        JobPoc_lRec: Record "Job POC";
        JobPoc_lRec1: Record "Job POC";
        Counter_lInt: Integer;
        SucessCounter_lInt: Integer;
        Temp_lBool: Boolean;
        Total_lInt: Integer;
    begin
        JobPoc_lRec.Reset();
        JobPoc_lRec.SetRange("Is processed", false);
        ProgressWindow.Open(Text_lVar);
        Total_lInt := JobPoc_lRec.Count;
        ProgressWindow.Update(1, Total_lInt);
        Counter_lInt := 1;
        if JobPoc_lRec.FindSet() then begin
            repeat
                Temp_lBool := false;
                InserJobDetails(JobPoc_lRec, Counter_lInt, Temp_lBool);
                if JobPoc_lRec1.Get(JobPoc_lRec."Entry No.") then
                    if JobPoc_lRec1."Is processed" = true then
                        SucessCounter_lInt += 1;
                Counter_lInt += 1;
            until JobPoc_lRec.Next() = 0;
        end;
        Message('%1 Jobs are created out of %2 lines', SucessCounter_lInt, Total_lInt);
        ProgressWindow.Close();
    end;

    procedure InserJobDetails(var JobPoc_lRec: Record "Job POC"; var Counter_lInt: Integer; var Temp_lBool: Boolean)
    var
        JobPoc_lRec1: Record "Job POC";
        Job_lRec: Record Job;
        Customer_lRec: Record Customer;
        JobItemDetails_lRec: Record "Job Item Details";
    begin
        if not Errorlog_lFun(JobPoc_lRec) then begin
            JobPoc_lRec."Error Message" := GetLastErrorText();
            JobPoc_lRec.Error := true;
            JobPoc_lRec.Modify(true);
            CopyJobItemDetails_gRec.Reset();
            CopyJobItemDetails_gRec.SetRange(WS_Job_Number, JobPoc_lRec.WS_Job_Number);
            CopyJobItemDetails_gRec.ModifyAll(Error, true, true);
            CopyJobItemDetails_gRec.ModifyAll(ErrorMessage, GetLastErrorText, true);
            Message('Please Check the Error log for more details');
        end
        else begin
            JobSetup_gRec.Get();
            SourceSetup_gRec.Get();
            if not Job_lRec.Get(JobPoc_lRec.WS_Job_Number) then begin
                if Temp_lBool then begin
                    ProgressWindow.Open(Text_lVar);
                    ProgressWindow.Update(1, Counter_lInt);
                end;
                ProgressWindow.Update(2, Counter_lInt);
                ProgressWindow.Update(3, JobPoc_lRec.WS_Job_Number);
                Job_lRec.Init();
                Job_lRec."No." := JobPoc_lRec.WS_Job_Number;
                Job_lRec.Validate("Procced By Poc", true);
                Job_lRec.Insert(true);
                Job_lRec.Validate("Sell-to Customer No.", JobPoc_lRec.CUSTNMBR);
                Job_lRec."Bill-to Customer No." := JobPoc_lRec.CUSTNMBR;
                Job_lRec.Validate(Description, JobPoc_lRec.WS_Job_Number);
                Job_lRec.Validate("Global Dimension 1 Code", JobPoc_lRec.BCdimension1);
                Job_lRec.Validate("Location Code", JobSetup_gRec."Default Location Code");
                Job_lRec.Modify(true);
                InsetJobTaskLines(JobPoc_lRec);
                InsertJobPlanningLines(JobPoc_lRec);
                InsertJobPlanninglineInvoice(JobPoc_lRec);
                InsertJobLedgers(JobPoc_lRec);
                InsertItemDetails(JobPoc_lRec);
                if Temp_lBool then begin
                    ProgressWindow.Close();
                    Message('The Specific job have sucessfully posted');
                end;
                If JobPoc_lRec1.Get(JobPoc_lRec."Entry No.") then begin
                    JobPoc_lRec1."Is processed" := true;
                    JobPoc_lRec1.Error := false;
                    JobPoc_lRec1."Error Message" := '';
                    JobPoc_lRec1."Item Details error" := '';
                    JobPoc_lRec1.Modify(true);
                    JobItemDetails_lRec.Reset();
                    JobItemDetails_lRec.SetRange(WS_Job_Number, JobPoc_lRec.WS_Job_Number);
                    if JobItemDetails_lRec.FindSet() then begin
                        JobItemDetails_lRec.ModifyAll(IsProcessed, true, true);
                        JobItemDetails_lRec.ModifyAll(Error, false, true);
                        JobItemDetails_lRec.ModifyAll(ErrorMessage, '', true);
                    end;
                end;

                Commit();
            end
            else
                if Temp_lBool then
                    Message('Job Already exist for %1', JobPoc_lRec.WS_Job_Number);
        end;
    end;


    [EventSubscriber(ObjectType::Table, Database::Job, OnBeforeUpdateJobTaskDimension, '', false, false)]
    local procedure Job_OnBeforeUpdateJobTaskDimension(var Job: Record Job; FieldNumber: Integer; ShortcutDimCode: Code[20]; var IsHandled: Boolean)
    begin
        if Job."Procced By Poc" = true then begin
            IsHandled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::DimensionManagement, OnBeforeDefaultDimOnInsert, '', false, false)]
    local procedure DimensionManagement_OnBeforeDefaultDimOnInsert(var DefaultDimension: Record "Default Dimension"; var IsHandled: Boolean)
    var
        Job_lRec: Record Job;
    begin
        Job_lRec.Reset();
        if Job_lRec.Get(DefaultDimension."No.") then
            if Job_lRec."Procced By Poc" = true then
                IsHandled := true;
    end;


    [TryFunction]
    local procedure Errorlog_lFun(var JobPoc_lRec: Record "Job POC")
    var
        Customer_lRec: Record Customer;
        JobItemDetails_lRec: Record "Job Item Details";
        Item_lRec: Record Item;
        Resource_lRec: Record Resource;
        Temp_lStr: Text[50];
    begin
        JobSetup_gRec.Get();
        Customer_lRec.Reset();
        if not Customer_lRec.Get(JobPoc_lRec.CUSTNMBR) then
            Error('Customer does not exist');

        if (JobSetup_gRec."Default Billing type" = JobSetup_gRec."Default Billing type"::Text) or
        (JobSetup_gRec."Default Item type" = JobSetup_gRec."Default Item type"::Text) or
        (JobSetup_gRec."Default Labor type" = JobSetup_gRec."Default Labor type"::Text) then
            Error('Define the Default type in Job Setup');

        if (JobSetup_gRec."Default Billing No." = '') or (JobSetup_gRec."Default Item No." = '') or
        (JobSetup_gRec."Default Labor No." = '') then
            Error('Define the Default No. in Job Setup');

        if JobSetup_gRec.Dimensions = '' then
            Error('Define the Dimensions in Job Setup');

        if JobSetup_gRec."Default Location Code" = '' then
            Error('Define the Location code in Job Setup');

        JobItemDetails_lRec.Reset();
        JobItemDetails_lRec.SetRange(WS_Job_Number, JobPoc_lRec.WS_Job_Number);
        if JobItemDetails_lRec.FindSet() then
            repeat
                CopyJobItemDetails_gRec.Get((JobItemDetails_lRec.EntryNo));
                Temp_lStr := DelChr(JobItemDetails_lRec.ITMCLSCD, '=');
                case true of
                    Temp_lStr = 'BILL':
                        Customer_lRec.Reset();
                    Temp_lStr = 'LABOR':
                        begin
                            CheckLength(JobPoc_lRec, JobItemDetails_lRec);
                            if (not (Resource_lRec.Get(JobItemDetails_lRec.ITEMNMBR))) then
                                Error('The %1 is not present in resouce table', JobItemDetails_lRec.ITEMNMBR);
                        end;
                    else begin
                        CheckLength(JobPoc_lRec, JobItemDetails_lRec);
                        if (not (Item_lRec.Get(JobItemDetails_lRec.ITEMNMBR))) then
                            Error('The %1 is not present in item table', JobItemDetails_lRec.ITEMNMBR);
                    end;
                end;
            until JobItemDetails_lRec.Next() = 0;

    end;

    local procedure CheckLength(var JobPoc_lRec: Record "Job POC"; JobItemDetails_lRec: Record "Job Item Details")
    var
        ErrorStr_lRec: Text[100];
    begin
        if StrLen(JobItemDetails_lRec.ITEMNMBR) > 20 then begin
            ErrorStr_lRec := 'The Length of Item %1 for  Job Nuber: %2 is greater than 20 characters';
            JobPoc_lRec."Item Details error" := StrSubstNo(ErrorStr_lRec, JobItemDetails_lRec.ITEMNMBR, JobPoc_lRec.WS_Job_Number);
            JobPoc_lRec.Modify(true);
        end;
    end;

    local procedure InsetJobTaskLines(var JobPoc_lRec: Record "Job POC")
    begin
        InsertBillingJobTaskLines(JobPoc_lRec);
        InsertMaterialJobTaskLines(JobPoc_lRec);
        InsertLaborJobTaskLInes(JobPoc_lRec);
        InsertTotalJobTaskLines(JobPoc_lRec);
    end;


    local procedure InsertBillingJobTaskLines(var JobPoc_lRec: Record "Job POC")
    var
        JobTask_lRec: Record "Job Task";

    begin
        JobTask_lRec.Reset();
        JobTask_lRec.Init();
        JobTask_lRec.Validate("Job No.", JobPoc_lRec.WS_Job_Number);
        JobTask_lRec.Validate("Job Task No.", '100');
        JobTask_lRec.Insert(true);
        JobTask_lRec.Validate(Description, 'Billing');
        JobTask_lRec.Validate("Job Task Type", JobTask_lRec."Job Task Type"::Posting);
        JobTask_lRec.Validate("Recognized Sales Amount", JobPoc_lRec."Net Billed" + JobPoc_lRec."Adj Accrual (Deferral)");
        JobTask_lRec.Validate("Global Dimension 1 Code", JobPoc_lRec.BCdimension1);
        JobTask_lRec.Validate("Location Code", JobSetup_gRec."Default Location Code");
        JobTask_lRec.modify(true);
        ProgressWindow.Update(4, '1');
    end;

    local procedure InsertMaterialJobTaskLines(var JobPoc_lRec: Record "Job POC")
    var
        JobTask_lRec: Record "Job Task";
    begin
        JobTask_lRec.Reset();
        JobTask_lRec.Init();
        JobTask_lRec.Validate("Job No.", JobPoc_lRec.WS_Job_Number);
        JobTask_lRec.Validate("Job Task No.", '300');
        JobTask_lRec.Insert(true);
        JobTask_lRec.Validate(Description, 'Material');
        JobTask_lRec.Validate("Job Task Type", JobTask_lRec."Job Task Type"::Posting);
        JobTask_lRec.Validate("Recognized Costs Amount", JobPoc_lRec."Actual material Cost$");
        JobTask_lRec.Validate("Global Dimension 1 Code", JobPoc_lRec.BCdimension1);
        JobTask_lRec.Validate("Location Code", JobSetup_gRec."Default Location Code");
        JobTask_lRec.modify(true);
        ProgressWindow.Update(4, '2');
    end;

    local procedure InsertLaborJobTaskLInes(var JobPoc_lRec: Record "Job POC")
    var
        JobTask_lRec: Record "Job Task";
    begin
        JobTask_lRec.Reset();
        JobTask_lRec.Init();
        JobTask_lRec.Validate("Job No.", JobPoc_lRec.WS_Job_Number);
        JobTask_lRec.Validate("Job Task No.", '200');
        JobTask_lRec.Insert(true);
        JobTask_lRec.Validate(Description, 'Labor');
        JobTask_lRec.Validate("Job Task Type", JobTask_lRec."Job Task Type"::Posting);
        JobTask_lRec.Validate("Recognized Costs Amount", JobPoc_lRec."Posted labor$");
        JobTask_lRec.Validate("Global Dimension 1 Code", JobPoc_lRec.BCdimension1);
        JobTask_lRec.Validate("Location Code", JobSetup_gRec."Default Location Code");
        JobTask_lRec.modify(true);
        ProgressWindow.Update(4, '3');
    end;

    local procedure InsertTotalJobTaskLines(var JobPoc_lRec: Record "Job POC")
    var
        JobTask_lRec: Record "Job Task";
    begin
        JobTask_lRec.Reset();
        JobTask_lRec.Init();
        JobTask_lRec.Validate("Job No.", JobPoc_lRec.WS_Job_Number);
        JobTask_lRec.Validate("Job Task No.", 'Total');
        JobTask_lRec.Insert(true);
        JobTask_lRec.Validate(Description, 'Total');
        JobTask_lRec.Validate("Job Task Type", JobTask_lRec."Job Task Type"::Total);
        JobTask_lRec.Validate(Totaling, '100..300');
        JobTask_lRec.Validate("WIP-Total", JobTask_lRec."WIP-Total"::Total);
        JobTask_lRec.Validate("WIP Method", JobSetup_gRec."Default WIP Method");
        JobTask_lRec.Validate("Location Code", JobSetup_gRec."Default Location Code");
        JobTask_lRec.modify(true);
        ProgressWindow.Update(4, '4');
    end;

    local procedure InsertJobPlanningLines(var JobPoc_lRec: Record "Job POC")
    begin
        InsertBillingJobPlanningLines(JobPoc_lRec);
        InsertMaterialJobPlanningLines(JobPoc_lRec);
        InsertLaborJobPlanningLines(JobPoc_lRec);
    end;

    local procedure InsertBillingJobPlanningLines(var JobPoc_lRec: Record "Job POC")
    var
        JobPlanning_lRec: Record "Job Planning Line";
    begin
        JobPlanning_lRec.Reset();
        JobPlanning_lRec.Init();
        JobPlanning_lRec.Validate("Job No.", JobPoc_lRec.WS_Job_Number);
        JobPlanning_lRec.Validate("Job Task No.", '100');
        JobPlanning_lRec.Validate("Line No.", 10000);
        JobPlanning_lRec.Insert(true);
        JobPlanning_lRec.Validate("Document No.", JobPoc_lRec.WS_Job_Number);
        JobPlanning_lRec.Validate(Description, 'Posted Billing Line');
        JobPlanning_lRec.Validate(Type, JobSetup_gRec."Default Billing type");
        JobPlanning_lRec.Validate("No.", JobSetup_gRec."Default Billing No.");
        JobPlanning_lRec.Validate(Quantity, 1);
        JobPlanning_lRec.Validate("Unit Price (LCY)", JobPoc_lRec."Net Billed");
        JobPlanning_lRec.Validate("Unit Price", JobPoc_lRec."Net Billed");
        JobPlanning_lRec.Validate("Line Type", JobPlanning_lRec."Line Type"::Billable);
        JobPlanning_lRec.Validate("Schedule Line", false);
        JobPlanning_lRec.Validate("Contract Line", true);
        JobPlanning_lRec.Validate("System-Created Entry", false);
        JobPlanning_lRec.Validate("Usage Link", false);
        JobPlanning_lRec.Validate("Qty. to Transfer to Invoice", 0);
        JobPlanning_lRec.Validate("Qty. to Invoice", 0);
        JobPlanning_lRec.Modify(true);
        ProgressWindow.Update(5, '1');
    end;

    local procedure InsertMaterialJobPlanningLines(var JobPoc_lRec: Record "Job POC")
    var
        JobPlanning_lRec: Record "Job Planning Line";
    begin
        JobPlanning_lRec.Reset();
        JobPlanning_lRec.Init();
        JobPlanning_lRec.Validate("Job No.", JobPoc_lRec.WS_Job_Number);
        JobPlanning_lRec.Validate("Job Task No.", '300');
        JobPlanning_lRec.Validate("Line No.", 10000);
        JobPlanning_lRec.Insert(true);
        JobPlanning_lRec.Validate("Document No.", JobPoc_lRec.WS_Job_Number);
        JobPlanning_lRec.Validate(Description, 'Posted Material Line');
        JobPlanning_lRec.Validate(Type, JobSetup_gRec."Default Item type");
        JobPlanning_lRec.Validate("No.", JobSetup_gRec."Default Item No.");
        JobPlanning_lRec.Validate(Quantity, 1);
        JobPlanning_lRec.Validate("Unit Cost (LCY)", JobPoc_lRec."Actual material Cost$" + JobPoc_lRec."Cost returns$");
        JobPlanning_lRec.Validate("Unit Cost", JobPoc_lRec."Actual material Cost$" + JobPoc_lRec."Cost returns$");
        JobPlanning_lRec.Validate("Line Type", JobPlanning_lRec."Line Type"::Budget);
        JobPlanning_lRec.Validate("Schedule Line", true);
        JobPlanning_lRec.Validate("Contract Line", false);
        JobPlanning_lRec.Validate("System-Created Entry", false);
        JobPlanning_lRec.Validate("Qty. Posted", 1);
        JobPlanning_lRec.Validate("Posted Total Cost (LCY)", JobPoc_lRec."Actual material Cost$" + JobPoc_lRec."Cost returns$");
        JobPlanning_lRec.Validate("Posted Total Cost", JobPoc_lRec."Actual material Cost$" + JobPoc_lRec."Cost returns$");
        JobPlanning_lRec.Validate("Qty. Picked", 1);
        JobPlanning_lRec.Validate("Qty. Picked (Base)", 1);
        JobPlanning_lRec.Validate("Completely Picked", true);
        JobPlanning_lRec.Validate("Usage Link", true);
        JobPlanning_lRec.Validate("Remaining Qty.", 0);
        JobPlanning_lRec.Validate("Remaining Qty. (Base)", 0);
        JobPlanning_lRec.Modify(true);
        ProgressWindow.Update(5, '2');
    end;

    local procedure InsertLaborJobPlanningLines(var JobPoc_lRec: Record "Job POC")
    var
        JobPlanning_lRec: Record "Job Planning Line";
    begin
        JobPlanning_lRec.Reset();
        JobPlanning_lRec.Init();
        JobPlanning_lRec.Validate("Job No.", JobPoc_lRec.WS_Job_Number);
        JobPlanning_lRec.Validate("Job Task No.", '200');
        JobPlanning_lRec.Validate("Line No.", 10000);
        JobPlanning_lRec.Insert(true);
        JobPlanning_lRec.Validate("Document No.", JobPoc_lRec.WS_Job_Number);
        JobPlanning_lRec.Validate(Description, 'Posted Labor Line');
        JobPlanning_lRec.Validate(Type, JobSetup_gRec."Default Labor type");
        JobPlanning_lRec.Validate("No.", JobSetup_gRec."Default Labor No.");
        JobPlanning_lRec.Validate(Quantity, 1);
        JobPlanning_lRec.Validate("Unit Cost (LCY)", JobPoc_lRec."Posted labor$");
        JobPlanning_lRec.Validate("Unit Cost", JobPoc_lRec."Posted labor$");
        JobPlanning_lRec.Validate("Line Type", JobPlanning_lRec."Line Type"::Budget);
        JobPlanning_lRec.Validate("Schedule Line", true);
        JobPlanning_lRec.Validate("Contract Line", false);
        JobPlanning_lRec.Validate("System-Created Entry", false);
        JobPlanning_lRec.Validate("Qty. Posted", 1);
        JobPlanning_lRec.Validate("Posted Total Cost (LCY)", JobPoc_lRec."Posted labor$");
        JobPlanning_lRec.Validate("Posted Total Cost", JobPoc_lRec."Posted labor$");
        JobPlanning_lRec.Validate("Qty. Picked", 1);
        JobPlanning_lRec.Validate("Qty. Picked (Base)", 1);
        JobPlanning_lRec.Validate("Completely Picked", true);
        JobPlanning_lRec.Validate("Usage Link", true);
        JobPlanning_lRec.Validate("Remaining Qty.", 0);
        JobPlanning_lRec.Validate("Remaining Qty. (Base)", 0);
        JobPlanning_lRec.Modify(true);
        ProgressWindow.Update(5, '3');
    end;

    local procedure InsertJobPlanninglineInvoice(var JobPoc_lRec: Record "Job POC")
    var
        JobPlanInvoice_lVar: Record "Job Planning Line Invoice";
    begin
        JobPlanInvoice_lVar.Reset();
        JobPlanInvoice_lVar.Init();
        JobPlanInvoice_lVar.Validate("Job No.", JobPoc_lRec.WS_Job_Number);
        JobPlanInvoice_lVar.Validate("Job Task No.", '100');
        JobPlanInvoice_lVar.Validate("Job Planning Line No.", 10000);
        JobPlanInvoice_lVar.Validate("Document Type", JobPlanInvoice_lVar."Document Type"::"Posted Invoice");
        JobPlanInvoice_lVar.Validate("Document No.", JobPoc_lRec.WS_Job_Number);
        JobPlanInvoice_lVar.Validate("Line No.", 10000);
        JobPlanInvoice_lVar.Insert(true);
        JobPlanInvoice_lVar.Validate("Quantity Transferred", 1);
        JobPlanInvoice_lVar.Validate("Transferred Date", Today);
        JobPlanInvoice_lVar.Validate("Invoiced Date", Today);
        JobPlanInvoice_lVar.Validate("Invoiced Amount (LCY)", JobPoc_lRec."Net Billed");
        JobPlanInvoice_lVar.Validate("Invoiced Cost Amount (LCY)", 0);
        // JobPlanInvoice_lVar.Validate("Job Ledger Entry No.", '');
        JobPlanInvoice_lVar.Modify(true);
        ProgressWindow.Update(6, '1');
    end;

    local procedure InsertJobLedgers(var JobPoc_lRec: Record "Job POC")
    begin
        InsertBillingJobLedger(JobPoc_lRec);
        InsertLaborJobLedger(JobPoc_lRec);
        InsertMaterialJobLedger(JobPoc_lRec);
        CreateLedgerRegister(JobPoc_lRec);

    end;

    local procedure InsertBillingJobLedger(var JobPoc_lRec: Record "Job POC")
    var
        Jobledger_lRec: Record "Job Ledger Entry";
        Jobledger_lRec1: Record "Job Ledger Entry";
        Temp_lInt: Integer;
        GlAccount_lRec: Record "G/L Account";
        Customer_lRec: Record Customer;
    begin
        Jobledger_lRec1.Reset();
        Temp_lInt := 1;
        if Jobledger_lRec1.FindLast() then
            Temp_lInt := Jobledger_lRec1."Entry No." + 1;
        Jobledger_lRec.Reset();
        Jobledger_lRec.Init();
        Jobledger_lRec.Validate("Entry No.", Temp_lInt);
        Jobledger_lRec.Insert(true);
        Jobledger_lRec.Validate("Job No.", JobPoc_lRec.WS_Job_Number);
        Jobledger_lRec.Validate("Job Task No.", '100');
        Jobledger_lRec.Validate("Posting Date", Today);
        Jobledger_lRec.Validate("Document No.", JobPoc_lRec.WS_Job_Number);
        Jobledger_lRec.Validate(Description, 'Posted Billing Line');
        Jobledger_lRec.Validate(Type, JobSetup_gRec."Default Billing type");
        Jobledger_lRec.Validate("No.", JobSetup_gRec."Default Billing No.");
        Jobledger_lRec.Validate(Quantity, -1);
        Jobledger_lRec.Validate("Quantity (Base)", -1);
        Jobledger_lRec.Validate("Unit Cost (LCY)", 0);
        Jobledger_lRec.Validate("Unit Cost", 0);
        Jobledger_lRec.Validate("Total Cost (LCY)", 0);
        Jobledger_lRec.Validate("Total Cost", 0);
        Jobledger_lRec.Validate("Unit Price (LCY)", JobPoc_lRec."Net Billed");
        Jobledger_lRec.Validate("Unit Price", JobPoc_lRec."Net Billed");
        Jobledger_lRec.Validate("Total Price (LCY)", JobPoc_lRec."Net Billed" * -1);
        Jobledger_lRec.Validate("Total Price", JobPoc_lRec."Net Billed" * -1);
        Jobledger_lRec.Validate("Line Amount (LCY)", JobPoc_lRec."Net Billed" * -1);
        Jobledger_lRec.Validate("Line Amount", JobPoc_lRec."Net Billed" * -1);
        Jobledger_lRec.Validate("Job Posting Group", JobSetup_gRec."Inventory Posting Group");
        Jobledger_lRec.Validate("Global Dimension 1 Code", JobPoc_lRec.BCdimension1);
        Jobledger_lRec.Validate("Global Dimension 2 Code", '');
        Jobledger_lRec.Validate("Source Code", SourceSetup_gRec.Sales);
        Jobledger_lRec.Validate("Entry Type", Jobledger_lRec."Entry Type"::Sale);
        Jobledger_lRec.Validate("External Document No.", JobPoc_lRec.WS_Job_Number);
        Jobledger_lRec.Validate("Currency Factor", 1);
        Jobledger_lRec.Validate("Ledger Entry Type", Jobledger_lRec."Ledger Entry Type"::"G/L Account");
        Jobledger_lRec.Validate("Line Type", Jobledger_lRec."Line Type"::Billable);
        Jobledger_lRec.Validate("Original Unit Cost (LCY)", 0);
        Jobledger_lRec.Validate("Original Unit Cost", 0);
        Jobledger_lRec.Validate("Original Total Cost (LCY)", 0);
        Jobledger_lRec.Validate("Original Total Cost", 0);
        Jobledger_lRec.Validate("Qty. per Unit of Measure", 1);
        Jobledger_lRec.Validate("Document Date", Today);
        Jobledger_lRec.Validate("User ID", UserId);
        if GlAccount_lRec.Get(JobSetup_gRec."Default Billing No.") then
            Jobledger_lRec.Validate("Gen. Prod. Posting Group", GlAccount_lRec."Gen. Prod. Posting Group");
        if Customer_lRec.Get(JobPoc_lRec.CUSTNMBR) then begin
            Jobledger_lRec.Validate("Gen. Bus. Posting Group", Customer_lRec."Gen. Bus. Posting Group");
            Jobledger_lRec.Validate("Country/Region Code", Customer_lRec."Country/Region Code");
        end;
        Jobledger_lRec.Modify(true);
        GetJobDimensionandId(Temp_lInt);
        ProgressWindow.Update(7, '1');
    end;

    local procedure InsertMaterialJobLedger(var JobPoc_lRec: Record "Job POC")
    var
        Jobledger_lRec: Record "Job Ledger Entry";
        Jobledger_lRec1: Record "Job Ledger Entry";
        Temp_lInt: Integer;
        Item_lRec: Record Item;
        Customer_lRec: Record Customer;
    begin
        Jobledger_lRec1.Reset();
        if Jobledger_lRec1.FindLast() then
            Temp_lInt := Jobledger_lRec1."Entry No." + 1;
        Jobledger_lRec.Reset();
        Jobledger_lRec.Init();
        Jobledger_lRec.Validate("Entry No.", Temp_lInt);
        Jobledger_lRec.Insert(true);
        Jobledger_lRec.Validate("Job No.", JobPoc_lRec.WS_Job_Number);
        Jobledger_lRec.Validate("Job Task No.", '300');
        Jobledger_lRec.Validate("Posting Date", Today);
        Jobledger_lRec.Validate("Document No.", JobPoc_lRec.WS_Job_Number);
        Jobledger_lRec.Validate(Description, 'Posted Material Line');
        Jobledger_lRec.Validate(Type, JobSetup_gRec."Default Item type");
        Jobledger_lRec.Validate("No.", JobSetup_gRec."Default Item No.");
        if Item_lRec.Get(JobSetup_gRec."Default Item No.") then begin
            Jobledger_lRec.Validate("Unit of Measure Code", Item_lRec."Base Unit of Measure");
            Jobledger_lRec.Validate("Gen. Prod. Posting Group", Item_lRec."Gen. Prod. Posting Group");
        end;
        Jobledger_lRec.Validate(Quantity, 1);
        Jobledger_lRec.Validate("Quantity (Base)", 1);
        Jobledger_lRec.Validate("Unit Cost (LCY)", JobPoc_lRec."Actual material Cost$" + JobPoc_lRec."Cost returns$");
        Jobledger_lRec.Validate("Unit Cost", JobPoc_lRec."Actual material Cost$" + JobPoc_lRec."Cost returns$");
        Jobledger_lRec.Validate("Total Cost (LCY)", JobPoc_lRec."Actual material Cost$" + JobPoc_lRec."Cost returns$");
        Jobledger_lRec.Validate("Total Cost", JobPoc_lRec."Actual material Cost$" + JobPoc_lRec."Cost returns$");
        Jobledger_lRec.Validate("Unit Price (LCY)", 0);
        Jobledger_lRec.Validate("Unit Price", 0);
        Jobledger_lRec.Validate("Total Price (LCY)", 0);
        Jobledger_lRec.Validate("Total Price", 0);
        Jobledger_lRec.Validate("Line Amount (LCY)", 0);
        Jobledger_lRec.Validate("Line Amount", 0);
        Jobledger_lRec.Validate("Job Posting Group", JobSetup_gRec."Inventory Posting Group");
        Jobledger_lRec.Validate("Global Dimension 1 Code", JobPoc_lRec.BCdimension1);
        Jobledger_lRec.Validate("Global Dimension 2 Code", '');
        Jobledger_lRec.Validate("Source Code", SourceSetup_gRec."Job Journal");
        Jobledger_lRec.Validate("Amt. to Post to G/L", JobPoc_lRec."Actual material Cost$");
        Jobledger_lRec.Validate("Entry Type", Jobledger_lRec."Entry Type"::Usage);
        Jobledger_lRec.Validate("External Document No.", JobPoc_lRec.WS_Job_Number);
        Jobledger_lRec.Validate("Currency Factor", 1);
        Jobledger_lRec.Validate("Ledger Entry Type", Jobledger_lRec."Ledger Entry Type"::Item);
        Jobledger_lRec.Validate("Line Type", Jobledger_lRec."Line Type"::Budget);
        Jobledger_lRec.Validate("Original Unit Cost (LCY)", JobPoc_lRec."Actual material Cost$" + JobPoc_lRec."Cost returns$");
        Jobledger_lRec.Validate("Original Unit Cost", JobPoc_lRec."Actual material Cost$" + JobPoc_lRec."Cost returns$");
        Jobledger_lRec.Validate("Original Total Cost (LCY)", JobPoc_lRec."Actual material Cost$" + JobPoc_lRec."Cost returns$");
        Jobledger_lRec.Validate("Original Total Cost", JobPoc_lRec."Actual material Cost$" + JobPoc_lRec."Cost returns$");
        Jobledger_lRec.Validate("Qty. per Unit of Measure", 1);
        Jobledger_lRec.Validate("Document Date", Today);
        Jobledger_lRec.Validate("User ID", UserId);
        if Customer_lRec.Get(JobPoc_lRec.CUSTNMBR) then
            Jobledger_lRec.Validate("Country/Region Code", Customer_lRec."Country/Region Code");
        Jobledger_lRec.Validate("Journal Batch Name", 'DEFAULT');
        Jobledger_lRec.Modify(true);
        GetJobDimensionandId(Temp_lInt);
        ProgressWindow.Update(7, '2');
    end;

    local procedure InsertLaborJobLedger(var JobPoc_lRec: Record "Job POC")
    var
        Jobledger_lRec: Record "Job Ledger Entry";
        Jobledger_lRec1: Record "Job Ledger Entry";
        Temp_lInt: Integer;
        Resource_lRec: Record Resource;
        Customer_lRec: Record Customer;
    begin
        Jobledger_lRec1.Reset();
        if Jobledger_lRec1.FindLast() then
            Temp_lInt := Jobledger_lRec1."Entry No." + 1;
        Jobledger_lRec.Reset();
        Jobledger_lRec.Init();
        Jobledger_lRec.Validate("Entry No.", Temp_lInt);
        Jobledger_lRec.Insert(true);
        Jobledger_lRec.Validate("Job No.", JobPoc_lRec.WS_Job_Number);
        Jobledger_lRec.Validate("Job Task No.", '200');
        Jobledger_lRec.Validate("Posting Date", Today);
        Jobledger_lRec.Validate("Document No.", JobPoc_lRec.WS_Job_Number);
        Jobledger_lRec.Validate(Description, 'Posted Labor Line');
        Jobledger_lRec.Validate(Type, JobSetup_gRec."Default Labor type");
        Jobledger_lRec.Validate("No.", JobSetup_gRec."Default Labor No.");
        Jobledger_lRec.Validate(Quantity, 1);
        Jobledger_lRec.Validate("Quantity (Base)", 1);
        Jobledger_lRec.Validate("Unit Cost (LCY)", JobPoc_lRec."Posted labor$");
        Jobledger_lRec.Validate("Unit Cost", JobPoc_lRec."Posted labor$");
        Jobledger_lRec.Validate("Total Cost (LCY)", JobPoc_lRec."Posted labor$");
        Jobledger_lRec.Validate("Total Cost", JobPoc_lRec."Posted labor$");
        Jobledger_lRec.Validate("Unit Price (LCY)", 0);
        Jobledger_lRec.Validate("Unit Price", 0);
        Jobledger_lRec.Validate("Total Price (LCY)", 0);
        Jobledger_lRec.Validate("Total Price", 0);
        Jobledger_lRec.Validate("Line Amount (LCY)", 0);
        Jobledger_lRec.Validate("Line Amount", 0);
        Jobledger_lRec.Validate("Job Posting Group", JobSetup_gRec."Inventory Posting Group");
        Jobledger_lRec.Validate("Global Dimension 1 Code", JobPoc_lRec.BCdimension1);
        Jobledger_lRec.Validate("Global Dimension 2 Code", '');
        if Resource_lRec.Get(JobSetup_gRec."Default Labor No.") then begin
            Jobledger_lRec.Validate("Unit of Measure Code", Resource_lRec."Base Unit of Measure");
            Jobledger_lRec.Validate("Gen. Prod. Posting Group", Resource_lRec."Gen. Prod. Posting Group");
        end;
        Jobledger_lRec.Validate("Source Code", SourceSetup_gRec."Job Journal");
        Jobledger_lRec.Validate("Amt. to Post to G/L", JobPoc_lRec."Posted labor$");
        Jobledger_lRec.Validate("Entry Type", Jobledger_lRec."Entry Type"::Usage);
        Jobledger_lRec.Validate("External Document No.", JobPoc_lRec.WS_Job_Number);
        Jobledger_lRec.Validate("Currency Factor", 1);
        Jobledger_lRec.Validate("Ledger Entry Type", Jobledger_lRec."Ledger Entry Type"::Resource);
        Jobledger_lRec.Validate("Line Type", Jobledger_lRec."Line Type"::Budget);
        Jobledger_lRec.Validate("Original Unit Cost (LCY)", JobPoc_lRec."Posted labor$");
        Jobledger_lRec.Validate("Original Unit Cost", JobPoc_lRec."Posted labor$");
        Jobledger_lRec.Validate("Original Total Cost (LCY)", JobPoc_lRec."Posted labor$");
        Jobledger_lRec.Validate("Original Total Cost", JobPoc_lRec."Posted labor$");
        Jobledger_lRec.Validate("Qty. per Unit of Measure", 1);
        Jobledger_lRec.Validate("Document Date", Today);
        Jobledger_lRec.Validate("User ID", UserId);
        if Customer_lRec.Get(JobPoc_lRec.CUSTNMBR) then
            Jobledger_lRec.Validate("Country/Region Code", Customer_lRec."Country/Region Code");
        Jobledger_lRec.Validate("Journal Batch Name", 'DEFAULT');
        Jobledger_lRec.Modify(true);
        GetJobDimensionandId(Temp_lInt);
        ProgressWindow.Update(7, '3');
    end;

    local procedure CreateLedgerRegister(var JobPoc_lRec: Record "Job POC")
    var
        JobReg_lRec: Record "Job Register";
        TempEntryNo: Integer;
        TempFromInt: Integer;
        TempToInt: Integer;
        Jobledger_lRec: Record "Job Ledger Entry";
    begin
        JobReg_lRec.Reset();
        if JobReg_lRec.FindLast() then
            TempEntryNo := JobReg_lRec."No.";
        Jobledger_lRec.Reset();
        Jobledger_lRec.SetRange("Job No.", JobPoc_lRec.WS_Job_Number);
        if Jobledger_lRec.FindFirst() then
            TempFromInt := Jobledger_lRec."Entry No.";
        Jobledger_lRec.Reset();
        Jobledger_lRec.SetRange("Job No.", JobPoc_lRec.WS_Job_Number);
        if Jobledger_lRec.FindLast() then
            TempToInt := Jobledger_lRec."Entry No.";
        JobReg_lRec.Reset();
        JobReg_lRec.INIT;
        JobReg_lRec.Validate("No.", TempEntryNo + 1);
        JobReg_lRec.Validate("From Entry No.", TempFromInt);
        JobReg_lRec.Validate("To Entry No.", TempToInt);
        JobReg_lRec.Validate("Creation Date", TODAY);
        JobReg_lRec.Validate("Creation Time", TIME);
        JobReg_lRec.Validate("Source Code", SourceSetup_gRec.Sales);
        JobReg_lRec.Validate("Journal Batch Name", 'Posting');
        JobReg_lRec.Validate("User ID", USERID);
        JobReg_lRec.INSERT(true);
    end;

    local procedure InsertItemDetails(var JobPoc_lRec: Record "Job POC")
    var
        JobItemDetails_lRec: Record "Job Item Details";
        Temp_lStr: Text[30];
    begin
        JobItemDetails_lRec.Reset();
        JobItemDetails_lRec.SetRange(WS_Job_Number, JobPoc_lRec.WS_Job_Number);
        if JobItemDetails_lRec.FindSet() then begin
            repeat
                Temp_lStr := DelChr(JobItemDetails_lRec.ITMCLSCD, '=');
                case true of
                    Temp_lStr = 'BILL':
                        InsertItemBillingJobPlanningLines(JobItemDetails_lRec);
                    Temp_lStr = 'LABOR':
                        InsertItemLaborJobPlanningLines(JobItemDetails_lRec);
                    else
                        InsertItemMaterialJobPlanningLines(JobItemDetails_lRec);
                end;
            until JobItemDetails_lRec.Next() = 0;
        end;
    end;

    local procedure InsertItemBillingJobPlanningLines(JobItemDetails_lRec: Record "Job Item Details")
    var
        JobPlanning_lRec: Record "Job Planning Line";
        JobPlanning_lRec1: Record "Job Planning Line";
        Temp_lInt: Integer;
        Temp_lDec: Decimal;
    begin
        JobPlanning_lRec1.Reset();
        JobPlanning_lRec1.SetRange("Job No.", JobItemDetails_lRec.WS_Job_Number);
        JobPlanning_lRec1.SetRange("Job Task No.", '100');
        Temp_lInt := 10000;
        if JobPlanning_lRec1.FindLast() then
            Temp_lInt := JobPlanning_lRec1."Line No." + 10000;
        JobPlanning_lRec.Reset();
        JobPlanning_lRec.Init();
        JobPlanning_lRec.Validate("Job No.", JobItemDetails_lRec.WS_Job_Number);
        JobPlanning_lRec.Validate("Job Task No.", '100');
        JobPlanning_lRec.Validate("Line No.", Temp_lInt);
        JobPlanning_lRec.Insert(true);
        JobPlanning_lRec.Validate("Document No.", JobItemDetails_lRec.WS_Job_Number);
        JobPlanning_lRec.Validate(Description, JobItemDetails_lRec.ITEMNMBR);
        JobPlanning_lRec.Validate(Type, JobSetup_gRec."Default Billing type");
        JobPlanning_lRec.Validate("No.", JobSetup_gRec."Default Billing No.");
        JobPlanning_lRec.Validate(Quantity, JobItemDetails_lRec.QTYREMAI);
        Temp_lDec := JobItemDetails_lRec.XTNDPRCE / JobItemDetails_lRec.QTYREMAI;
        JobPlanning_lRec.Validate("Unit Price (LCY)", Temp_lDec);
        JobPlanning_lRec.Validate("Unit Price", Temp_lDec);
        JobPlanning_lRec.Validate("Line Type", JobPlanning_lRec."Line Type"::Billable);
        JobPlanning_lRec.Validate("Schedule Line", false);
        JobPlanning_lRec.Validate("Contract Line", true);
        JobPlanning_lRec.Validate("System-Created Entry", false);
        JobPlanning_lRec.Validate("Usage Link", false);
        JobPlanning_lRec.Validate("Qty. to Invoice", JobItemDetails_lRec.QTYREMAI);
        JobPlanning_lRec.Validate("Qty. to Transfer to Invoice", 0);
        JobPlanning_lRec.Modify(true);
        JobItemDetails_lRec.Error := false;
        JobItemDetails_lRec.ErrorMessage := '';
        JobItemDetails_lRec.Modify(true);
        JobPlanning_lRec1.Reset();
        JobPlanning_lRec1.SetRange("Job No.", JobItemDetails_lRec.WS_Job_Number);
        Temp_lInt := JobPlanning_lRec1.Count;
        ProgressWindow.Update(5, Format(Temp_lInt));
    end;

    local procedure InsertItemMaterialJobPlanningLines(JobItemDetails_lRec: Record "Job Item Details")
    var
        JobPlanning_lRec: Record "Job Planning Line";
        JobPlanning_lRec1: Record "Job Planning Line";
        Temp_lInt: Integer;
        Item_lRec: Record Item;
    begin
        JobPlanning_lRec1.Reset();
        JobPlanning_lRec1.SetRange("Job No.", JobItemDetails_lRec.WS_Job_Number);
        JobPlanning_lRec1.SetRange("Job Task No.", '300');
        Temp_lInt := 10000;
        if JobPlanning_lRec1.FindLast() then
            Temp_lInt := JobPlanning_lRec1."Line No." + 10000;
        JobPlanning_lRec.Reset();
        JobPlanning_lRec.Init();
        JobPlanning_lRec.Validate("Job No.", JobItemDetails_lRec.WS_Job_Number);
        JobPlanning_lRec.Validate("Job Task No.", '300');
        JobPlanning_lRec.Validate("Line No.", Temp_lInt);
        JobPlanning_lRec.Insert(true);
        JobPlanning_lRec.Validate("Document No.", JobItemDetails_lRec.WS_Job_Number);
        JobPlanning_lRec.Validate(Type, JobSetup_gRec."Default Item type");
        if Item_lRec.Get(JobItemDetails_lRec.ITEMNMBR) then begin
            JobPlanning_lRec.Validate("No.", Item_lRec."No.");
            JobPlanning_lRec.Validate(Description, Item_lRec.Description);
        end;
        JobPlanning_lRec.Validate(Quantity, JobItemDetails_lRec.QTYREMAI);
        JobPlanning_lRec.Validate("Unit Cost (LCY)", JobItemDetails_lRec.UNITCOST);
        JobPlanning_lRec.Validate("Unit Cost", JobItemDetails_lRec.UNITCOST);
        JobPlanning_lRec.Validate("Line Type", JobPlanning_lRec."Line Type"::Budget);
        JobPlanning_lRec.Validate("Schedule Line", true);
        JobPlanning_lRec.Validate("Contract Line", false);
        JobPlanning_lRec.Validate("System-Created Entry", false);
        JobPlanning_lRec.Validate("Usage Link", true);
        JobPlanning_lRec.Validate("Remaining Qty.", JobItemDetails_lRec.QTYREMAI);
        JobPlanning_lRec.Validate("Remaining Qty. (Base)", JobItemDetails_lRec.QTYREMAI);
        JobPlanning_lRec.Validate("Remaining Total Cost (LCY)", JobItemDetails_lRec.EXTDCOST);
        JobPlanning_lRec.Validate("Remaining Total Cost", JobItemDetails_lRec.EXTDCOST);
        JobPlanning_lRec.Validate("Completely Picked", false);
        JobPlanning_lRec.Validate("Qty. to Transfer to Journal", 0);
        JobPlanning_lRec.Modify(true);
        JobItemDetails_lRec.Error := false;
        JobItemDetails_lRec.ErrorMessage := '';
        JobItemDetails_lRec.Modify(true);
        JobPlanning_lRec1.Reset();
        JobPlanning_lRec1.SetRange("Job No.", JobItemDetails_lRec.WS_Job_Number);
        Temp_lInt := JobPlanning_lRec1.Count;
        ProgressWindow.Update(5, Format(Temp_lInt));
    end;

    local procedure InsertItemLaborJobPlanningLines(JobItemDetails_lRec: Record "Job Item Details")
    var
        JobPlanning_lRec: Record "Job Planning Line";
        JobPlanning_lRec1: Record "Job Planning Line";
        Temp_lInt: Integer;
        Resource_lRec: Record Resource;
    begin
        JobPlanning_lRec1.Reset();
        JobPlanning_lRec1.SetRange("Job No.", JobItemDetails_lRec.WS_Job_Number);
        JobPlanning_lRec1.SetRange("Job Task No.", '200');
        Temp_lInt := 10000;
        if JobPlanning_lRec1.FindLast() then
            Temp_lInt := JobPlanning_lRec1."Line No." + 10000;
        JobPlanning_lRec.Reset();
        JobPlanning_lRec.Init();
        JobPlanning_lRec.Validate("Job No.", JobItemDetails_lRec.WS_Job_Number);
        JobPlanning_lRec.Validate("Job Task No.", '200');
        JobPlanning_lRec.Validate("Line No.", Temp_lInt);
        JobPlanning_lRec.Insert(true);
        JobPlanning_lRec.Validate("Document No.", JobItemDetails_lRec.WS_Job_Number);
        JobPlanning_lRec.Validate(Type, JobSetup_gRec."Default Labor type");
        if Resource_lRec.Get(JobItemDetails_lRec.ITEMNMBR) then
            JobPlanning_lRec.Validate("No.", Resource_lRec."No.");
        JobPlanning_lRec.Validate(Description, JobItemDetails_lRec.ITEMNMBR);
        JobPlanning_lRec.Validate(Quantity, JobItemDetails_lRec.QTYREMAI);
        JobPlanning_lRec.Validate("Unit Cost (LCY)", JobItemDetails_lRec.STNDCOST);
        JobPlanning_lRec.Validate("Unit Cost", JobItemDetails_lRec.STNDCOST);
        JobPlanning_lRec.Validate("Line Type", JobPlanning_lRec."Line Type"::Budget);
        JobPlanning_lRec.Validate("Schedule Line", true);
        JobPlanning_lRec.Validate("Contract Line", false);
        JobPlanning_lRec.Validate("System-Created Entry", false);
        JobPlanning_lRec.Validate("Usage Link", true);
        JobPlanning_lRec.Validate("Remaining Qty.", JobItemDetails_lRec.QTYREMAI);
        JobPlanning_lRec.Validate("Remaining Qty. (Base)", JobItemDetails_lRec.QTYREMAI);
        JobPlanning_lRec.Validate("Remaining Total Cost (LCY)", JobItemDetails_lRec.LaborUnpExtCst);
        JobPlanning_lRec.Validate("Remaining Total Cost", JobItemDetails_lRec.LaborUnpExtCst);
        JobPlanning_lRec.Validate("Completely Picked", false);
        JobPlanning_lRec.Validate("Qty. to Transfer to Journal", 0);
        JobPlanning_lRec.Modify(true);
        JobItemDetails_lRec.Error := false;
        JobItemDetails_lRec.ErrorMessage := '';
        JobItemDetails_lRec.Modify(true);
        JobPlanning_lRec1.Reset();
        JobPlanning_lRec1.SetRange("Job No.", JobItemDetails_lRec.WS_Job_Number);
        Temp_lInt := JobPlanning_lRec1.Count;
        ProgressWindow.Update(5, Format(Temp_lInt));
    end;

    local procedure GetJobDimensionandId(Temp_lInt: Integer)
    var
        Jobledger_lRec: Record "Job Ledger Entry";
        Temp_lVar: Integer;
    begin
        if Jobledger_lRec.Get(Temp_lInt) then begin
            Temp_lVar := ValidateGD1Dimension1(Jobledger_lRec."Global Dimension 1 Code", Jobledger_lRec."Dimension Set ID");
            Jobledger_lRec."Dimension Set ID" := Temp_lVar;
            Jobledger_lRec.Modify(true);
        end;
    end;

    local procedure ValidateGD1Dimension1(GlobalDimension1Code: Code[20]; DimSetID: Integer): Integer
    var
        DimVal: Record "Dimension Value";
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        DimSetEntry: Record "Dimension Set Entry";
    begin
        DimVal."Dimension Code" := JobSetup_gRec.Dimensions;
        GetDimensionSet(TempDimSetEntry, DimSetID);
        DimVal.Get(DimVal."Dimension Code", GlobalDimension1Code);
        if TempDimSetEntry.Get(TempDimSetEntry."Dimension Set ID", DimVal."Dimension Code") then
            if TempDimSetEntry."Dimension Value Code" <> GlobalDimension1Code then
                TempDimSetEntry.Delete();
        if GlobalDimension1Code <> '' then begin
            TempDimSetEntry."Dimension Code" := DimVal."Dimension Code";
            TempDimSetEntry."Dimension Value Code" := DimVal.Code;
            TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
            if TempDimSetEntry.Insert() then;
        end;
        DimSetID := GetDimensionSetID(TempDimSetEntry);
        exit(DimSetID)

    end;

    local procedure GetDimensionSetID(var DimSetEntry2: Record "Dimension Set Entry"): Integer
    var
        DimSetEntry: Record "Dimension Set Entry";
    begin
        exit(DimSetEntry.GetDimensionSetID(DimSetEntry2));
    end;

    local procedure GetDimensionSet(var TempDimSetEntry: Record "Dimension Set Entry" temporary; DimSetID: Integer)
    var
        DimSetEntry: Record "Dimension Set Entry";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;

        TempDimSetEntry.DeleteAll();
        DimSetEntry.SetRange("Dimension Set ID", DimSetID);
        if DimSetEntry.FindSet() then
            repeat
                TempDimSetEntry := DimSetEntry;
                TempDimSetEntry.Insert();
            until DimSetEntry.Next() = 0;

    end;


    [EventSubscriber(ObjectType::Table, Database::Job, OnAfterDeleteEvent, '', false, false)]
    local procedure Onafterdelete(VAR Rec: Record Job; RunTrigger: Boolean)
    var
        JobPoc_lRec: Record "Job POC";
    begin
        JobPoc_lRec.Reset();
        JobPoc_lRec.SetRange(WS_Job_Number, Rec."No.");
        JobPoc_lRec.ModifyAll("Is processed", false, true);
    end;


}

