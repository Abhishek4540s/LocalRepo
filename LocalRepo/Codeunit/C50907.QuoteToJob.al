codeunit 50907 QuoteToJob
{
    var
        Job_gRec: Record Job;
        JobsSetup: Record "Jobs Setup";
        SalesRecievables_lRec: Record "Sales & Receivables Setup";
        SalesHeader: Record "Sales Header";
        ManualEventSubscriber: Codeunit "Manual Event Subscriber";
        ArchiveMgt: Codeunit ArchiveManagement;

    procedure CreateNewCustomer(var SalesHeader_vRec: Record "Sales Header"; var Customer_vRec: Record Customer)
    var
        CustomerTemplate_lRec: Record "Customer Templ.";
        Customer_lRec: Record Customer;
        ModCustomer_lRec: Record Customer;

        IsHandled: Boolean;
        SalesQuote_lPag: Page "Sales Quote";
        ManualEventSuvs_lCdu: Codeunit "Manual Event Subscriber";
    begin
        IsHandled := false;
        if SalesHeader_vRec."Sell-to Customer No." <> '' then begin
            if Customer_vRec.Get(SalesHeader_vRec."Sell-to Customer No.") then begin
                if Customer_vRec."Is Generic Customer" then begin
                    //  CheckModifiedGenToNewCustomer(Customer_vRec);
                    if SalesHeader_vRec.Status = SalesHeader_vRec.Status::Released then begin
                        if Dialog.Confirm('This is generic customer. Do you want to create new customer?', true) then begin
                            CreateCustomerFromTemplate(ModCustomer_lRec, ishandled, CustomerTemplate_lRec.Code);
                            ModCustomer_lRec.Validate("Generic Customer No", Customer_vRec."No.");
                            ModCustomer_lRec.Modify(true);
                            ModifyNewCustomerFromSalesQuote(ModCustomer_lRec, SalesHeader_vRec);
                            ModCustomer_lRec.Modify(true); //true
                            SalesHeader_vRec.SuspendStatusCheck(true);
                            SalesHeader_vRec.SetHideValidationDialog(true);
                            BindSubscription(ManualEventSuvs_lCdu);
                            SalesHeader_vRec.Validate("Generic Customer No", Customer_vRec."No.");
                            SalesHeader_vRec.Validate("Sell-to Customer No.", ModCustomer_lRec."No.");
                            UnbindSubscription(ManualEventSuvs_lCdu);
                            //SalesHeader_vRec."Bill-to Customer No." := ModCustomer_lRec."No.";
                            SalesHeader_vRec.SetHideValidationDialog(false);
                            SalesHeader_vRec.Validate("Sell-to Customer Name 2", ModCustomer_lRec.Name);
                            SalesHeader_vRec.Modify(true);

                            OpenCustomerPage(ModCustomer_lRec);

                            SalesHeader_vRec.SuspendStatusCheck(false);
                        end;
                    end else begin
                        Error('Status should be Released to update customer');
                    end;
                end
                else begin
                    Message('New customer cannot be created against the Customer');
                end;
            end;
        end;
    end;
    // end;

    local procedure CreateCustomerFromTemplate(var Customer: Record Customer; var IsHandled: Boolean; CustomerTemplCode: Code[20]) Result: Boolean
    var
        CustomeTemplMgt_lCdu: Codeunit "Customer Templ. Mgt.";
        CustomerTempl: Record "Customer Templ.";
    begin
        IsHandled := false;
        //CustomeTemplMgt_lCdu.OnBeforeCreateCustomerFromTemplate(Customer, Result, IsHandled);
        if IsHandled then
            exit(Result);

        IsHandled := true;

        if CustomerTemplCode = '' then begin
            if not CustomeTemplMgt_lCdu.SelectCustomerTemplate(CustomerTempl) then
                exit(false);
        end
        else
            CustomerTempl.Get(CustomerTemplCode);
        if CustomerTempl.Code = 'GENERIC CUSTOMER' then begin
            Message('You cannot select GENERIC CUSTOMER template, Please choose another template');
            Error('');
        end;

        Customer.SetInsertFromTemplate(true);
        Customer.Init();
        CustomeTemplMgt_lCdu.InitCustomerNo(Customer, CustomerTempl);
        Customer."Contact Type" := CustomerTempl."Contact Type";
        Customer.Insert(true);
        Customer.SetInsertFromTemplate(false);
        CustomeTemplMgt_lCdu.ApplyCustomerTemplate(Customer, CustomerTempl);
        // CustomeTemplMgt_lCdu.OnAfterCreateCustomerFromTemplate(Customer, CustomerTempl);
        exit(true);
    end;

    procedure UpdateSalesQuote(var ModCustomer_vRec: Record Customer; var SalesHeader_vRec: Record "Sales Header")
    begin
        SalesHeader_vRec.SuspendStatusCheck(true);
        SalesHeader_vRec.Validate("Bill-to Name", ModCustomer_vRec.Name);
        SalesHeader_vRec.Validate("Bill-to Address", ModCustomer_vRec.Address);
        SalesHeader_vRec.Validate("Bill-to Country/Region Code", ModCustomer_vRec."Country/Region Code");
        SalesHeader_vRec.Validate("Bill-to City", ModCustomer_vRec.City);
        SalesHeader_vRec.Validate("Sell-to Address", ModCustomer_vRec.Address);
        SalesHeader_vRec.Validate("Sell-to Country/Region Code", ModCustomer_vRec."Country/Region Code");
        SalesHeader_vRec.Validate("Sell-to City", ModCustomer_vRec.City);
        SalesHeader_vRec.Validate("Sell-to Phone No.", ModCustomer_vRec."Phone No.");
        SalesHeader_vRec.Validate("Sell-to Post Code", ModCustomer_vRec."Post Code");
        SalesHeader_vRec.Validate("Generic Customer No", ModCustomer_vRec."Generic Customer No");
        SalesHeader_vRec.Validate("Sell-to Customer Name", ModCustomer_vRec.Name);
        SalesHeader_vRec.Validate("Customer Posting Group", ModCustomer_vRec."Customer Posting Group");
        SalesHeader_vRec.Validate("Gen. Bus. Posting Group", ModCustomer_vRec."Gen. Bus. Posting Group");
        SalesHeader_vRec.Validate("Payment Terms Code", ModCustomer_vRec."Payment Terms Code");
        SalesHeader_vRec.Modify();
        SalesHeader_vRec.SuspendStatusCheck(false);
        Message('Customer details are updated.');
    end;

    local procedure CheckModifiedGenToNewCustomer(var Customer_vRec: Record Customer)
    var
        Customer_lRec: Record Customer;
    begin
        Customer_lRec.SetRange("Generic Customer No", Customer_vRec."No.");
        If Customer_lRec.FindFirst() then
            Error('New Customer %1 already exist for this Generic Customer', Customer_lRec."No.");
    end;



    local procedure ModifyNewCustomerFromSalesQuote(var ModCustomer_vRec: Record Customer; var SalesHeader_vRec: Record "Sales Header")
    var
        ShipToAddress: Record "Ship-to Address";
        ShippingAgent_lRec: Record "Shipping Agent Services";
    begin
        if not ShippingAgent_lRec.Get(SalesHeader_vRec."Shipping Agent Code", SalesHeader_vRec."Shipping Agent Service Code") then begin
            IF SalesHeader_vRec."Shipping Agent Code" <> '' then begin
                ShippingAgent_lRec.Init();
                ShippingAgent_lRec."Shipping Agent Code" := SalesHeader_vRec."Shipping Agent Code";
                ShippingAgent_lRec.Code := SalesHeader_vRec."Shipping Agent Service Code";
                ShippingAgent_lRec."Shipping Time" := SalesHeader_vRec."Shipping Time";
                ShippingAgent_lRec.Insert(true);
            end;
        end;
        If SalesHeader_vRec."Ship-to Code" <> '' then begin
            ShipToAddress.Init();
            ShipToAddress.Validate("Customer No.", ModCustomer_vRec."No.");
            ShipToAddress.Validate(Code, SalesHeader_vRec."Ship-to Code");
            ShipToAddress.Insert();
            ShipToAddress.Validate(Name, SalesHeader_vRec."Ship-to Name");
            ShipToAddress.Validate(Address, SalesHeader_vRec."Ship-to Address");
            ShipToAddress.Validate("Address 2", SalesHeader_vRec."Ship-to Address 2");
            ShipToAddress.Validate(City, SalesHeader_vRec."Ship-to City");
            ShipToAddress.Validate("Country/Region Code", SalesHeader_vRec."Ship-to Country/Region Code");
            ShipToAddress.Validate(County, SalesHeader_vRec."Ship-to County");
            ShipToAddress.Validate(Contact, SalesHeader_vRec."Ship to Contact");
            ShipToAddress.Validate("Location Code", SalesHeader_vRec."Ship to Location Code");
            ShipToAddress.Validate("Service Zone Code", SalesHeader_vRec."Ship to Service Zone Code");
            ShipToAddress.Validate("Tax Area Code", SalesHeader_vRec."Ship to Tax Area Code");
            ShipToAddress.Validate("Tax Liable", SalesHeader_vRec."Ship to Tax Liable");
            ShipToAddress.Validate("Phone No.", SalesHeader_vRec.PhoneNo);
            ShipToAddress.Validate("E-Mail", SalesHeader_vRec.Email);
            ShipToAddress.Validate("Shipment Method Code", SalesHeader_vRec."Shipment Method Code");
            ShipToAddress.Validate("Shipping Agent Code", SalesHeader_vRec."Shipping Agent Code");
            ShipToAddress.Validate("Shipping Agent Service Code", SalesHeader_vRec."Shipping Agent Service Code");
            ShipToAddress.Modify(true);
        end;
        ModCustomer_vRec.Validate(Name, SalesHeader_vRec."Sell-to Customer Name");
        ModCustomer_vRec.Validate(Name, SalesHeader_vRec."Sell-to Customer Name 2");
        ModCustomer_vRec.Validate("Ship-to Code", SalesHeader_vRec."Ship-to Code");
        ModCustomer_vRec.Validate(Address, SalesHeader_vRec."Sell-to Address");
        ModCustomer_vRec.Validate("Address 2", SalesHeader_vRec."Sell-to Address 2");//SK
        // ModCustomer_vRec.Validate("Primary Contact No.", SalesHeader_vRec."Sell-to Contact No.");//SK


        ModCustomer_vRec.Validate(City, SalesHeader_vRec."Sell-to City");
        ModCustomer_vRec.Validate("Phone No.", SalesHeader_vRec.PhoneNo);
        ModCustomer_vRec.Validate("Mobile Phone No.", SalesHeader_vRec.MobileNo);
        ModCustomer_vRec.Validate("E-Mail", SalesHeader_vRec.Email);
        ModCustomer_vRec.Validate(Contact, SalesHeader_vRec."Contact Name");
        ModCustomer_vRec.Validate("Post Code", SalesHeader_vRec."Sell-to Post Code");
        ModCustomer_vRec.Validate("Country/Region Code", SalesHeader_vRec."Sell-to Country/Region Code");
        ModCustomer_vRec.Validate("Customer Posting Group", SalesHeader_vRec."Customer Posting Group");
        ModCustomer_vRec.Validate("Gen. Bus. Posting Group", SalesHeader_vRec."Gen. Bus. Posting Group");
        ModCustomer_vRec.Validate("Payment Terms Code", SalesHeader_vRec."Payment Terms Code");
        ModCustomer_vRec.Validate("Tax Area Code", SalesHeader_vRec."Tax Area Code");
        ModCustomer_vRec.Validate("Salesperson Code", SalesHeader_vRec."Salesperson Code");
        ModCustomer_vRec.Validate("Language Code", SalesHeader_vRec."Language Code");
        ModCustomer_vRec.Validate("Shipment Method Code", SalesHeader_vRec."Shipment Method Code");
        ModCustomer_vRec.Validate("Shipping Agent Code", SalesHeader_vRec."Shipping Agent Code");
        ModCustomer_vRec.Validate("Invoice Disc. Code", SalesHeader_vRec."Invoice Disc. Code");
        ModCustomer_vRec.Validate("Customer Disc. Group", SalesHeader_vRec."Customer Disc. Group");
        ModCustomer_vRec.Validate(Amount, SalesHeader_vRec.Amount);
        //ModCustomer_vRec.Validate(Comment, SalesHeader_vRec.Comment);
        ModCustomer_vRec.Validate("Payment Method Code", SalesHeader_vRec."Payment Method Code");
        ModCustomer_vRec.Validate("Date Filter", SalesHeader_vRec."Date Filter");
        ModCustomer_vRec.Validate("Prices Including VAT", SalesHeader_vRec."Prices Including VAT");
        ModCustomer_vRec.Validate("Location Code", SalesHeader_vRec."Location Code");
        ModCustomer_vRec.Validate("VAT Registration No.", SalesHeader_vRec."VAT Registration No.");
        ModCustomer_vRec.Validate("Combine Shipments", SalesHeader_vRec."Combine Shipments");
        // ModCustomer_vRec.Validate("No. Series", SalesHeader_vRec."No. Series");
        ModCustomer_vRec.Validate("Tax Liable", SalesHeader_vRec."Tax Liable");
        ModCustomer_vRec.Validate("VAT Bus. Posting Group", SalesHeader_vRec."VAT Bus. Posting Group");
        ModCustomer_vRec.Validate(Reserve, SalesHeader_vRec.Reserve);
        ModCustomer_vRec.Validate("Prepayment %", SalesHeader_vRec."Prepayment %");
        ModCustomer_vRec.Validate("Responsibility Center", SalesHeader_vRec."Responsibility Center");
        ModCustomer_vRec.Validate("Shipping Advice", SalesHeader_vRec."Shipping Advice");
        ModCustomer_vRec.Validate("Shipping Time", SalesHeader_vRec."Shipping Time");
        ModCustomer_vRec."Shipping Agent Service Code" := SalesHeader_vRec."Shipping Agent Service Code";
        ModCustomer_vRec.Validate("Allow Line Disc.", SalesHeader_vRec."Allow Line Disc.");
        ModCustomer_vRec.Validate("Tax Exemption No.", SalesHeader_vRec."Tax Exemption No.");
        ModCustomer_vRec.Validate("CFDI Purpose", SalesHeader_vRec."CFDI Purpose");
        ModCustomer_vRec.Validate("CFDI Relation", SalesHeader_vRec."CFDI Relation");
        ModCustomer_vRec.Validate("Service Zone Code", SalesHeader_vRec."Ship to Service Zone Code");
        //ModCustomer_vRec.Validate("Shipped Not Invoiced", SalesHeader_vRec."Shipped Not Invoiced");
        ModCustomer_vRec.Validate("Global Dimension 1 Code", SalesHeader_vRec."Shortcut Dimension 1 Code");
        ModCustomer_vRec.Validate("Global Dimension 2 Code", SalesHeader_vRec."Shortcut Dimension 2 Code");
        ModCustomer_vRec.Validate("Registration Number", SalesHeader_vRec."Registration Number");
        // ModCustomer_vRec.Validate("Customer Price Group");/
        ModCustomer_vRec.Validate("Price Calculation Method", SalesHeader_vRec."Price Calculation Method");
        ModCustomer_vRec.Validate("Customer Price Group", SalesHeader_vRec."Customer Price Group");
        ModCustomer_vRec.Validate(Reserve, SalesHeader_vRec.Reserve);
        ModCustomer_vRec.Validate("Currency Code", SalesHeader_vRec."Currency Code");

    end;


    local procedure OpenCustomerPage(ModCustomer_vRec: Record Customer)
    var
        CustomerCard_lPag: Page "Customer Card";
    begin
        Clear(CustomerCard_lPag);
        CustomerCard_lPag.SetRecord(ModCustomer_vRec);
        CustomerCard_lPag.Run();
    end;

    procedure MakeJob(var SalesHeader_vRec: Record "Sales Header"; var Customer_vRec: Record Customer)
    var
        CustomerTemplate_lRec: Record "Customer Templ.";
        Customer_lRec: Record Customer;
        ModCustomer_lRec: Record Customer;
        ProjectSetup_lRec: Record "Jobs Setup";

        IsHandled: Boolean;
        SalesQuote_lPag: Page "Sales Quote";
    begin
        ProjectSetup_lRec.Get();
        IsHandled := false;
        if SalesHeader_vRec."Sell-to Customer No." <> '' then begin
            if Customer_vRec.Get(SalesHeader_vRec."Sell-to Customer No.") then begin
                if Customer_vRec."Is Generic Customer" then begin
                    Error('You cannot create Project using generic customer, Kindly use new customer.');
                end else begin
                    // if ProjectSetup_lRec."Restrict Duplicate Project" then
                    //     if SalesHeader_vRec."Ship-to Code" = '' then
                    //         Error('Please select atleast one ship-to code to create a Project');
                    if SalesHeader_vRec."Job No" <> '' then
                        Error('The Project - %1 is already created for this sales quote - SQ1020.', SalesHeader_vRec."Job No", SalesHeader_vRec."No.");
                end;
                CheckExpiredSalesQuotes(SalesHeader_vRec);
            end;
        end;
    end;

    local procedure CheckExpiredSalesQuotes(var SalesHeader_vRec: Record "Sales Header")
    var
        SalesRecievables: Record "Sales & Receivables Setup";
    begin
        SalesRecievables.Get();
        If (SalesHeader_vRec."Quote Valid Until Date" <> 0D) and (SalesHeader_vRec."Quote Valid Until Date" < WorkDate) then begin
            IF SalesRecievables."Restrict Expired Quote" then begin
                If Dialog.Confirm('Sales Quote %1 is expired. Do you still want to convert it into Project?', true, SalesHeader_vRec."No.") then
                    CheckDuplicateJobAndCreateJob(SalesHeader_vRec);
            end else
                CheckDuplicateJobAndCreateJob(SalesHeader_vRec);
        end else
            CheckDuplicateJobAndCreateJob(SalesHeader_vRec);
    end;

    local procedure CheckDuplicateJobAndCreateJob(var SalesHeader_vRec: Record "Sales Header")
    var
        Job_lRec: Record Job;
        ShipToAddress_lTex: Text[100];
        ShipToAddress_lRec: Record "Ship-to Address";
        ProjectSetup_lRec: Record "Jobs Setup";
    begin
        ProjectSetup_lRec.Get();
        If SalesHeader_vRec.Status = SalesHeader_vRec.Status::Released then begin
            CheckBillingLine(SalesHeader_vRec);
            Job_lRec.Reset();
            Job_lRec.SetRange("Sell-to Customer No.", SalesHeader_vRec."Sell-to Customer No.");
            Job_lRec.SetRange("Ship-to Code", SalesHeader_vRec."Ship-to Code");
            if ShipToAddress_lRec.Get(SalesHeader_vRec."Sell-to Customer No.", SalesHeader_vRec."Ship-to Code") then
                ShipToAddress_lTex := ShipToAddress_lRec.Name;
            if Job_lRec.FindFirst() then begin
                if ProjectSetup_lRec."Restrict Duplicate Project" then begin
                    if SalesHeader_vRec."Ship-to Code" <> '' then begin
                        if Confirm('Project already exist with same Customer No. %1 and Ship-To Code %2. \Do you still want to create new project?', false, SalesHeader_vRec."Sell-to Customer No.", SalesHeader_vRec."Ship-to Code") then
                            CreateJobFromSalesHeader(SalesHeader_vRec)
                    end
                    else If Confirm('Do you want to create Project?', true) then
                        CreateJobFromSalesHeader(SalesHeader_vRec);
                end
                else
                    If Confirm('Do you want to create Project?', true) then
                        CreateJobFromSalesHeader(SalesHeader_vRec);
            end
            else
                If Confirm('Do you want to create Project?', true) then
                    CreateJobFromSalesHeader(SalesHeader_vRec);
        end
        else
            Error('Status must be Released!');

    end;



    local procedure CreateJobFromSalesHeader(var SalesHeader_vRec: Record "Sales Header")
    var
        SalesHeader_lRec: Record "Sales Header";
        NoSeries: Codeunit "No. Series";
        NextNo: Code[20];
        Customer_lRec: Record Customer;
        contact_lRec: Record Contact;
        ManualSubscriber_CU: Codeunit "Manual Event Subscriber";
    begin

        Job_gRec.RESET;
        Job_gRec.INIT;
        JobsSetup.Get();
        NextNo := NoSeries.GetNextNo(JobsSetup."Job Nos.", WorkDate, true);
        Job_gRec."No. Series" := JobsSetup."Job Nos.";
        Job_gRec."No." := NextNo;
        Job_gRec.Validate("Sales Qoute No", SalesHeader_vRec."No.");
        Job_gRec.Insert(true);
        Job_gRec.SetHideValidationDialog(true);
        Job_gRec.Validate("Salesperson Code", SalesHeader_vRec."Salesperson Code");
        Job_gRec.Validate("Sell-to Customer No.", SalesHeader_vRec."Sell-to Customer No.");
        Job_gRec.Validate("Bill-to Customer No.", SalesHeader_vRec."Sell-to Customer No.");
        Job_gRec.Validate(Description, Job_gRec."No.");
        Job_gRec.Validate("External Document No.", SalesHeader_vRec."External Document No.");
        Job_gRec.Validate("Sell-to Contact No.", SalesHeader_vRec."Sell-to Contact No.");
        Job_gRec.Validate("Sell-to Contact", SalesHeader_vRec."Sell-to Contact");
        // BindSubscription(ManualSubscriber_CU);
        Job_gRec.Validate("Ship-to Code", SalesHeader_vRec."Ship-to Code");
        Job_gRec.Validate("Your Reference", SalesHeader_vRec."Your Reference");
        Job_gRec.Validate("Location Code", SalesHeader_vRec."Location Code");
        Job_gRec.Validate("Global Dimension 1 Code", SalesHeader_vRec."Shortcut Dimension 1 Code");
        Job_gRec.Validate("Global Dimension 2 Code", SalesHeader_vRec."Shortcut Dimension 2 Code");
        Job_gRec.Validate("Price Calculation Method", SalesHeader_vRec."Price Calculation Method");
        Job_gRec.Validate("Customer Price Group", SalesHeader_vRec."Customer Price Group");
        Job_gRec.Validate(Reserve, SalesHeader_vRec.Reserve);
        Job_gRec.Validate("Currency Code", SalesHeader_vRec."Currency Code");
        if Customer_lRec.Get(SalesHeader_vRec."Sell-to Customer No.") then
            if contact_lRec.Get(Customer_lRec."Primary Contact No.") then begin
                Job_gRec.Validate("Sell-to Contact No.", contact_lRec."No.");
            end;
        Job_gRec.SetHideValidationDialog(false);
        Job_gRec.Modify(true);
        // UnbindSubscription(ManualSubscriber_CU);


        InsertJobNoToSalesQuote(SalesHeader_vRec);
        CreateJobLinesfromSaleslines(SalesHeader_vRec, Job_gRec);
        SalesHeader_lRec.Reset();
        SalesHeader_lRec.SetRange("Document Type", SalesHeader_vRec."Document Type");
        SalesHeader_lRec.SetRange("No.", SalesHeader_vRec."No.");
        SalesHeader_lRec.FindFirst();
        ArchiveProjectAffiliatedSalesQuote(SalesHeader_lRec);
        OpenJobPage(Job_gRec);

    end;

    procedure OpenJobPage(var Job_vRec: Record Job)
    var
        JobPag: Page "Job Card";
        OpenPage: Boolean;
        OpenNewInvoiceQst: Label 'The Sales Quote is converted into Project %1.Do you want to open this Project ?', Comment = '%1 = No. of the new Job document.';
    begin
        OpenPage := Confirm(StrSubstNo(OpenNewInvoiceQst, Job_vRec."No."), true);
        if OpenPage then begin
            Clear(JobPag);
            JobPag.SetRecord(Job_vRec);
            JobPag.Run();
        end;
    end;

    local procedure InsertJobNoToSalesQuote(var SalesHeader_vRec: Record "Sales Header")
    begin
        SalesHeader_vRec.Validate("Job No", Job_gRec."No.");
        SalesHeader_vRec.Modify();
    end;

    local procedure CreateJobLinesfromSaleslines(SalesHeader_vRec: Record "Sales Header"; Job_gRec: Record Job)
    var
        SalesLines_lRec: Record "Sales Line";
    begin
        SalesLines_lRec.Reset();
        SalesLines_lRec.SetRange("Document Type", SalesHeader_vRec."Document Type");
        SalesLines_lRec.SetRange("Document No.", SalesHeader_vRec."No.");
        if SalesLines_lRec.FindSet() then begin
            repeat
                InsetJobTaskLines(SalesLines_lRec, Job_gRec);
            until SalesLines_lRec.Next() = 0;
        end;
    end;

    local procedure CheckBillingLine(SalesHeader_vRec: Record "Sales Header")
    var
        SalesLines_lRec: Record "Sales Line";
    begin
        SalesLines_lRec.Reset();
        SalesLines_lRec.SetRange("Document Type", SalesHeader_vRec."Document Type");
        SalesLines_lRec.SetRange("Document No.", SalesHeader_vRec."No.");
        SalesLines_lRec.SetRange("Billing Line", true);
        if not SalesLines_lRec.FindFirst() then
            Error('Atleast there must be one G/L account line type which is selected as billing line to create a project.');
    end;

    local procedure InsetJobTaskLines(SalesLines_lRec: Record "Sales Line"; Job_gRec: Record Job)
    begin
        case SalesLines_lRec.Type of
            SalesLines_lRec.Type::"G/L Account":
                InsertBillingJobTaskLines(SalesLines_lRec, Job_gRec);
            SalesLines_lRec.Type::Item:
                InsertMaterialJobTaskLines(SalesLines_lRec, Job_gRec);
            SalesLines_lRec.Type::Resource:
                InsertLaborJobTaskLInes(SalesLines_lRec, Job_gRec);
        end;
        InsertTotalLine(SalesLines_lRec, Job_gRec)
    end;

    local procedure InsertBillingJobTaskLines(SalesLines_lRec: Record "Sales Line"; Job_gRec: Record Job)
    var
        JobTask_lRec: Record "Job Task";
    begin
        if not JobTask_lRec.Get(Job_gRec."No.", '100') then begin
            JobTask_lRec.Reset();
            JobTask_lRec.Init();
            // JobTask_lRec.SetHideValidationDialog(true);
            JobTask_lRec.Validate("Job No.", Job_gRec."No.");
            JobTask_lRec.Validate("Job Task No.", '100');
            JobTask_lRec.Insert(true);
            JobTask_lRec.Validate(Description, 'Billable');
            JobTask_lRec.Validate("Job Task Type", JobTask_lRec."Job Task Type"::Posting);
            JobTask_lRec.Validate("Location Code", SalesLines_lRec."Location Code");
            JobTask_lRec.modify(true);
        end;
        if SalesLines_lRec."Billing Line" then
            InsertBillingJobPlanningLines(SalesLines_lRec, JobTask_lRec)
        else
            InsertBillingJobPlanningLines1(SalesLines_lRec, JobTask_lRec)

    end;

    local procedure InsertMaterialJobTaskLines(SalesLines_lRec: Record "Sales Line"; Job_gRec: Record Job)
    var
        JobTask_lRec: Record "Job Task";
    begin
        if not JobTask_lRec.Get(Job_gRec."No.", '300') then begin
            JobTask_lRec.Reset();
            JobTask_lRec.Init();
            JobTask_lRec.Validate("Job No.", Job_gRec."No.");
            JobTask_lRec.Validate("Job Task No.", '300');
            JobTask_lRec.Insert(true);
            JobTask_lRec.Validate(Description, 'Material');
            JobTask_lRec.Validate("Job Task Type", JobTask_lRec."Job Task Type"::Posting);
            JobTask_lRec.modify(true);
        end;
        InsertMaterialJobPlanningLines(SalesLines_lRec, JobTask_lRec);
    end;

    local procedure InsertLaborJobTaskLInes(SalesLines_lRec: Record "Sales Line"; Job_gRec: Record Job)
    var
        JobTask_lRec: Record "Job Task";
    begin
        if not JobTask_lRec.Get(Job_gRec."No.", '200') then begin
            JobTask_lRec.Reset();
            JobTask_lRec.Init();
            JobTask_lRec.Validate("Job No.", Job_gRec."No.");
            JobTask_lRec.Validate("Job Task No.", '200');
            JobTask_lRec.Insert(true);
            JobTask_lRec.Validate(Description, 'Labour');
            JobTask_lRec.Validate("Job Task Type", JobTask_lRec."Job Task Type"::Posting);
            JobTask_lRec.modify(true);
        end;
        InsertLaborJobPlanningLines(SalesLines_lRec, JobTask_lRec);
    end;

    local procedure InsertTotalLine(SalesLines_lRec: Record "Sales Line"; Job_gRec: Record Job)
    var
        JobTask_lRec: Record "Job Task";
    begin
        if not JobTask_lRec.Get(Job_gRec."No.", '400') then begin
            JobTask_lRec.Reset();
            JobTask_lRec.Init();
            JobTask_lRec.Validate("Job No.", Job_gRec."No.");
            JobTask_lRec.Validate("Job Task No.", '400');
            JobTask_lRec.Insert(true);
            JobTask_lRec.Validate("Job Task Type", JobTask_lRec."Job Task Type"::Total);
            JobTask_lRec.Validate(Totaling, '100..300');
            JobTask_lRec.modify(true);
        end;
    end;

    local procedure InsertBillingJobPlanningLines(SalesLines_lRec: Record "Sales Line"; JobTask_lRec: Record "Job Task")
    var
        JobPlanning_lRec: Record "Job Planning Line";
        LineNo_lInt: Integer;
    begin
        JobPlanning_lRec.Reset();
        JobPlanning_lRec.Init();
        JobPlanning_lRec.SetRange("Job No.", JobTask_lRec."Job No.");
        JobPlanning_lRec.SetRange("Job Task No.", JobTask_lRec."Job Task No.");
        if JobPlanning_lRec.FindLast() then
            LineNo_lInt := JobPlanning_lRec."Line No." + 10000
        else
            LineNo_lInt := 10000;
        JobPlanning_lRec.Validate("Job No.", JobTask_lRec."Job No.");
        JobPlanning_lRec.Validate("Job Task No.", JobTask_lRec."Job Task No.");
        JobPlanning_lRec.Validate("Line No.", LineNo_lInt);
        JobPlanning_lRec.Insert(true);
        JobPlanning_lRec.Validate(Description, SalesLines_lRec.Description);
        JobPlanning_lRec.Validate(Type, JobPlanning_lRec.Type::"G/L Account");
        JobPlanning_lRec.Validate("No.", SalesLines_lRec."No.");
        JobPlanning_lRec.Validate(Quantity, SalesLines_lRec.Quantity);
        JobPlanning_lRec.Validate("Unit Price (LCY)", SalesLines_lRec."Unit Price");
        JobPlanning_lRec.Validate("Unit Price", SalesLines_lRec."Unit Price");
        JobPlanning_lRec.Validate("Unit Cost (LCY)", SalesLines_lRec."Unit Cost (LCY)");
        JobPlanning_lRec.Validate("Unit Cost", SalesLines_lRec."Unit Cost");
        JobPlanning_lRec.validate("Location Code", SalesLines_lRec."Location Code");
        JobPlanning_lRec.Validate("Line Type", JobPlanning_lRec."Line Type"::Billable);
        JobPlanning_lRec.Validate("Planning Date", 0D);
        JobPlanning_lRec.Validate("Planned Delivery Date", 0D);
        JobPlanning_lRec.Validate("Salesperson Code", SalesLines_lRec."Salesperson Code");
        JobPlanning_lRec.Validate("Tax Group Code", SalesLines_lRec."Tax Group Code");
        JobPlanning_lRec.Modify(true);
    end;

    local procedure InsertBillingJobPlanningLines1(SalesLines_lRec: Record "Sales Line"; JobTask_lRec: Record "Job Task")
    var
        JobPlanning_lRec: Record "Job Planning Line";
        LineNo_lInt: Integer;
    begin
        JobPlanning_lRec.Reset();
        JobPlanning_lRec.Init();
        JobPlanning_lRec.SetRange("Job No.", JobTask_lRec."Job No.");
        JobPlanning_lRec.SetRange("Job Task No.", JobTask_lRec."Job Task No.");
        if JobPlanning_lRec.FindLast() then
            LineNo_lInt := JobPlanning_lRec."Line No." + 10000
        else
            LineNo_lInt := 10000;
        JobPlanning_lRec.Validate("Job No.", JobTask_lRec."Job No.");
        JobPlanning_lRec.Validate("Job Task No.", JobTask_lRec."Job Task No.");
        JobPlanning_lRec.Validate("Line No.", LineNo_lInt);
        JobPlanning_lRec.Insert(true);
        JobPlanning_lRec.Validate(Description, SalesLines_lRec.Description);
        JobPlanning_lRec.Validate(Type, JobPlanning_lRec.Type::"G/L Account");
        JobPlanning_lRec.Validate("No.", SalesLines_lRec."No.");
        JobPlanning_lRec.Validate(Quantity, SalesLines_lRec.Quantity);
        JobPlanning_lRec.Validate("Unit Price (LCY)", SalesLines_lRec."Unit Price");
        JobPlanning_lRec.Validate("Unit Price", SalesLines_lRec."Unit Price");
        JobPlanning_lRec.Validate("Unit Cost (LCY)", SalesLines_lRec."Unit Cost (LCY)");
        JobPlanning_lRec.Validate("Unit Cost", SalesLines_lRec."Unit Cost");
        JobPlanning_lRec.validate("Location Code", SalesLines_lRec."Location Code");
        JobPlanning_lRec.Validate("Line Type", JobPlanning_lRec."Line Type"::Budget);
        JobPlanning_lRec.Validate("Planning Date", 0D);
        JobPlanning_lRec.Validate("Planned Delivery Date", 0D);
        JobPlanning_lRec.Validate("Salesperson Code", SalesLines_lRec."Salesperson Code");
        JobPlanning_lRec.Validate("Tax Group Code", SalesLines_lRec."Tax Group Code");
        JobPlanning_lRec.Modify(true);
    end;

    local procedure InsertMaterialJobPlanningLines(SalesLines_lRec: Record "Sales Line"; JobTask_lRec: Record "Job Task")
    var
        JobPlanning_lRec: Record "Job Planning Line";
        LineNo_lInt: Integer;
    begin
        JobPlanning_lRec.Reset();
        JobPlanning_lRec.Init();
        JobPlanning_lRec.SetRange("Job No.", JobTask_lRec."Job No.");
        JobPlanning_lRec.SetRange("Job Task No.", JobTask_lRec."Job Task No.");
        if JobPlanning_lRec.FindLast() then
            LineNo_lInt := JobPlanning_lRec."Line No." + 10000
        else
            LineNo_lInt := 10000;
        JobPlanning_lRec.Validate("Job No.", JobTask_lRec."Job No.");
        JobPlanning_lRec.Validate("Job Task No.", JobTask_lRec."Job Task No.");
        JobPlanning_lRec.Validate("Line No.", LineNo_lInt);
        JobPlanning_lRec.Insert(true);
        JobPlanning_lRec.Validate(Description, SalesLines_lRec.Description);
        JobPlanning_lRec.Validate(Type, JobPlanning_lRec.Type::Item);
        JobPlanning_lRec.Validate("No.", SalesLines_lRec."No.");
        JobPlanning_lRec.Validate(Quantity, SalesLines_lRec.Quantity);
        JobPlanning_lRec.Validate("Unit Cost (LCY)", SalesLines_lRec."Unit Cost (LCY)");
        JobPlanning_lRec.Validate("Unit Cost", SalesLines_lRec."Unit Cost");
        JobPlanning_lRec.validate("Location Code", SalesLines_lRec."Location Code");
        JobPlanning_lRec.Validate("Line Type", JobPlanning_lRec."Line Type"::Budget);
        JobPlanning_lRec.Validate("Unit Price (LCY)", 0);
        JobPlanning_lRec.Validate("Unit Price", 0);
        JobPlanning_lRec.Validate("Planning Date", 0D);
        JobPlanning_lRec.Validate("Planned Delivery Date", 0D);
        JobPlanning_lRec.Validate("Salesperson Code", SalesLines_lRec."Salesperson Code");
        JobPlanning_lRec.Validate("Tax Group Code", SalesLines_lRec."Tax Group Code");
        JobPlanning_lRec.Modify(true);
    end;

    local procedure InsertLaborJobPlanningLines(SalesLines_lRec: Record "Sales Line"; JobTask_lRec: Record "Job Task")
    var
        JobPlanning_lRec: Record "Job Planning Line";
        LineNo_lInt: Integer;
        codeunitCust_jj: Codeunit "Feature Management Facade";
    begin
        JobPlanning_lRec.Reset();
        JobPlanning_lRec.Init();
        JobPlanning_lRec.SetRange("Job No.", JobTask_lRec."Job No.");
        JobPlanning_lRec.SetRange("Job Task No.", JobTask_lRec."Job Task No.");
        if JobPlanning_lRec.FindLast() then
            LineNo_lInt := JobPlanning_lRec."Line No." + 10000
        else
            LineNo_lInt := 10000;
        JobPlanning_lRec.Validate("Job No.", JobTask_lRec."Job No.");
        JobPlanning_lRec.Validate("Job Task No.", JobTask_lRec."Job Task No.");
        JobPlanning_lRec.Validate("Line No.", LineNo_lInt);
        JobPlanning_lRec.Insert(true);
        JobPlanning_lRec.Validate(Description, SalesLines_lRec.Description);
        JobPlanning_lRec.Validate(Type, JobPlanning_lRec.Type::Resource);
        JobPlanning_lRec.Validate("No.", SalesLines_lRec."No.");
        JobPlanning_lRec.Validate(Quantity, SalesLines_lRec.Quantity);
        JobPlanning_lRec.Validate("Unit Cost (LCY)", SalesLines_lRec."Unit Cost (LCY)");
        JobPlanning_lRec.Validate("Unit Cost", SalesLines_lRec."Unit Cost");
        JobPlanning_lRec.validate("Location Code", SalesLines_lRec."Location Code");
        JobPlanning_lRec.Validate("Line Type", JobPlanning_lRec."Line Type"::Budget);
        JobPlanning_lRec.Validate("Unit Price (LCY)", 0);
        JobPlanning_lRec.Validate("Unit Price", 0);
        JobPlanning_lRec.Validate("Planning Date", 0D);
        JobPlanning_lRec.Validate("Planned Delivery Date", 0D);
        JobPlanning_lRec.Validate("Salesperson Code", SalesLines_lRec."Salesperson Code");
        JobPlanning_lRec.Validate("Tax Group Code", SalesLines_lRec."Tax Group Code");
        JobPlanning_lRec.Modify(true);
    end;


    procedure ArchiveProjectAffiliatedSalesQuote(var SalesHeader_vRec: Record "Sales Header")
    var
        MarkSalesHeader: Record "Sales Header";
        Count_lInt: Integer;
        TotalCnt: Integer;
        WinDlg: Dialog;
    begin
        IF not Confirm('Do you want to Archive the selected Sales Quotes?', true) then
            exit;
        WinDlg.Open('#1###################\#2##################\#3###################');
        WinDlg.Update(1, 'Archiving...');
        WinDlg.Update(2, 'Total: ' + FORMAT(TotalCnt));
        Count_lInt := 0;
        TotalCnt := SalesHeader_vRec.Count;
        SalesHeader_vRec.SetFilter("Job No", '<>%1', '');
        if SalesHeader_vRec.FindSet() then begin
            repeat
                MarkSalesHeader.SetRange("Document Type", SalesHeader_vRec."Document Type");
                MarkSalesHeader.SetRange("No.", SalesHeader_vRec."No.");
                MarkSalesHeader.FindFirst();
                MarkSalesHeader.Mark(true);
            until SalesHeader_vRec.Next() = 0;
        end;
        SalesHeader_vRec.SetRange("Job No");
        SalesHeader_vRec.SetFilter("Quote Valid Until Date", '<>%1&<%2', 0D, WorkDate());
        IF SalesHeader_vRec.FindSet() then
            repeat
                MarkSalesHeader.SetRange("Document Type", SalesHeader_vRec."Document Type");
                MarkSalesHeader.SetRange("No.", SalesHeader_vRec."No.");
                MarkSalesHeader.FindFirst();
                MarkSalesHeader.Mark(true);
            until SalesHeader_vRec.Next() = 0;

        MarkSalesHeader.SetRange("Document Type");
        MarkSalesHeader.SetRange("No.");
        MarkSalesHeader.MarkedOnly(true);
        IF MarkSalesHeader.FindSet() then
            repeat
                Count_lInt += 1;
                WinDlg.Update(3, 'Current' + FORMAT(Count_lInt));
                ArchiveMgt.StoreSalesDocument(MarkSalesHeader, false);
            until MarkSalesHeader.Next() = 0;

        WinDlg.Update(1, 'Deleting Sales Quote');
        WinDlg.Update(2, '');
        WinDlg.Update(3, '');
        BindSubscription(ManualEventSubscriber);
        IF MarkSalesHeader.FindSet() then
            repeat
                MarkSalesHeader.DeleteAllSalesLines();
                MarkSalesHeader.Delete();
            until MarkSalesHeader.Next() = 0;
        UnbindSubscription(ManualEventSubscriber);
        WinDlg.Close();
        Message('%1 of %2 documents have been archived.', Count_lInt, TotalCnt);
    end;

}