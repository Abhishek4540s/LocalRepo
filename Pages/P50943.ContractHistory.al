page 50943 "Contract History"
{
    ApplicationArea = All;
    CardPageId = "Contract History Card";
    Caption = 'WennSoft Contract History';
    PageType = List;
    SourceTable = "Contract History";
    SaveValues = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'WennSoft';


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Contract; Rec.Contract)
                {

                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;

                }
                field(CloseDate; Rec.CloseDate)
                {
                    ApplicationArea = All;

                }
                field(CustomerID; Rec.CustomerID)
                {
                    ApplicationArea = All;

                }
                field(CustomerName; Rec.CustomerName)
                {
                    ApplicationArea = All;

                }
                field(ShipToAddressID; Rec.ShipToAddressID)
                {
                    ApplicationArea = All;

                }
                field(ADDRESS1; Rec.ADDRESS1)
                {
                    ApplicationArea = All;
                }

                field(ADDRESS2; Rec.ADDRESS2)
                {
                    ApplicationArea = All;
                }

                field(ADDRESS3; Rec.ADDRESS3)
                {
                    ApplicationArea = All;
                }

                field(COUNTRY; Rec.COUNTRY)
                {
                    ApplicationArea = All;
                }

                field(CITY; Rec.CITY)
                {
                    ApplicationArea = All;
                }

                field(STATE; Rec.STATE)
                {
                    ApplicationArea = All;
                }

                field(ZIP; Rec.ZIP)
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
                    Import_CU.ImportContractHistory();
                end;
            }
        }
    }


}