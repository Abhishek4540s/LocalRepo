

page 50919 "Invty PriceMethod"
{
    ApplicationArea = All;
    Caption = 'Invty PriceMethod';
    PageType = List;
    SourceTable = "Invty PriceMethod";
    InsertAllowed = false;
    ModifyAllowed = false;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'SST';
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(PriceMth; Rec.PriceMth)
                {
                    ToolTip = 'Specifies the value of the PriceMth field.', Comment = '%';
                }
                field(Price_Method; Rec.Price_Method)
                {
                    ToolTip = 'Specifies the value of the Price_Method field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Import)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = ImportExcel;
                ToolTip = 'Import Data From Excel';

                trigger OnAction();
                var
                    ImportSSTFiles_lCdu: Codeunit "Import SST Files";
                begin

                    ImportSSTFiles_lCdu.ReadExcelSheet();
                    ImportSSTFiles_lCdu.Import_InvtyPriceMethod();
                end;
            }

        }
    }
}
