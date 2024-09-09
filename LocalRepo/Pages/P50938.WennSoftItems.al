page 50938 WennSoft_Items
{
    ApplicationArea = All;
    Caption = 'WennSoft Items';
    PageType = List;
    SourceTable = WennSoftItems;
    AdditionalSearchTerms = 'WennSoft';
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ITEMNMBR; Rec.ITEMNMBR)
                {
                    ApplicationArea = All;
                }
                field("Item Desc."; Rec."Item Desc.")
                {
                    ApplicationArea = All;
                }
                field("Short Desc."; Rec."Short Desc.")
                {
                    ApplicationArea = All;
                }
                field("Generic Desc."; Rec."Generic Desc.")
                {
                    ApplicationArea = All;
                }
                field("Class ID"; Rec."Class ID")
                {
                    ApplicationArea = All;
                }
                field("Item Type"; Rec."Item Type")
                {
                    ApplicationArea = All;
                }
                field("Valuation Method"; Rec."Valuation Method")
                {
                    ApplicationArea = All;
                }
                field("Valuation Method in Text"; Rec."Valuation Method in Text")
                {
                    ApplicationArea = All;
                }
                field("Qty. decimals"; Rec."Qty. decimals")
                {
                    ApplicationArea = All;
                }
                field("Currency Decimals"; Rec."Currency Decimals")
                {
                    ApplicationArea = All;
                }
                field("Sales Tax Options"; Rec."Sales Tax Options")
                {
                    ApplicationArea = All;
                }
                field("Tax Schedule ID-1"; Rec."Tax Schedule ID-1")
                {
                    ApplicationArea = All;
                }
                field("UOM Schedule ID"; Rec."UOM Schedule ID")
                {
                    ApplicationArea = All;
                }
                field("Purchase Tax Options"; Rec."Purchase Tax Options")
                {
                    ApplicationArea = All;
                }
                field("Tax Schedule ID-2"; Rec."Tax Schedule ID-2")
                {
                    ApplicationArea = All;
                }
                field("Std. Cost"; Rec."Std. Cost")
                {
                    ApplicationArea = All;
                }
                field("Current Cost"; Rec."Current Cost")
                {
                    ApplicationArea = All;
                }
                field("List Price"; Rec."List Price")
                {
                    ApplicationArea = All;
                }
                field("Qty. on Hold"; Rec."Qty. on Hold")
                {
                    ApplicationArea = All;
                }
                field("Qty. Available"; Rec."Qty. Available")
                {
                    ApplicationArea = All;
                }
                field("Qty Backorder"; Rec."Qty Backorder")
                {
                    ApplicationArea = All;
                }
                field("Available less backorder"; Rec."Available less backorder")
                {
                    ApplicationArea = All;
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;

                }
                field("File Imported Date"; Rec."File Imported Date")
                {
                    ApplicationArea = All;

                }
                field("File Imported By"; Rec."File Imported By")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("&Import")
            {
                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import data from excel.';
                trigger OnAction()
                var
                    Import_CU: Codeunit ImportJobfiles;
                begin
                    Import_CU.ImportWennSoftItems();
                end;
            }
        }
    }
}