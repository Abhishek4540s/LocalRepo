page 50940 Technician
{
    ApplicationArea = All;
    Caption = 'WennSoft Technicians';
    PageType = List;
    SourceTable = Technician;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'WennSoft';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Technician ID"; Rec."Technician ID")
                {
                    ApplicationArea = All;
                }
                field("Link To"; Rec."Link To")
                {
                    ApplicationArea = All;
                }
                field("Emp ID"; Rec."Emp ID")
                {
                    ApplicationArea = All;
                }
                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                }
                field("Technician Name"; Rec."Technician Name")
                {
                    ApplicationArea = All;
                }
                field("Primary Skill Level"; Rec."Primary Skill Level")
                {
                    ApplicationArea = All;
                }
                field("Technician Team"; Rec."Technician Team")
                {
                    ApplicationArea = All;
                }
                field("Extended Hours"; Rec."Extended Hours")
                {
                    ApplicationArea = All;
                }
                field("Page Vendor"; Rec."Page Vendor")
                {
                    ApplicationArea = All;
                }
                field("Page Number"; Rec."Page Number")
                {
                    ApplicationArea = All;
                }
                field("Pager Pin/Email"; Rec."Pager Pin/Email")
                {
                    ApplicationArea = All;
                }
                field("Refrigerant Certification"; Rec."Refrigerant Certification")
                {
                    ApplicationArea = All;
                }
                field("Time zone"; Rec."Time zone")
                {
                    ApplicationArea = All;
                }
                field("Allow Double booking"; Rec."Allow Double booking")
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
                    Import_CU.ImportTechnician();
                end;
            }
        }
    }
}
