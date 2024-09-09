
page 50918 MonthQtr
{
    ApplicationArea = All;
    Caption = 'MonthQtr';
    PageType = List;
    SourceTable = MonthQtr;
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
                field(Month; Rec.Month)
                {
                    ToolTip = 'Specifies the value of the Month field.', Comment = '%';
                }
                field(Qtr; Rec.Qtr)
                {
                    ToolTip = 'Specifies the value of the Qtr field.', Comment = '%';
                }
                field(Qtr_; Rec.Qtr_)
                {
                    ToolTip = 'Specifies the value of the Qtr_ field.', Comment = '%';
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
                    ImportSSTFiles_lCdu.Import_MonthQtr();
                end;
            }
        }
    }
}
