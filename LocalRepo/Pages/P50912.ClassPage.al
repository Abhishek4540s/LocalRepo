page 50912 "Class Page"
{

    PageType = List;
    ApplicationArea = All;
    Caption = 'Class Table';
    SourceTable = "Class Table";
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
                field(ID; Rec.ID)
                {

                    ApplicationArea = All;

                }
                field(Class_ID; Rec.Class_ID)
                {
                    ApplicationArea = All;

                }
                field(Builder_Type; Rec.Builder_Type)
                {
                    ApplicationArea = All;

                }
                field(Mon_Y_N; Rec.Mon_Y_N)
                {
                    ApplicationArea = All;

                }
                field(Div_Map; Rec.Div_Map)
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
                    ImportSSTFiles_lCdu.ImportClassTable();
                end;
            }
        }
    }


}