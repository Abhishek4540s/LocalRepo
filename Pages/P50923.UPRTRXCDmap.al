
page 50923 UPRTRXCDmap
{
    ApplicationArea = All;
    Caption = 'UPRTRXCDmap';
    PageType = List;
    SourceTable = UPRTRXCDmap;
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
                field(GVUPRTRXCD; Rec.GVUPRTRXCD)
                {
                    ToolTip = 'Specifies the value of the GVUPRTRXCD field.', Comment = '%';
                }
                field(Gvcode; Rec.Gvcode)
                {
                    ToolTip = 'Specifies the value of the Gvcode field.', Comment = '%';
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
                    ImportSSTFiles_lCdu.Import_UPRTRXCDmap();
                end;
            }

        }
    }
}
