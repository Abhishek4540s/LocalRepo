page 50925 "Invty Dead Commercial Tag"
{
    ApplicationArea = All;
    Caption = 'Invty Dead Commercial Tag';
    PageType = List;
    SourceTable = "Invty Dead Commercial Tag";
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

                field(DeadCommercial; Rec.DeadCommercial)
                {
                    ApplicationArea = All;

                }
                field(D_ITEMNMBR; Rec.D_ITEMNMBR)
                {
                    ApplicationArea = All;

                }
                field(D_ITEMDESC; Rec.D_ITEMDESC)
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
                    ImportSSTFiles_lCdu.Import_InvtyDeadCommercialTag();
                end;
            }
        }
    }

}