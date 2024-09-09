
page 50924 Wire
{
    ApplicationArea = All;
    Caption = 'Wire';
    PageType = List;
    SourceTable = Wire;
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
                field(ItemNumber; Rec.ItemNumber)
                {
                    ToolTip = 'Specifies the value of the ItemNumber field.', Comment = '%';
                }
                field(ItemClassCode; Rec.ItemClassCode)
                {
                    ToolTip = 'Specifies the value of the ItemClassCode field.', Comment = '%';
                }
                field(ItemDescr; Rec.ItemDescr)
                {
                    ToolTip = 'Specifies the value of the ItemDescr field.', Comment = '%';
                }
                field(ItemType; Rec.ItemType)
                {
                    ToolTip = 'Specifies the value of the ItemType field.', Comment = '%';
                }
                field(Phase; Rec.Phase)
                {
                    ToolTip = 'Specifies the value of the Phase field.', Comment = '%';
                }
                field("Bill / Sale"; Rec."Bill / Sale")
                {
                    ToolTip = 'Specifies the value of the Bill / Sale field.', Comment = '%';
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
                    ImportSSTFiles_lCdu.Import_Wire();
                end;
            }

        }
    }
}
