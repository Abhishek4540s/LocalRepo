page 50913 "EE4Pts Project"
{

    PageType = List;
    ApplicationArea = All;
    SourceTable = "EE4Pts Project";
    SaveValues = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'SST';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(GVEmployeeCode; Rec.GVEmployeeCode)
                {

                    ApplicationArea = All;

                }
                field(GVEEname; Rec.GVEEname)
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
                    ImportSSTFiles_lCdu.ImportEE4Pts_Project();
                end;
            }
        }
    }


}