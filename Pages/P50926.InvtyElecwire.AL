page 50926 "Invty ElecWire"
{
    ApplicationArea = All;
    Caption = 'Invty Elecwire';
    PageType = List;
    SourceTable = "Invty Elecwire";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    AdditionalSearchTerms = 'SST';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {

                field(ItemNmbr; Rec.ItemNmbr)
                {
                    ApplicationArea = All;

                }
                field(ItemDescrip; Rec.ItemDescrip)
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
            action("&Import")
            {
                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import data from excel.';
                trigger OnAction();
                var
                    ImportSSTFiles_lCdu: Codeunit "Import SST Files";
                begin

                    ImportSSTFiles_lCdu.ReadExcelSheet();
                    ImportSSTFiles_lCdu.Import_InvtyElecwire();
                end;
            }
        }
    }

}