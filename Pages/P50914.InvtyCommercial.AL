page 50914 "Invty Commercial"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Invty Commercial";
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
                field("ITEMNMBR Comm Table"; Rec."ITEMNMBR Comm Table")
                {
                    ApplicationArea = All;

                }
                field("GV Invty Category"; Rec."GV Invty Category")
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
                    ImportSSTFiles_lCdu.ImportInvtyCommercial();
                end;
            }

        }
    }


}