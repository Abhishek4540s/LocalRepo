page 50941 "Kit Master Header"
{

    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'WennSoft Kit Master Header';
    SourceTable = "Kit Master Header";
    SaveValues = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    AdditionalSearchTerms = 'WennSoft';
    CardPageId = "Kit Document";


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ITEMNMBR; Rec.ITEMNMBR)
                {

                    ApplicationArea = All;

                }
                field(ITEMDESC; Rec.ITEMDESC)
                {
                    ApplicationArea = All;

                }
                field(IVCOGSIX; Rec.IVCOGSIX)
                {
                    ApplicationArea = All;

                }
                field(CURRCOST; Rec.CURRCOST)
                {
                    ApplicationArea = All;

                }
                field(STNDCOST; Rec.STNDCOST)
                {
                    ApplicationArea = All;

                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;

                }
                field("File Imported Date"; Rec."File Imported Date")
                {
                    ApplicationArea = All;

                }
                field("File Imported By"; Rec."File Imported By")
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
                trigger OnAction()
                var
                    Import_CU: Codeunit ImportJobfiles;
                begin
                    Import_CU.ImportKitMasterHeader();
                end;
            }
        }
    }


}