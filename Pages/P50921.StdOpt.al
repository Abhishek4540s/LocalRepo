
page 50921 StdOpt
{
    ApplicationArea = All;
    Caption = 'StdOpt';
    PageType = List;
    SourceTable = StdOpt;
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
                field(Last2Char; Rec.Last2Char)
                {
                    ToolTip = 'Specifies the value of the Last2Char field.', Comment = '%';
                }
                field("Std or Opt"; Rec."Std or Opt")
                {
                    ToolTip = 'Specifies the value of the Std or Opt field.', Comment = '%';
                }
                field("Std.Opt.abr"; Rec."Std.Opt.abr")
                {
                    ToolTip = 'Specifies the value of the Std.Opt.abr field.', Comment = '%';
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
                    ImportSSTFiles_lCdu.Import_StdOpt();
                end;
            }

        }
    }
}
