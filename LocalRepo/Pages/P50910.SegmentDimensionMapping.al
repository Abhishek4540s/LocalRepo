

page 50910 "Segment Dimension Mapping"
{
    ApplicationArea = All;
    Caption = 'Segment Dimension Mapping';
    PageType = List;
    SourceTable = "Segment Dimension Mapping";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    AdditionalSearchTerms = 'SST';
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Segment Number"; Rec."Segment Number")
                {
                    ToolTip = 'Specifies the value of the Segment Number field.';
                }
                field("Segment Code"; Rec."Segment Code")
                {
                    ToolTip = 'Specifies the value of the Segment Code field.';
                }
                field("Old Dimension"; Rec."Old Dimension")
                {
                    ToolTip = 'Specifies the value of the Old Dimension field.';
                }
                field("Old Dimension Code"; Rec."Old Dimension Code")
                {
                    ToolTip = 'Specifies the value of the Old Dimension Code field.';
                }
                field("New Dimension"; Rec."New Dimension")
                {
                    ToolTip = 'Specifies the value of the New Dimension field.';
                }
                field("New Dimension Code"; Rec."New Dimension Code")
                {
                    ToolTip = 'Specifies the value of the New Dimension Code field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("&Import")
            {

                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import data from excel.';

                trigger OnAction()
                var
                    ImportSSTFiles_lCdu: Codeunit "Import SST Files";
                begin
                    ImportSSTFiles_lCdu.ReadExcelSheet();
                    ImportSSTFiles_lCdu.Import_SegementDimensionMapping();
                end;
            }
        }
    }
}
