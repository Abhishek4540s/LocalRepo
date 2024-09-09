page 50946 "Customer Maintainence"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'WennSoft Customer Maintainence';
    SourceTable = "Customer Maintainence";
    SaveValues = true;
    AdditionalSearchTerms = 'WennSoft';
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Customer ID"; Rec."Customer ID")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Short Name"; Rec."Short Name")
                {
                    ApplicationArea = All;
                }
                field("Parent Customer ID "; Rec."Parent Customer ID ")
                {
                    ApplicationArea = All;
                }
                field("Statment Name"; Rec."Statment Name")
                {
                    ApplicationArea = All;
                }
                field("Class ID"; Rec."Class ID")
                {
                    ApplicationArea = All;
                }
                field("SalesPerson ID"; Rec."SalesPerson ID")
                {
                    ApplicationArea = All;
                }
                field("Salesperson Name"; Rec."Salesperson Name")
                {
                    ApplicationArea = All;
                }
                field("Territory ID"; Rec."Territory ID")
                {
                    ApplicationArea = All;
                }
                field("User Defined 1"; Rec."User Defined 1")
                {
                    ApplicationArea = All;
                }
                field("User Defined2"; Rec."User Defined2")
                {
                    ApplicationArea = All;
                }
                field("UPS Zone"; Rec."UPS Zone")
                {
                    ApplicationArea = All;
                }
                field("Shipping Method"; Rec."Shipping Method")
                {
                    ApplicationArea = All;
                }
                field("Tax Schedule ID"; Rec."Tax Schedule ID")
                {
                    ApplicationArea = All;
                }
                field("Comment 1"; Rec."Comment 1")
                {
                    ApplicationArea = All;
                }
                field("Comment 2"; Rec."Comment 2")
                {
                    ApplicationArea = All;
                }
                field("Trade Discount"; Rec."Trade Discount")
                {
                    ApplicationArea = All;
                }
                field("Payment Terms"; Rec."Payment Terms")
                {
                    ApplicationArea = All;
                }
                field("Discout Grace Period"; Rec."Discout Grace Period")
                {
                    ApplicationArea = All;
                }
                field("Due Date Grace Period"; Rec."Due Date Grace Period")
                {
                    ApplicationArea = All;
                }
                field("Price Level"; Rec."Price Level")
                {
                    ApplicationArea = All;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = All;
                }
                field("Contact Person 1"; Rec."Contact Person 1")
                {
                    ApplicationArea = All;
                }
                field("Phone 1"; Rec."Phone 1")
                {
                    ApplicationArea = All;
                }
                field("Contact Person 2"; Rec."Contact Person 2")
                {
                    ApplicationArea = All;
                }
                field("Phone 2"; Rec."Phone 2")
                {
                    ApplicationArea = All;
                }
                field("Phone 3"; Rec."Phone 3")
                {
                    ApplicationArea = All;
                }
                field(Fax; Rec.Fax)
                {
                    ApplicationArea = All;
                }
                field(Hold; Rec.Hold)
                {
                    ApplicationArea = All;
                }
                field(Inactive; Rec.Inactive)
                {
                    ApplicationArea = All;
                }
                field("Address ID"; Rec."Address ID")
                {
                    ApplicationArea = All;
                }
                field("Location Name"; Rec."Location Name")
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field(State; Rec.State)
                {
                    ApplicationArea = All;
                }
                field("Zip Code"; Rec."Zip Code")
                {
                    ApplicationArea = All;
                }
                field("Country Code"; Rec."Country Code")
                {
                    ApplicationArea = All;
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                }
                field("Ship to"; Rec."Ship to")
                {
                    ApplicationArea = All;
                }
                field("Bill to"; Rec."Bill to")
                {
                    ApplicationArea = All;
                }
                field("Statment To"; Rec."Statment To")
                {
                    ApplicationArea = All;
                }
                field("Service Area"; Rec."Service Area")
                {
                    ApplicationArea = All;
                }
                field("Primary Technician "; Rec."Primary Technician ")
                {
                    ApplicationArea = All;
                }
                field("Secondary Technician"; Rec."Secondary Technician")
                {
                    ApplicationArea = All;
                }
                field("Labor Rate Group"; Rec."Labor Rate Group")
                {
                    ApplicationArea = All;
                }
                field("Price Matrix"; Rec."Price Matrix")
                {
                    ApplicationArea = All;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = All;
                }
                field("Service Call Priority"; Rec."Service Call Priority")
                {
                    ApplicationArea = All;
                }
                field("PO Required"; Rec."PO Required")
                {
                    ApplicationArea = All;
                }
                field("Service Level ID"; Rec."Service Level ID")
                {
                    ApplicationArea = All;
                }
                field("Time Zone"; Rec."Time Zone")
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
                    Import_CU.ImportCustomerMaintaince();
                end;
            }
        }
    }
}