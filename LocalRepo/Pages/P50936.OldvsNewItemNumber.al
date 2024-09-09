page 50936 "Old vs New Item Number"
{
    ApplicationArea = All;
    Caption = 'Old vs New Item Number';
    PageType = List;
    SourceTable = "Old vs New Item Number";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    AdditionalSearchTerms = 'SST';
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Company Type"; Rec."Company Type")
                {
                    ToolTip = 'Specifies the value of the Company Type field.', Comment = '%';
                }
                field("GP ITEMNMBR"; Rec."GP ITEMNMBR")
                {
                    ToolTip = 'Specifies the value of the GP ITEMNMBR field.', Comment = '%';
                }
                field("Trim Item_Number CA"; Rec."Trim Item_Number CA")
                {
                    ToolTip = 'Specifies the value of the Trim Item_Number CA field.', Comment = '%';
                }
                field(GVnmbrChrtr; Rec.GVnmbrChrtr)
                {
                    ToolTip = 'Specifies the value of the GVnmbrChrtr field.', Comment = '%';
                }
                field("BC New Item Number"; Rec."BC New Item Number")
                {
                    ToolTip = 'Specifies the value of the BC New Item Number field.', Comment = '%';
                }
                field(GVnmbrChrtrNew; Rec.GVnmbrChrtrNew)
                {
                    ToolTip = 'Specifies the value of the GVnmbrChrtrNew field.', Comment = '%';
                }
                field(ItemType2; Rec.ItemType2)
                {
                    ToolTip = 'Specifies the value of the ItemType2 field.', Comment = '%';
                }
                field(ITEMTYPE; Rec.ITEMTYPE)
                {
                    ToolTip = 'Specifies the value of the ITEMTYPE field.', Comment = '%';
                }
                field(ITMCLSCD; Rec.ITMCLSCD)
                {
                    ToolTip = 'Specifies the value of the ITMCLSCD field.', Comment = '%';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ToolTip = 'Specifies the value of the Item Description field.', Comment = '%';
                }
                field(USCATVLS_6; Rec.USCATVLS_6)
                {
                    ToolTip = 'Specifies the value of the USCATVLS_6 field.', Comment = '%';
                }
                field(DeletedItemNmbrs;Rec.DeletedItemNmbrs)
                {
                    ToolTip = 'Specifies the value of the Deleted Item Nos field.', Comment = '%';
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
                    ImportOldvsNewItemNmbr_lCdu: Codeunit "Import Old Vs New Item Number";
                begin

                    ImportOldvsNewItemNmbr_lCdu.ReadExcelSheet();
                    ImportOldvsNewItemNmbr_lCdu.Import_OldvsNewItemNmbr();
                end;
            }
        }
    }
}
