


page 50920 SOPStatus
{
    ApplicationArea = All;
    Caption = 'SOPStatus';
    PageType = List;
    SourceTable = SOPStatus;
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
                field(GVSOPstatus; Rec.GVSOPstatus)
                {
                    ToolTip = 'Specifies the value of the GVSOPstatus field.', Comment = '%';
                }
                field(SOPStatusDescr; Rec.SOPStatusDescr)
                {
                    ToolTip = 'Specifies the value of the SOPStatusDescr field.', Comment = '%';
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
                    ImportSSTFiles_lCdu.Import_SOPStatus();
                end;
            }

        }
    }
}
