page 50935 "Custom Purchase Order List"
{
    ApplicationArea = all;
    Caption = 'Custom Purchase Orders';
    Editable = true;
    PageType = Worksheet;
    ModifyAllowed = true;
    InsertAllowed = false;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableTemporary = true;
    SourceTableView = where("Document Type" = const(Order));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Create PO"; Rec."Create PO")
                {
                    ApplicationArea = all;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = all;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies a unique number that identifies the purchase order. The number can be generated automatically from a number series, or you can number each of them manually.';
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the vendor who will deliver the goods or services. Each vendor has a unique number to help you track related documents. The number can come from a number series or be added manually.';
                }
                field("Order Address Code"; Rec."Order Address Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the order address of the related vendor.';
                    Visible = false;
                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the name of the vendor that you’re buying from. By default, the same vendor is suggested as the pay-to vendor. If needed, you can specify a different pay-to vendor on the document.';
                }
                field("Vendor Authorization No."; Rec."Vendor Authorization No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the compensation agreement identification number, sometimes referred to as the RMA No. (Returns Materials Authorization).';
                }
                field("Buy-from Post Code"; Rec."Buy-from Post Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the post code of the vendor who delivered the items.';
                    Visible = false;
                }
                field("Buy-from Country/Region Code"; Rec."Buy-from Country/Region Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the city of the vendor who delivered the items.';
                    Visible = false;
                }
                field("Buy-from Contact"; Rec."Buy-from Contact")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the name of the contact person at the vendor who delivered the items.';
                    Visible = false;
                }
                field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the number of the vendor that you received the invoice from.';
                    Visible = false;
                }
                field("Pay-to Name"; Rec."Pay-to Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the name of the vendor who you received the invoice from.';
                    Visible = false;
                }
                field("Pay-to Post Code"; Rec."Pay-to Post Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the post code of the vendor that you received the invoice from.';
                    Visible = false;
                }
                field("Pay-to Country/Region Code"; Rec."Pay-to Country/Region Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the country/region code of the address.';
                    Visible = false;
                }
                field("Pay-to Contact"; Rec."Pay-to Contact")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the name of the person to contact about an invoice from this vendor.';
                    Visible = false;
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.';
                    Visible = false;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the name of the customer at the address that the items are shipped to.';
                    Visible = false;
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the postal code of the address that the items are shipped to.';
                    Visible = false;
                }
                field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the country/region code of the address that the items are shipped to.';
                    Visible = false;
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the name of the contact person at the address that the items are shipped to.';
                    Visible = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the date when the posting of the purchase document will be recorded.';
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies a code for the location where you want the items to be placed when they are received.';
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies which purchaser is assigned to the vendor.';
                    Visible = false;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the code of the currency of the amounts on the purchase lines.';
                    Visible = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                    Visible = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies when the purchase invoice is due for payment.';
                    Visible = false;
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the payment discount percent granted if payment is made on or before the date in the Pmt. Discount Date field.';
                    Visible = false;
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
                    Visible = false;
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the delivery conditions of the related shipment, such as free on board (FOB).';
                    Visible = false;
                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the date that you want the vendor to deliver to the ship-to address. The value in the field is used to calculate the latest date you can order the items to have them delivered on the requested receipt date. If you do not need delivery on a specific date, you can leave the field blank.';
                    Visible = false;
                }
                field("Job Queue Status"; Rec."Job Queue Status")
                {
                    ApplicationArea = all;
                    Style = Unfavorable;
                    StyleExpr = Rec."Job Queue Status" = Rec."Job Queue Status"::ERROR;
                    ToolTip = 'Specifies the status of a job queue entry that handles the posting of purchase orders.';

                    trigger OnDrillDown()
                    var
                        JobQueueEntry: Record "Job Queue Entry";
                    begin
                        if Rec."Job Queue Status" = Rec."Job Queue Status"::" " then
                            exit;
                        JobQueueEntry.ShowStatusMsg(Rec."Job Queue Entry ID");
                    end;
                }
                field("Amount Received Not Invoiced excl. VAT (LCY)"; Rec."A. Rcd. Not Inv. Ex. VAT (LCY)")
                {
                    ApplicationArea = Basic, all;
                    ToolTip = 'Specifies the amount excluding VAT for the items on the order that have been received but are not yet invoiced.';
                    Visible = false;
                }
                field("Amount Received Not Invoiced (LCY)"; Rec."Amt. Rcd. Not Invoiced (LCY)")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the sum, in LCY, for items that have been received but have not yet been invoiced. The value in the Amt. Rcd. Not Invoiced (LCY) field is used for entries in the Purchase Line table of document type Order to calculate and update the contents of this field.';
                    Visible = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the sum of amounts on all the lines in the document. This will include invoice discounts.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the sum of amounts, including VAT, on all the lines in the document. This will include invoice discounts.';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies additional posting information for the document. After you post the document, the description can add detail to vendor and customer ledger entries.';
                    Visible = false;
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the vendor''s reference.';
                    Visible = false;
                }
                field("Vendor Order No."; Rec."Vendor Order No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the vendor''s order number.';
                    Visible = false;
                }
            }
        }

    }

    trigger OnOpenPage()
    begin
        SICodeUnit_gCU.GetOrders(Rec);
        CurrPage.Update();
    end;




    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction IN [Action::LookupOK] then begin
            Rec.SetRange("Create PO", true);
            if Rec.FindSet() then
                repeat
                    POGenerator_GCU.InsertOrder(Rec);
                until Rec.Next() = 0;
            SICodeUnit_gCU.ClearOrder();
        end;

        if CloseAction IN [Action::Cancel, Action::LookupCancel] then
            SICodeUnit_gCU.ClearOrder();

    end;

    var
        SICodeUnit_gCU: Codeunit SingleInstance_CU;
        POGenerator_GCU: Codeunit POGenerator;
}

