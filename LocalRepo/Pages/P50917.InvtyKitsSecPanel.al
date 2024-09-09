page 50917 "Invty Kits Sec Panel"
{
    ApplicationArea = All;
    Caption = 'Invty Kits Sec Panel';
    PageType = List;
    SourceTable = "Invty Kits Sec Panel";
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
                field("Item Number (Kit)"; Rec."Item Number (Kit)")
                {
                    ToolTip = 'Specifies the value of the Item Number (Kit) field.', Comment = '%';
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
                    ImportSSTFiles_lCdu.Import_ItemNumberKit();
                end;
            }
 
        }
    }
}