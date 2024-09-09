codeunit 50900 subscriber
{

    // //
    // [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterInsertEvent, '', true, true)]
    // local procedure OnAfterCustInsertEvent(var Rec: Record Customer)
    // var
    //     Link_lStr: Label 'https://sstsun.sharepoint.com/sites/Testing/Shared%20Documents/Forms/AllItems.aspx?FolderCTID=0x012000A14934A62AE3044D9F083A227D1A2B70&id=%2Fsites%2FTesting%2FShared%20Documents%2FCustomers&viewid=52d8eb00%2D717d%2D42d5%2D894d%2D61d39ca2c112';

    // begin
    //     Rec.AddLink(Link_lStr, 'Open Sharepoint Link');
    //     // Message(format(Database::Customer));
    // end;

    // [EventSubscriber(ObjectType::Table, Database::Vendor, OnAfterInsertEvent, '', true, true)]
    // local procedure OnAfterVendInsertEvent(var Rec: Record Vendor)
    // var
    //     Link_lStr: Label 'https://sstsun.sharepoint.com/sites/Testing/Shared%20Documents/Forms/AllItems.aspx?FolderCTID=0x012000A14934A62AE3044D9F083A227D1A2B70&id=%2Fsites%2FTesting%2FShared%20Documents%2FVendors&viewid=52d8eb00%2D717d%2D42d5%2D894d%2D61d39ca2c112';

    // begin
    //     Rec.AddLink(Link_lStr, 'Open Sharepoint Link');
    //     // Message(format(Database::Customer));
    // end;

    // [EventSubscriber(ObjectType::Table, Database::Item, OnAfterInsertEvent, '', true, true)]
    // local procedure OnAfterItemInsertEvent(var Rec: Record Item)
    // var
    //     Link_lStr: Label 'https://sstsun.sharepoint.com/sites/Testing/Shared%20Documents/Forms/AllItems.aspx?FolderCTID=0x012000A14934A62AE3044D9F083A227D1A2B70&id=%2Fsites%2FTesting%2FShared%20Documents%2FItems&viewid=52d8eb00%2D717d%2D42d5%2D894d%2D61d39ca2c112';

    // begin
    //     Rec.AddLink(Link_lStr, 'Open Sharepoint Link');
    //     // Message(format(Database::Customer));
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"G/L Account", OnAfterInsertEvent, '', true, true)]
    // local procedure OnAfterGLAccountInsertEvent(var Rec: Record "G/L Account")
    // var
    //     Link_lStr: Label 'https://sstsun.sharepoint.com/sites/Testing/Shared%20Documents/Forms/AllItems.aspx?FolderCTID=0x012000A14934A62AE3044D9F083A227D1A2B70&id=%2Fsites%2FTesting%2FShared%20Documents%2FGL%20Account&viewid=52d8eb00%2D717d%2D42d5%2D894d%2D61d39ca2c112';

    // begin
    //     Rec.AddLink(Link_lStr, 'Open Sharepoint Link');
    //     // Message(format(Database::Customer));
    // end;
    //Sharepoint connector


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterAssignFixedAssetValues, '', false, false)]
    local procedure "Sales Line_OnAfterAssignFixedAssetValues"(var SalesLine: Record "Sales Line"; FixedAsset: Record "Fixed Asset"; SalesHeader: Record "Sales Header")
    begin
        SalesLine."Tax Group Code" := FixedAsset."Tax Group Code";
    end;


    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnAfterAssignFixedAssetValues, '', false, false)]
    local procedure "Purchase Line_OnAfterAssignFixedAssetValues"(var PurchLine: Record "Purchase Line"; FixedAsset: Record "Fixed Asset"; PurchHeader: Record "Purchase Header")
    begin
        PurchLine."Tax Group Code" := FixedAsset."Tax Group Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostGLAccOnAfterInitGLEntry', '', false, false)]
    local procedure OnPostGLAccOnAfterInitGLEntry(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry");
    var
        GPIntermediate_lRec: Record GPIntermediary;
    begin
        GLEntry.JRNENTRY := GenJournalLine.JRNENTRY;
        GLEntry."Fiscal Year" := GenJournalLine."Fiscal Year";
        GLEntry.Period := GenJournalLine.Period;
        GLEntry.Actnumst := GenJournalLine.Actnumst;
        GLEntry.ORMSTRID := GenJournalLine.ORMSTRID;
        GLEntry.SOURCDOC := GenJournalLine.SOURCDOC;
        GLEntry.ORMSTRNM := GenJournalLine.ORMSTRNM;
        GLEntry.BCdscriptnDim1 := GenJournalLine.BCdscriptnDim1;
        GLEntry."BC GL Name" := GenJournalLine."BC GL Name";
        GLEntry."BC Income/Balance" := GenJournalLine."BC Income/Balance";
        GLEntry."BC Account Category" := GenJournalLine."BC Account Category";
        GLEntry."BC Account Subcategory" := GenJournalLine."BC Account Subcategory";
        GLEntry.REFRENCE := GenJournalLine.REFRENCE;
        GLEntry."Job or Null" := GenJournalLine."Job or Null";
        GLEntry."GP  Data Import " := GenJournalLine."GP  Data Import ";
        GLEntry."GP Entry No" := GenJournalLine."Entry No";
        if GenJournalLine."GP  Data Import " = true then begin
            if GPIntermediate_lRec.Get(GLEntry."GP Entry No") then begin
                GPIntermediate_lRec."Processed Date & Time" := CurrentDateTime;
                GPIntermediate_lRec."Processed By" := UserId;
                GPIntermediate_lRec.Modify(true);
            end;
        end;

    end;

    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", OnAfterInsertEvent, '', false, false)]
    local procedure OnAfterInsertGLEntry(var Rec: Record "G/L Entry")
    var
        GPIntermediate_lRec: Record GPIntermediary;
    begin
        if Rec."GP  Data Import " = true then begin
            if GPIntermediate_lRec.Get(Rec."GP Entry No") then begin
                GPIntermediate_lRec.Validate("General Ledger Entry No", Rec."Entry No.");
                GPIntermediate_lRec.Modify(true)
            end;

        end;
    end;


    [EventSubscriber(ObjectType::Table, Database::Job, OnBeforeBillToCustomerNoUpdated, '', false, false)]
    local procedure Job_OnBeforeBillToCustomerNoUpdated(var Job: Record Job; var xJob: Record Job; CallingFieldNo: Integer; var IsHandled: Boolean)
    var
        Job_lRec: Record Job;
    begin
        if CallingFieldNo = 0 then
            exit;
        if Job."Sell-to Customer No." <> xJob."Sell-to Customer No." then begin
            Job.Validate("Ship-to Code", '');
            Job.Validate("Ship-to Address", '');
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterInsertEvent', '', true, true)]
    local procedure OnAfterInsertCustomer(var Rec: Record Customer; RunTrigger: Boolean)
    var
        NoSeries: Record "No. Series";
    begin
        // Check if the customer was created using the GEN-CCUST number series
        if NoSeries.Get(Rec."No. Series") then begin
            if NoSeries."Is Generic" then begin
                Rec."Is Generic Customer" := true;
                Rec.Modify();
            end
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::Job, 'OnBeforeValidateSellToCustomerName', '', true, true)]
    local procedure Job_OnBeforeValidateSellToCustomerName(var Job: Record Job; var IsHandled: Boolean)
    var
        SalesHeader: Record "Sales Header";
    begin

        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::Job, 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnAfterJobDelete(var Rec: Record Job)
    var
        SalesQuoteRec: Record "Sales Header";
    begin
        if SalesQuoteRec.Get(SalesQuoteRec."Document Type"::Quote, Rec."Sales Qoute No") then begin
            SalesQuoteRec."Job No" := '';
            SalesQuoteRec.Modify(true);
        end;
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Quote to Order (Yes/No)", 'OnBeforeConfirmConvertToOrder', '', true, true)]
    local procedure OnBeforeConfirmConvertToOrder(SalesHeader: Record "Sales Header"; var IsHandled: Boolean; var Result: Boolean)
    var
        DailogBoolean: Boolean;
        SalesRecievables: Record "Sales & Receivables Setup";
    begin
        SalesRecievables.Get();
        IF SalesRecievables."Restrict Expired Quote" then begin
            if (SalesHeader."Quote Valid Until Date" <> 0D) and (WorkDate() > SalesHeader."Quote Valid Until Date") then begin
                DailogBoolean := Dialog.Confirm('Sales Quote %1 is expired. Do you still want to convert it into an order?', true, SalesHeader."No.");
                if not DailogBoolean then begin
                    IsHandled := true;
                    exit;
                end;
                Result := true;
                IsHandled := true;
            end;
        end;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnBeforeTestStatusOpen, '', false, false)]
    local procedure "Purchase Line_OnBeforeTestStatusOpen"(var PurchaseLine: Record "Purchase Line"; var PurchaseHeader: Record "Purchase Header"; xPurchaseLine: Record "Purchase Line"; CallingFieldNo: Integer; var IsHandled: Boolean)
    begin
        if PurchaseHeader."PO Generator" then
            IsHandled := true;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, "Salesperson Code", true, true)]
    local procedure OnAfterValidateSalespersonCode(var Rec: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
    begin
        If Rec."Document Type" <> Rec."Document Type"::Quote then
            exit;

        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        if SalesLine.FindSet() then begin
            repeat
                SalesLine.Validate("Salesperson Code", Rec."Salesperson Code");
                SalesLine.Modify();
            until SalesLine.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Job Planning Line", OnAfterValidateEvent, "Quantity", true, true)]
    local procedure OnAfterValidateQuantity(var Rec: Record "Job Planning Line")
    begin
        if Rec."Allow modification" = false then begin
            Rec.Validate("Original Qty.", Rec.Quantity);
            Rec.Modify(true);
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Job Planning Line", OnAfterValidateEvent, "No.", true, true)]
    local procedure OnAfterValidateNo(var Rec: Record "Job Planning Line")
    begin
        if (Rec.Type = Rec.Type::Item) or (Rec.Type = Rec.Type::Resource) then begin
            Rec.Validate("Unit Price", 0);
            Rec.Validate("Unit Price (LCY)", 0);
        end;
        Rec.Validate("Current Cost", Rec."Unit Cost");
        Rec.Validate("Base Line No.", Rec."Line No.");
        Rec.Modify(true)
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Job", OnCopyJobPlanningLinesOnBeforeModifyTargetJobPlanningLine, '', false, false)]
    local procedure "Copy Job_OnCopyJobPlanningLinesOnBeforeModifyTargetJobPlanningLine"(var TargetJobPlanningLine: Record "Job Planning Line")
    var
        SICodeunit_CU: Codeunit SingleInstance_CU;
        TempBool_lBool: Boolean;
    begin
        TempBool_lBool := SICodeunit_CU.GetCopyDate();
        if not TempBool_lBool then begin
            TargetJobPlanningLine.Validate("Planning Date", 0D);
            TargetJobPlanningLine.Validate("Planned Delivery Date", 0D)
        end
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Job", OnCopyJobPlanningLinesOnAfterTargetJobPlanningLineInsert, '', false, false)]
    local procedure "Copy Job_OnCopyJobPlanningLinesOnAfterTargetJobPlanningLineInsert"(var TargetJobPlanningLine: Record "Job Planning Line"; SourceJobPlanningLine: Record "Job Planning Line")
    begin
        if SourceJobPlanningLine."Planning Date" = 0D then
            TargetJobPlanningLine.Validate("Planning Date", 0D);
        if SourceJobPlanningLine."Planned Delivery Date" = 0D then
            TargetJobPlanningLine.Validate("Planned Delivery Date", 0D)
    end;



    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterAssignItemValues, '', false, false)]
    local procedure "Sales Line_OnAfterAssignItemValues"(var SalesLine: Record "Sales Line"; Item: Record Item; SalesHeader: Record "Sales Header"; var xSalesLine: Record "Sales Line"; CurrentFieldNo: Integer)
    begin
        SalesLine."Unit Cost" := Item."Unit Cost";
        SalesLine."Unit Cost (LCY)" := Item."Unit Cost";
        SalesLine."Standard Cost" := Item."Standard Cost";
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterAssignResourceValues, '', false, false)]
    local procedure "Sales Line_OnAfterAssignResourceValues"(var SalesLine: Record "Sales Line"; Resource: Record Resource; SalesHeader: Record "Sales Header")
    begin
        SalesLine."Unit Cost" := Resource."Unit Cost";
        SalesLine."Unit Cost (LCY)" := Resource."Unit Cost";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnBeforeInsertEvent, '', true, true)]
    local procedure OnBeforeInsertEvent(var Rec: Record "Sales Line"; RunTrigger: Boolean)
    var
        SalesHeader: Record "Sales Header";
    begin
        // If Rec.IsTemporary then
        //     exit;
        if SalesHeader.Get(Rec."Document Type", Rec."Document No.") then
            IF Rec."Salesperson Code" = '' then
                Rec.Validate("Salesperson Code", SalesHeader."Salesperson Code");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "No.", true, true)]
    local procedure T37_No_OnAfterValidateEvent(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    var
        SalesHeader: Record "Sales Header";
    begin
        // If Rec.IsTemporary then
        //     exit;
        SalesHeader.Get(Rec."Document Type", Rec."Document No.");
        IF Rec."Salesperson Code" = '' then
            Rec.Validate("Salesperson Code", SalesHeader."Salesperson Code");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Create-Invoice", OnBeforeInsertSalesLine, '', false, false)]
    local procedure "Job Create-Invoice_OnBeforeInsertSalesLine"(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header"; Job: Record Job; JobPlanningLine: Record "Job Planning Line"; JobInvCurrency: Boolean)
    begin
        SalesLine."Tax Area Code" := JobPlanningLine."Tax Area Code";
        SalesLine."Tax Group Code" := JobPlanningLine."Tax Group Code";
        SalesLine."Salesperson Code" := JobPlanningLine."Salesperson Code";
        // SalesHeader."Job No" := JobPlanningLine."Job No.";
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Create-Invoice", OnBeforeModifySalesHeader, '', false, false)]
    local procedure "Job Create-Invoice_OnBeforeModifySalesHeader"(var SalesHeader: Record "Sales Header"; Job: Record Job; JobPlanningLine: Record "Job Planning Line")
    begin
        SalesHeader."Salesperson Code" := Job."Salesperson Code";
        SalesHeader."Job No" := Job."No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", OnFromPlanningLineToJnlLineOnBeforeCopyItemTracking, '', true, true)]
    local procedure OnFromPlanningLineToJnlLineOnBeforeCopyItemTracking(JobPlanningLine: Record "Job Planning Line"; var JobJournalLine: Record "Job Journal Line")
    begin
        JobJournalLine."Tax Area Code" := JobPlanningLine."Tax Area Code";
        JobJournalLine."Tax Group Code" := JobPlanningLine."Tax Group Code";
        JobJournalLine."Salesperson Code" := JobPlanningLine."Salesperson Code";
    end;

    local procedure CheckProjectSalesQuoteDeleteValidations(var Rec: Record "Sales Header")
    var
        JobRec: Record Job;
        IsHandled: Boolean;
    begin
        OnBeforeCheckProjectSalesQuoteDeleteValidations(Rec, IsHandled);
        If IsHandled then
            exit;
        If Rec.IsTemporary then
            exit;
        if Rec."Document Type" <> Rec."Document Type"::Quote then
            exit;
        if JobRec.Get(Rec."Job No") then begin
            Error('The Sales Quote cannot be deleted as it is linked to a Job.');
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeDeleteEvent', '', false, false)]
    local procedure OnBeforeSalesHeaderDelete(var Rec: Record "Sales Header")

    begin
        // Check if the Sales Quote is linked to any Job
        CheckProjectSalesQuoteDeleteValidations(Rec);
    end;



    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckProjectSalesQuoteDeleteValidations(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    begin
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", OnAfterFromJnlLineToLedgEntry, '', false, false)]
    local procedure "Job Transfer Line_OnAfterFromJnlLineToLedgEntry"(var JobLedgerEntry: Record "Job Ledger Entry"; JobJournalLine: Record "Job Journal Line")
    begin
        JobLedgerEntry."Salesperson Code" := JobJournalLine."Salesperson Code";
        JobLedgerEntry."Tax Area Code" := JobJournalLine."Tax Area Code";
        JobLedgerEntry."Tax Group Code" := JobJournalLine."Tax Group Code";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, "Sell-to Customer No.", true, true)]
    local procedure SalesHeader_OnAfterValidateEvent(var Rec: Record "Sales Header")
    var
        Customer: Record Customer;
        ShipToAddress: Record "Ship-to Address";
    begin
        If Customer.get(Rec."Sell-to Customer No.") then begin
            Rec."Sell-to Customer Name 2" := Customer.Name;
            Rec."Salesperson Code" := Customer."Salesperson Code";
            Rec.MobileNo := Customer."Mobile Phone No.";
            Rec.PhoneNo := Customer."Phone No.";
            Rec.Email := Customer."E-Mail";
            Rec."Contact Name" := Customer.Contact;
            Rec."Ship-to Name 2" := Customer.Name;
        end;
        If ShipToAddress.Get(Rec."Sell-to Customer No.", Rec."Ship-to Code") then begin
            if Customer."Is Generic Customer" then
                Rec.Validate("Ship-to Name", Rec."Sell-to Customer Name 2");
            Rec.Validate("Ship to Contact", ShipToAddress.Contact);
            Rec.Validate("Ship to Location Code", ShipToAddress."Location Code");
            Rec.Validate("Ship to Service Zone Code", ShipToAddress."Service Zone Code");
            Rec.Validate("Ship to Tax Area Code", ShipToAddress."Tax Area Code");
            Rec.Validate("Ship to Tax Liable", ShipToAddress."Tax Liable");
            Rec.validate("Shipment Method Code", ShipToAddress."Shipment Method Code");
            Rec.validate("Shipping Agent Code", ShipToAddress."Shipping Agent Code");
            Rec."Shipping Agent Service Code" := ShipToAddress."Shipment Method Code";
            Rec.Validate("Salesperson Code", ShipToAddress."Salesperson Code");
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, "Sell-to Customer Name 2", true, true)]
    local procedure SalesHeader_OnAfterValidateEventName2(var Rec: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        if Customer.Get(Rec."Sell-to Customer No.") then begin
            if Customer."Is Generic Customer" then begin
                Rec.Validate("Ship-to Name", Rec."Sell-to Customer Name 2");
                // Rec.Validate("Bill-to Name 2", Rec."Sell-to Customer Name 2");
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, "Ship-to Code", true, true)]
    local procedure SalesHeader_OnAfterValidateEventShiptocode(var Rec: Record "Sales Header")
    var
        Customer: Record Customer;
        ShipToAddress: Record "Ship-to Address";
    begin
        // If Customer.get(Rec."Sell-to Customer No.") then begin
        //     // if Rec.SetShipToAddress();
        //     Rec."Sell-to Customer Name 2" := Customer.Name;
        //     Rec."Salesperson Code" := Customer."Salesperson Code";
        //     Rec.MobileNo := Customer."Mobile Phone No.";
        //     Rec.PhoneNo := Customer."Phone No.";
        //     Rec.Email := Customer."E-Mail";
        //     Rec."Contact Name" := Customer.Contact;
        // end;
        // If ShipToAddress.Get(Rec."Sell-to Customer No.", Rec."Ship-to Code") then begin
        //     Rec.Validate("Ship to Contact", ShipToAddress.Contact);
        //     Rec.Validate("Ship to Location Code", ShipToAddress."Location Code");
        //     Rec.Validate("Ship to Service Zone Code", ShipToAddress."Service Zone Code");
        //     Rec.Validate("Ship to Tax Area Code", ShipToAddress."Tax Area Code");
        //     Rec.Validate("Ship to Tax Liable", ShipToAddress."Tax Liable");
        //     Rec.validate("Shipment Method Code", ShipToAddress."Shipment Method Code");
        //     Rec.validate("Shipping Agent Code", ShipToAddress."Shipping Agent Code");
        //     Rec."Shipping Agent Service Code" := ShipToAddress."Shipment Method Code";
        // end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", OnAfterFromPlanningSalesLineToJnlLine, '', false, false)]
    local procedure "Job Transfer Line_OnAfterFromPlanningSalesLineToJnlLine"(var JobJnlLine: Record "Job Journal Line"; JobPlanningLine: Record "Job Planning Line"; SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; EntryType: Enum "Job Journal Line Entry Type")
    begin
        JobJnlLine."Tax Area Code" := SalesLine."Tax Area Code";
        JobJnlLine."Tax Group Code" := SalesLine."Tax Group Code";
        JobJnlLine."Salesperson Code" := SalesLine."Salesperson Code";
    end;

    [EventSubscriber(ObjectType::Table, Database::Job, OnBeforeValidateEvent, "Sell-to Customer No.", true, true)]
    local procedure Job_OnAfterValidateEventSellToCustomerNo(var Rec: Record Job)
    var
        Customer: Record Customer;
    begin
        if Customer.get(Rec."Sell-to Customer No.") then begin
            if Customer."Is Generic Customer" then
                Rec.FieldError("Sell-to Customer No.", 'You cannot create project using generic customer, Kindly use customer.');
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnBeforeSalesLineInsert, '', true, true)]
    local procedure OnBeforeSalesLineInsert(SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var TempSalesLine: Record "Sales Line" temporary)
    begin
        SalesLine.SuspendStatusCheck(True);
        if TempSalesLine."Location Code" <> '' then
            SalesLine.Validate("Location Code", TempSalesLine."Location Code");
        If TempSalesLine."Unit Price" <> 0 then
            SalesLine.Validate("Unit Price", TempSalesLine."Unit Price");
        If TempSalesLine."Tax Area Code" <> '' then
            SalesLine."Tax Area Code" := TempSalesLine."Tax Area Code";
        If TempSalesLine."Tax Group Code" <> '' then
            SalesLine."Tax Group Code" := TempSalesLine."Tax Group Code";
        If TempSalesLine."Salesperson Code" <> '' then
            SalesLine.Validate("Salesperson Code", TempSalesLine."Salesperson Code");
        if TempSalesLine."Billing Line" = true then
            SalesLine.Validate("Billing Line", TempSalesLine."Billing Line");

        if TempSalesLine."Shortcut Dimension 1 Code" <> '' then
            SalesLine.Validate("Shortcut Dimension 1 Code", TempSalesLine."Shortcut Dimension 1 Code");
        if TempSalesLine."Shortcut Dimension 2 Code" <> '' then
            SalesLine.Validate("Shortcut Dimension 2 Code", TempSalesLine."Shortcut Dimension 2 Code");
        SalesLine.UpdateAmounts();
        SalesLine.SuspendStatusCheck(False);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnRecreateReservEntryReqLineOnAfterCalcShouldValidateLocationCode, '', false, false)]
    local procedure "Sales Header_OnRecreateReservEntryReqLineOnAfterCalcShouldValidateLocationCode"(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var ShouldValidateLocationCode: Boolean)
    begin
        if SalesHeader."Generic Customer No" <> '' then
            ShouldValidateLocationCode := false;
    end;

    [EventSubscriber(ObjectType::Page, page::"Sales Quote", OnBeforeActionEvent, MakeOrder, false, false)]
    local procedure P41_MakeOrder_OnBeforeActionEvent(var Rec: Record "Sales Header")
    var
        Customer_lRec: Record Customer;
    begin
        if Customer_lRec.Get(Rec."Sell-to Customer No.") then
            if Customer_lRec."Is Generic Customer" then
                Error('Sales Order cannot be created using generic customer, Kindly use new customer.');
    end;

    [EventSubscriber(ObjectType::Page, page::"Sales Quotes", OnBeforeActionEvent, MakeOrder, false, false)]
    local procedure P9300_OnBeforeActionEvent(var Rec: Record "Sales Header")
    var
        Customer_lRec: Record Customer;
    begin
        if Customer_lRec.Get(Rec."Sell-to Customer No.") then
            if Customer_lRec."Is Generic Customer" then
                Error('Sales Order cannot be created using generic customer, Kindly use new customer.');
    end;


    [EventSubscriber(ObjectType::Table, Database::Customer, OnBeforeValidatePostCode, '', false, false)]
    local procedure Customer_OnBeforeValidatePostCode(var Customer: Record Customer; var PostCodeRec: Record "Post Code"; CurrentFieldNo: Integer; var IsHandled: Boolean)
    begin
        if (Customer."Is Generic Customer") or (Customer."Generic Customer No" <> '') then
            IsHandled := true;
    end;


    [EventSubscriber(ObjectType::Table, Database::Job, OnAfterValidateEvent, "Ship-to Code", false, false)]
    local procedure "Job_ShipToCode_OnAfterValidateEvent"(CurrFieldNo: Integer; var Rec: Record Job; var xRec: Record Job)
    var
        JobPlanningLines: Record "Job Planning Line";
        ShipToAddrress: Record "Ship-to Address";
        Customer: Record Customer;
        Job_lRec: Record Job;
        ShipToAddress_lRec: Record "Ship-to Address";
        ShipToAddress_lTex: Text[100];
    begin
        JobPlanningLines.SetRange("Job No.", Rec."No.");
        if JobPlanningLines.FindSet() then begin
            repeat
                if Rec."Ship-to Code" = '' then begin
                    if Customer.Get(Rec."Bill-to Customer No.") then
                        JobPlanningLines."Tax Area Code" := Customer."Tax Area Code";
                end else begin
                    if ShipToAddrress.Get(Rec."Bill-to Customer No.", Rec."Ship-to Code") then begin
                        if ShipToAddrress."Tax Area Code" <> '' then begin
                            JobPlanningLines."Tax Area Code" := ShipToAddrress."Tax Area Code";
                        end else if Customer.Get(Rec."Bill-to Customer No.") then begin
                            JobPlanningLines."Tax Area Code" := Customer."Tax Area Code";
                        end;
                    end else if Customer.Get(Rec."Bill-to Customer No.") then
                            JobPlanningLines."Tax Area Code" := Customer."Tax Area Code";
                end;
                JobPlanningLines.Modify();
            until JobPlanningLines.Next() = 0;
        end;
    end;


    [EventSubscriber(ObjectType::Page, page::"Job Card", OnAfterValidateEvent, "Ship-to Code", false, false)]
    local procedure "JobCard_ShipToCode_OnAfterValidateEvent"(var Rec: Record Job; var xRec: Record Job)
    var
        JobPlanningLines: Record "Job Planning Line";
        ShipToAddrress: Record "Ship-to Address";
        Customer: Record Customer;
        Job_lRec: Record Job;
        ShipToAddress_lRec: Record "Ship-to Address";
        ShipToAddress_lTex: Text[100];
    begin
        // if CurrFieldNo = 0 then
        //     exit;
        if (Rec."Ship-to Code" <> '') then begin
            // Rec.GetHideValidationDialog() then 
            // if (xRec."No." <> '') then begin
            if Rec."Ship-to Code" <> xRec."Ship-to Code" then begin
                Job_lRec.Reset();
                Job_lRec.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
                Job_lRec.SetRange("Ship-to Code", Rec."Ship-to Code");
                Job_lRec.SetFilter(Status, '<>%1', Job_lRec.Status::Completed);
                if ShipToAddress_lRec.Get(Rec."Sell-to Customer No.", Rec."Ship-to Code") then
                    ShipToAddress_lTex := ShipToAddress_lRec.Name;
                if Job_lRec.FindFirst() then begin
                    if not Confirm('Project already exist with same Customer No. %1 and Ship-To Address %2.\Do you still want to change the Ship-To Address?', false, Rec."Sell-to Customer No.", ShipToAddress_lTex) then
                        Error('');
                end;
            end;
            // end;
        end;
        // Error('Simple');
    end;

    [EventSubscriber(ObjectType::Page, page::"Job Card", OnAfterValidateEvent, ShippingOptions, false, false)]
    local procedure "JobCard_ShippingOptions_OnAfterValidateEvent"(var Rec: Record Job; var xRec: Record Job)
    var
        JobPlanningLines: Record "Job Planning Line";
        ShipToAddrress: Record "Ship-to Address";
        Customer: Record Customer;
        Job_lRec: Record Job;
        ShipToAddress_lRec: Record "Ship-to Address";
        ShipToAddress_lTex: Text[100];
    begin
        // if CurrFieldNo = 0 then
        //     exit;
        if (Rec."Ship-to Code" <> '') then begin
            // Rec.GetHideValidationDialog() then 
            // if (xRec."No." <> '') then begin
            if Rec."Ship-to Code" <> xRec."Ship-to Code" then begin
                Job_lRec.Reset();
                Job_lRec.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
                Job_lRec.SetRange("Ship-to Code", Rec."Ship-to Code");
                Job_lRec.SetFilter(Status, '<>%1', Job_lRec.Status::Completed);
                if ShipToAddress_lRec.Get(Rec."Sell-to Customer No.", Rec."Ship-to Code") then
                    ShipToAddress_lTex := ShipToAddress_lRec.Name;
                if Job_lRec.FindFirst() then begin
                    if not Confirm('Project already exist with same Customer No. %1 and Ship-To Address %2.\Do you still want to change the Ship-To Address?', false, Rec."Sell-to Customer No.", ShipToAddress_lTex) then
                        Error('');
                end;
            end;
            // end;
        end;
        // Error('Simple');
    end;


    //     [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromPurchHeader, '', false, false)]
    //     local procedure "Gen. Journal Line_OnAfterCopyGenJnlLineFromPurchHeader"(PurchaseHeader: Record "Purchase Header"; var GenJournalLine: Record "Gen. Journal Line")
    // trigget onaction
    //     var
    //         Sales_lREc: Record "Sales Line";
    //     begin
    //         Sales_lREc.SetRange("Document Type", rec.Document Type");
    //     Sales_lREc.SetRange(document no, rec.document no);
    //         if Sales_lREc.FindFirst() then begin
    //             Sales_lREc.Validate(Description, Sales_lREc.Description + ' ' + Sales_lREc.Description);
    //         end;
    //     end;

    // [EventSubscriber(ObjectType::Table, Database::Customer, OnBeforeModifyEvent, '', true, true)]
    // local procedure T18_OnBeforeModifyEvent(RunTrigger: Boolean; var Rec: Record Customer; var xRec: Record Customer)
    // var
    // begin
    //     If (Rec."Is Generic Customer") THEN
    //         IF (Rec."VAT Registration No." <> xRec."VAT Registration No.") then
    //             Rec.Validate("VAT Registration No.", '');
    // end;



    [EventSubscriber(ObjectType::Page, Page::"Job Card", 'OnClosePageEvent', '', true, true)]
    local procedure P88_OnClosePageEvent(var Rec: Record Job)
    var
        SingleInstance_Cu: Codeunit SingleInstance_CU;
        JobRec: Record Job;
        JobCardPage: Page "Job Card";
        JobNo: Code[20];
    begin
        SingleInstance_Cu.GetNewyCreatedJob(JobNo);
        If JobNo = '' then
            exit;
        JobRec.Reset();
        JobRec.SetRange("No.", JobNo);
        SingleInstance_Cu.ClearNewlyCreatedJobNo();
        JobCardPage.SetTableView(JobRec);
        JobCardPage.Run();
    end;




    [EventSubscriber(ObjectType::Table, database::"Sales Header", OnAfterValidateEvent, "VAT Registration No.", false, false)]
    local procedure P41_VATRegistrationNo_OnBeforeActionEvent(CurrFieldNo: Integer; var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    var
        Customer_lRec: Record Customer;
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get();
        case GLSetup."Bill-to/Sell-to VAT Calc." of
            GLSetup."Bill-to/Sell-to VAT Calc."::"Bill-to/Pay-to No.":
                if not Customer_lRec.Get(Rec."Bill-to Customer No.") then
                    exit;
            GLSetup."Bill-to/Sell-to VAT Calc."::"Sell-to/Buy-from No.":
                if not Customer_lRec.Get(Rec."Sell-to Customer No.") then
                    exit;
        end;
        if Customer_lRec."Is Generic Customer" then begin
            Customer_lRec."VAT Registration No." := '';
            Customer_lRec.Modify(true);
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromSalesHeader, '', false, false)]
    local procedure "Gen. Journal Line_OnAfterCopyGenJnlLineFromSalesHeader"(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Job No." := SalesHeader."Job No";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnPostGLAccOnAfterInitGLEntry, '', false, false)]
    local procedure "Gen. Jnl.-Post Line_OnPostGLAccOnAfterInitGLEntry"(var Sender: Codeunit "Gen. Jnl.-Post Line"; var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
    begin
        GLEntry."Job No." := GenJournalLine."Job No.";
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnAfterInitCustLedgEntry, '', false, false)]
    local procedure "Gen. Jnl.-Post Line_OnAfterInitCustLedgEntry"(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line"; var GLRegister: Record "G/L Register")
    begin
        CustLedgerEntry."Job No." := GenJournalLine."Job No.";
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Check Line", OnBeforeCheckJobNoIsEmpty, '', false, false)]
    local procedure "Gen. Jnl.-Check Line_OnBeforeCheckJobNoIsEmpty"(var Sender: Codeunit "Gen. Jnl.-Check Line"; GenJnlLine: Record "Gen. Journal Line"; var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnBeforeMessageIfSalesLinesExist, '', true, true)]
    local procedure OnBeforeMessageIfSalesLinesExist(var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, "Customer Price Group", true, true)]
    local procedure OnAfterValidateEventCustomerPriceGroup(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
    begin
        // Error('Error');
        Message('Message');
        SalesLine.reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Line No.", '<>%1', 0);
        // If SalesLine."Line No." = 0 then
        //     exit;

        if Rec."Customer Price Group" <> xRec."Customer Price Group" then begin
            If SalesLine.FindSet() then begin
                repeat
                    SalesLine.Validate("Customer Price Group", Rec."Customer Price Group");
                    SalesLine.Modify(true);
                until SalesLine.Next() = 0;
            end;
        end;

    end;



}
