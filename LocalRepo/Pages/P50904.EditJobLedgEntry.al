page 50904 "Edit Job Ledger Entries"
{
    ApplicationArea = all;
    Caption = 'Edit Job Ledger Entries';
    Permissions = tabledata "Job Ledger Entry" = rd;
    DataCaptionFields = "Job No.";
    PageType = List;
    SourceTable = "Job Ledger Entry";
    SourceTableView = sorting("Job No.", "Posting Date")
                      order(Descending);
    UsageCategory = Administration;
    InsertAllowed = true;
    ModifyAllowed = true;
    Editable = true;
    DeleteAllowed = true;


    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the posting date for the entry.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the type of the entry. There are two types of entries:';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the document number on the job ledger entry.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of the job.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of the related job task.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the type of account to which the job ledger entry is posted.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the description of the job ledger entry.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the vendor''s or customer''s trade type to link transactions made for this business partner with the appropriate general ledger account according to the general posting setup.';
                    Visible = false;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                    Visible = false;
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the posting group that was used when the entry was posted. The value depends on the account type. For inventoriable items, the field contains the Inventory Posting Group. For other account types the field is blank.';
                    Visible = false;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies the variant of the item on the line.';
                    Visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the relevant location code if an item is posted.';
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies which work type the resource applies to. Prices are updated based on this entry.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the quantity that was posted on the entry.';
                }
                field("Direct Unit Cost (LCY)"; Rec."Direct Unit Cost (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the cost, in the local currency, of one unit of the selected item or resource.';
                    Visible = false;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the cost, in LCY, of one unit of the item or resource on the line.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the total cost for the posted entry, in the currency specified for the job.';
                }
                field("Total Cost (LCY)"; Rec."Total Cost (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the total cost of the posted entry in local currency. If you update the job ledger costs for item ledger cost adjustments, this field will be adjusted to include the item cost adjustments.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                }
                field("Unit Price (LCY)"; Rec."Unit Price (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the price, in LCY, of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                    Visible = false;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the value of products on the entry.';
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the line discount amount for the posted entry, in the currency specified for the job.';
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the line discount percent of the posted entry.';
                }
                field("Total Price"; Rec."Total Price")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the total price for the posted entry, in the currency specified for the job.';
                    Visible = false;
                }
                field("Total Price (LCY)"; Rec."Total Price (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the total price (in local currency) of the posted entry.';
                    Visible = false;
                }
                field("Line Amount (LCY)"; Rec."Line Amount (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the value in the local currency of products on the entry.';
                    Visible = false;
                }
                field("Amt. to Post to G/L"; Rec."Amt. to Post to G/L")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the amount that will be posted to the general ledger.';
                    Visible = false;
                }
                field("Amt. Posted to G/L"; Rec."Amt. Posted to G/L")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the amount that has been posted to the general ledger.';
                    Visible = false;
                }
                field("Original Unit Cost"; Rec."Original Unit Cost")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the unit cost for the posted entry at the time of posting, in the currency specified for the job. No item cost adjustments are included.';
                    Visible = false;
                }
                field("Original Unit Cost (LCY)"; Rec."Original Unit Cost (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the unit cost of the posted entry in local currency at the time the entry was posted. It does not include any item cost adjustments.';
                    Visible = false;
                }
                field("Original Total Cost"; Rec."Original Total Cost")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the total cost for the posted entry at the time of posting, in the currency specified for the job. No item cost adjustments are included.';
                    Visible = false;
                }
                field("Original Total Cost (LCY)"; Rec."Original Total Cost (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the total cost of the posted entry in local currency at the time the entry was posted. It does not include any item cost adjustments.';
                    Visible = false;
                }
                field("Original Total Cost (ACY)"; Rec."Original Total Cost (ACY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the total cost of the posted entry in the additional reporting currency at the time of posting. No item cost adjustments are included.';
                    Visible = false;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                    Visible = false;

                    trigger OnDrillDown()
                    var
                        UserMgt: Codeunit "User Management";
                    begin
                        UserMgt.DisplayUserInformation(Rec."User ID");
                    end;
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the source code that specifies where the entry was created.';
                    Visible = false;
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the reason code, a supplementary source code that enables you to trace the entry.';
                    Visible = false;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = ItemTracking;
                    ToolTip = 'Specifies the serial number if the job ledger entry Specifies an item usage that was posted with serial number tracking.';
                    Visible = false;
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ApplicationArea = ItemTracking;
                    ToolTip = 'Specifies the lot number if the job ledger entry Specifies an item usage that was posted with lot number tracking.';
                    Visible = false;
                }
                field("Ledger Entry Type"; Rec."Ledger Entry Type")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the entry type that the job ledger entry is linked to.';
                }
                field("Ledger Entry No."; Rec."Ledger Entry No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the entry number (Resource, Item or G/L) to which the job ledger entry is linked.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
                field(Adjusted; Rec.Adjusted)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies whether a job ledger entry has been modified or adjusted. The value in this field is inserted by the Adjust Cost - Item Entries batch job. The Adjusted check box is selected if applicable.';
                }
                field("DateTime Adjusted"; Rec."DateTime Adjusted")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the time stamp of a job ledger entry adjustment or modification.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies a reference to a combination of dimension values. The actual values are stored in the Dimension Set Entry table.';
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    Visible = Dim1Visible;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    Visible = Dim2Visible;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 3, which is one of dimension codes that you set up in the General Ledger Setup window.';
                    Visible = Dim3Visible;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 4, which is one of dimension codes that you set up in the General Ledger Setup window.';
                    Visible = Dim4Visible;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 5, which is one of dimension codes that you set up in the General Ledger Setup window.';
                    Visible = Dim5Visible;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = Dimensions;

                    ToolTip = 'Specifies the code for Shortcut Dimension 6, which is one of dimension codes that you set up in the General Ledger Setup window.';
                    Visible = Dim6Visible;
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 7, which is one of dimension codes that you set up in the General Ledger Setup window.';
                    Visible = Dim7Visible;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 8, which is one of dimension codes that you set up in the General Ledger Setup window.';
                    Visible = Dim8Visible;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(Processing)

        {
            action("Transfer Data")
            {
                ApplicationArea = All;
                ToolTip = 'Transfewr data to the job ledger entry';
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                Var
                    CustJobCU: Codeunit CustomJobLedEntry;
                begin
                    CustJobCU.JobEntryTransfer();
                end;
            }
        }

    }

    trigger OnOpenPage()
    begin
        SetDimVisibility();
    end;

    var
        Navigate: Page Navigate;
        DimensionSetIDFilter: Page "Dimension Set ID Filter";

    protected var
        Dim1Visible: Boolean;
        Dim2Visible: Boolean;
        Dim3Visible: Boolean;
        Dim4Visible: Boolean;
        Dim5Visible: Boolean;
        Dim6Visible: Boolean;
        Dim7Visible: Boolean;
        Dim8Visible: Boolean;

    local procedure SetDimVisibility()
    var
        DimensionManagement: Codeunit DimensionManagement;
    begin
        DimensionManagement.UseShortcutDims(Dim1Visible, Dim2Visible, Dim3Visible, Dim4Visible, Dim5Visible, Dim6Visible, Dim7Visible, Dim8Visible);
    end;
}