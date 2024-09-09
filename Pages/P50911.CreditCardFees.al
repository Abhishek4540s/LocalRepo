
page 50911 "Credit Card Fees"
{
    ApplicationArea = All;
    Caption = 'Credit Card Fees';
    PageType = List;
    SourceTable = "Credit Card Fees";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    AdditionalSearchTerms = 'SST';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Credit_Card; Rec.Credit_Card)
                {
                    ToolTip = 'Specifies the value of the Credit_Card field.', Comment = '%';
                }
                field(CC_Fee_Rate; Rec.CC_Fee_Rate)
                {
                    ToolTip = 'Specifies the value of the CC_Fee_Rate field.', Comment = '%';
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
                    ImportSSTFiles_lCdu: Codeunit "Import SST Files";
                begin
                    ImportSSTFiles_lCdu.ReadExcelSheet();
                    ImportSSTFiles_lCdu.Import_CreditCardFees();
                end;
            }
        }
    }
}
