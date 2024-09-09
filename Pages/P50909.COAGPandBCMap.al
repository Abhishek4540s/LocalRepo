

page 50909 "COA GP and BC Map"
{
    ApplicationArea = All;
    Caption = 'COA GP and BC Map';
    PageType = List;
    SourceTable = "COA GP and BC Map";
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
                field("Account Number"; Rec."Account Number")
                {
                    ToolTip = 'Specifies the value of the Account Number field.', Comment = '%';
                }
                field(Natural; Rec.Natural)
                {
                    ToolTip = 'Specifies the value of the Natural field.', Comment = '%';
                }
                field(Office; Rec.Office)
                {
                    ToolTip = 'Specifies the value of the Office field.', Comment = '%';
                }
                field(Product; Rec.Product)
                {
                    ToolTip = 'Specifies the value of the Product field.', Comment = '%';
                }
                field("Sub Product"; Rec."Sub Product")
                {
                    ToolTip = 'Specifies the value of the Sub Product field.', Comment = '%';
                }
                field("GL Code"; Rec."GL Code")
                {
                    ToolTip = 'Specifies the value of the GL Code field.', Comment = '%';
                }
                field("GL Description"; Rec."GL Description")
                {
                    ToolTip = 'Specifies the value of the GL Description field.', Comment = '%';
                }
                field(Dimension; Rec.Dimension)
                {
                    ToolTip = 'Specifies the value of the Dimension field.', Comment = '%';
                }
                field("Dimension Value Code"; Rec."Dimension Value Code")
                {
                    ToolTip = 'Specifies the value of the Dimension Value Code field.', Comment = '%';
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
                    ImportSSTFiles_lCdu.Import_COA_GP_and_BC_Map();
                end;
            }
        }
    }
}