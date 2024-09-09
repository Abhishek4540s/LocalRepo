page 50928 "DivisionCrosswalk to BC Dim1"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "DivisionCrosswalk to BC Dim1";
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
                field(GVDivisions; Rec.GVDivisions)
                {
                    ApplicationArea = All;
                }
                field(GL_Divisions; Rec.GL_Divisions)
                {
                    ApplicationArea = All;
                }
                field(BCdimension1; Rec.BCdimension1)
                {
                    ApplicationArea = All;
                }
                field(BCdscriptnDim1; Rec.BCdscriptnDim1)
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
                    ImportSSTFiles_lCdu.Import_DivisionCrosswalkToBCDim1();
                end;
            }
        }
    }
}