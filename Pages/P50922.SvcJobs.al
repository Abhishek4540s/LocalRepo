
page 50922 "Svc Jobs"
{
    ApplicationArea = All;
    Caption = 'Svc Jobs';
    PageType = List;
    SourceTable = "Svc Jobs";
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
                field(SvcJobs; Rec.SvcJobs)
                {
                    ToolTip = 'Specifies the value of the SvcJobs field.', Comment = '%';
                }
                field(Divisions; Rec.Divisions)
                {
                    ToolTip = 'Specifies the value of the Divisions field.', Comment = '%';
                }
                field("GL Div"; Rec."GL Div")
                {
                    ToolTip = 'Specifies the value of the GL Div field.', Comment = '%';
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
                    ImportSSTFiles_lCdu.Import_SvcJobs();
                end;
            }

        }
    }
}
