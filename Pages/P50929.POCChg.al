
page 50929 "POC Chg"
{
    ApplicationArea = All;
    Caption = 'POC Chg';
    PageType = List;
    SourceTable = "POC Chg";
    UsageCategory = Lists;
    SaveValues = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    AdditionalSearchTerms = 'SST';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(POCJobNumber; Rec.POCJobNumber)
                {
                    ToolTip = 'Specifies the value of the POCJobNumber field.', Comment = '%';
                }
                field(POCchgJul2015; Rec.POCchgJul2015)
                {
                    ToolTip = 'Specifies the value of the POCchgJul2015 field.', Comment = '%';
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
                    ImportSSTFiles_lCdu.Import_POCChg();
                end;
            }
        }
    }
}
