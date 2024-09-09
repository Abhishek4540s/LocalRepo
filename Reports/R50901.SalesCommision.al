
report 50901 SalesCommision
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Salesperson_CommissionV2.rdl';
    ApplicationArea = Suite;
    Caption = 'SST - Salesperson Commission';
    UsageCategory = ReportsAndAnalysis;
    AdditionalSearchTerms = 'SST';
    dataset
    {
        dataitem("Salesperson/Purchaser"; "Salesperson/Purchaser")
        {
            DataItemTableView = sorting(Code);
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Code";
            column(STRSUBSTNO_Text000_PeriodText_; StrSubstNo(PeriodTxt, PeriodText))
            {
            }
            column(COMPANYNAME; COMPANYPROPERTY.DisplayName())
            {
            }
            column(Salesperson_Purchaser__TABLECAPTION__________SalespersonFilter; TableCaption + ': ' + SalespersonFilter)
            {
            }
            column(SalespersonFilter; SalespersonFilter)
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }
            column(Salesperson_Purchaser_Code; Code)
            {
            }
            column(Salesperson_Purchaser_Name; Name)
            {
            }
            column(Salesperson_Purchaser__Commission___; "Commission %")
            {
            }
            column(SalesCommissionAmt; SalesCommissionAmt)
            {
                AutoFormatType = 1;
            }
            column(Salesperson___CommissionCaption; Salesperson___CommissionCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(All_amounts_are_in_LCYCaption; All_amounts_are_in_LCYCaptionLbl)
            {
            }
            column(SalesCommissionAmt_Control32Caption; SalesCommissionAmt_Control32CaptionLbl)
            {
            }
            column(Salesperson_Purchaser__Commission___Caption; FieldCaption("Commission %"))
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Salesperson_Purchaser_CodeCaption; Salesperson_Purchaser_CodeCaptionLbl)
            {
            }
            column(SalesHeader_No_CaptionLbl; SalesHeader_No_CaptionLbl)
            {
            }
            column(SalesHeader_PostingDate_CaptionLbl; SalesHeader_PostingDate_CaptionLbl)
            {
            }
            column(SalesHeader_BillToCustomerNo_CaptionLbl; SalesHeader_BillToCustomerNo_CaptionLbl)
            {
            }
            column(SalesHeader_BillToCustomerName_CaptionLbl; SalesHeader_BillToCustomerName_CaptionLbl)
            {
            }
            column(SalesHeader_Cancel_CaptionLbl; SalesHeader_Cancel_CaptionLbl)
            {
            }
            column(SalesHeader_Corrective_CaptionLbl; SalesHeader_Corrective_CaptionLbl)
            {
            }
            column(SalesHeader_ToAddress_CaptionLbl; SalesHeader_ToAddress_CaptionLbl)
            {
            }
            column(Salesline_DepartmentCode_CaptionLbl; Salesline_DepartmentCode_CaptionLbl)
            {
            }
            column(SalesLineDescription_CaptionLbl; SalesLineDescription_CaptionLbl)
            {
            }
            column(SalesLineItemNo_CaptionLbl; SalesLineItemNo_CaptionLbl)
            {
            }
            column(SalesLineItemType_CaptionLbl; SalesLineItemType_CaptionLbl)
            {
            }
            column(SalesLineQuantity_CaptionLbl; SalesLineQuantity_CaptionLbl)
            {
            }
            column(SalesLineUnitPrice_CaptionLbl; SalesLineUnitPrice_CaptionLbl)
            {
            }
            column(SalesPersonName_CaptionLbl; SalesPersonName_CaptionLbl)
            {
            }
            column(Commission_CaptionLbl; Commission_CaptionLbl)
            {
            }
            column(CommissionPer_CaptionLbl; CommissionPer_CaptionLbl)
            {
            }
            column(SalesAmount_CaptionLbl; SalesAmount_CaptionLbl)
            {
            }

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Salesperson Code" = field(Code);
                DataItemTableView = sorting("No.");

                column(Type; Type)
                {
                }
                column(No_; "No.")
                {
                }
                column("Description"; Description)
                {
                }
                column("Quantity"; Quantity)
                {
                }
                column(Unit_Price; "Unit Price")
                {
                }
                column(Department_Dimension; "Shortcut Dimension 1 Code")
                {
                }
                column(Sales_Amount; SalesAmount)
                {

                }
                column(Commission_Amount; SalesCommissionAmt)
                {
                }
                column(SalesInvHeaderNo; SalesInvHeaderNo)
                {
                }
                column(Posting_Date; PostingDate_)
                {
                }
                column(Bill_to_Customer_No_; "Bill-to Customer No_")
                {
                }
                column(Bill_to_Name; "Bill-to Name")
                {
                }
                column(Bill_to_Address; "Bill-to Address")
                {
                }
                column("Cancel"; "Cancelled")
                {
                }
                column("Corrective"; "Corrective")
                {
                }
                trigger OnAfterGetRecord()
                var
                    SalesInvoiceHeader: Record "Sales Invoice Header";
                begin
                    SalesAmount := Quantity * "Unit Price";
                    SalesCommissionAmt := Round(SalesAmount * "Salesperson/Purchaser"."Commission %" / 100);
                    if SalesInvoiceHeader.Get("Document No.") then begin
                        SalesInvHeaderNo := SalesInvoiceHeader."No.";
                        PostingDate_ := SalesInvoiceHeader."Posting Date";
                        "Bill-to Customer No_" := SalesInvoiceHeader."Bill-to Customer No.";
                        "Bill-to Name" := SalesInvoiceHeader."Bill-to Name";
                        "Bill-to Address" := SalesInvoiceHeader."Bill-to Address";
                        Corrective := SalesInvoiceHeader.Corrective;
                        Cancelled := SalesInvoiceHeader.Cancelled;
                    end;

                end;

                trigger OnPreDataItem()
                begin
                    ClearAmounts();
                end;
            }
            trigger OnAfterGetRecord()
            begin
                if PrintOnlyOnePerPageReq then
                    PageGroupNo := PageGroupNo + 1;
            end;

            trigger OnPreDataItem()
            begin
                PageGroupNo := 1;
                ClearAmounts();
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PrintOnlyOnePerPage; PrintOnlyOnePerPageReq)
                    {
                        ApplicationArea = Suite;
                        Caption = 'New Page per Person';
                        ToolTip = 'Specifies if each person''s information is printed on a new page if you have chosen two or more persons to be included in the report.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
    begin
        SalespersonFilter := "Salesperson/Purchaser".GetFilters();
    end;

    var
        TmpSalesPerson: Record "Salesperson/Purchaser" temporary;
        PeriodTxt: Label 'Period: %1', Comment = '%1 - period text';
        SalespersonFilter: Text;
        PeriodText: Text;
        SalesCommissionAmt: Decimal;
        PrintOnlyOnePerPageReq: Boolean;
        PageGroupNo: Integer;
        Salesperson___CommissionCaptionLbl: Label 'Salesperson - Commission';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        All_amounts_are_in_LCYCaptionLbl: Label 'All amounts are in LCY';
        SalesCommissionAmt_Control32CaptionLbl: Label 'Commission Amount';
        TotalCaptionLbl: Label 'Total';
        SalesAmount: Decimal;
        Salesperson_Purchaser_CodeCaptionLbl: Label 'SalesPer';
        SalesHeader_No_CaptionLbl: Label 'Posted Invoice No.';
        SalesHeader_PostingDate_CaptionLbl: Label 'Posting Date';
        SalesHeader_BillToCustomerNo_CaptionLbl: Label 'Bill To Customer No.';
        SalesHeader_BillToCustomerName_CaptionLbl: Label 'Bill To Customer Name';
        SalesHeader_ToAddress_CaptionLbl: Label 'To Address';
        SalesLineItemType_CaptionLbl: Label 'Item Type';
        SalesLineItemNo_CaptionLbl: Label 'Item No.';
        SalesLineDescription_CaptionLbl: Label 'Description';
        SalesLineQuantity_CaptionLbl: Label 'Quantity';
        SalesLineUnitPrice_CaptionLbl: Label 'Unit Price';
        SalesAmount_CaptionLbl: Label 'Sales Amount';
        SalesPersonName_CaptionLbl: Label 'Salesperson Name';
        CommissionPer_CaptionLbl: Label 'Commission %';
        Commission_CaptionLbl: Label 'Commission';
        SalesHeader_Cancel_CaptionLbl: Label 'Cancel';
        SalesHeader_Corrective_CaptionLbl: Label 'Corrective';
        Salesline_DepartmentCode_CaptionLbl: Label 'Department Code';
        SalesInvHeaderNo: Code[20];
        "Bill-to Name": Text[100];
        "Bill-to Address": Text[100];
        Cancelled: Boolean;
        Corrective: Boolean;
        "Bill-to Customer No_": Code[20];
        PostingDate_: Date;
        SalesPersonPipeFilter: Text;

    local procedure ClearAmounts()
    begin

        Clear(SalesAmount);
        Clear(SalesCommissionAmt);
    end;
}
