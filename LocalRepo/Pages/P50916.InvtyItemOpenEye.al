

page 50916 "Invty Item OpenEye"
{
    ApplicationArea = All;
    Caption = 'Invty Item OpenEye';
    PageType = List;
    SourceTable = "Invty Item OpenEye";
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
                field(ItemNMBR; Rec.ItemNMBR)
                {
                    ToolTip = 'Specifies the value of the ItemNMBR field.', Comment = '%';
                }
                field(ItemDscr; Rec.ItemDscr)
                {
                    ToolTip = 'Specifies the value of the ItemDscr field.', Comment = '%';
                }
                field(ItemType; Rec.ItemType)
                {
                    ToolTip = 'Specifies the value of the ItemType field.', Comment = '%';
                }
                field(ItemClassCode; Rec.ItemClassCode)
                {
                    ToolTip = 'Specifies the value of the ItemClassCode field.', Comment = '%';
                }
                field(CurrentCost; Rec.CurrentCost)
                {
                    ToolTip = 'Specifies the value of the CurrentCost field.', Comment = '%';
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
                    ImportSSTFiles_lCdu.Import_InvtyItemOpenEye();
                end;
            }
        }
    }

}
