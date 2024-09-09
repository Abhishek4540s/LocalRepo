page 50915 "GL Division1"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "GL Division 1";
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
                field(GVDivisions; Rec.GVDivisions)
                {
                    ApplicationArea = All;

                }
                field(GL_Divisions; Rec.GL_Divisions)
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
                    ImportSSTFiles_lCdu.ImportGLDivision();
                end;
            }
        }
    }


}