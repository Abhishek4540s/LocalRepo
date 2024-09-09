page 50927 "Invtry Item Type"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Invtry Item Type";
    SaveValues = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    AdditionalSearchTerms = 'SST';
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Item Type1"; Rec."Item Type1")
                {
                    ApplicationArea = All;
                }
                field("Item Type2"; Rec."Item Type2")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

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
                    ImportSSTFiles_lCdu.Import_InvtyItemTypeDescr();
                end;
            }
        }
    }
}