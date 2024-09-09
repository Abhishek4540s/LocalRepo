page 50950 "Contract History Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Contract History";


    layout
    {
        area(Content)
        {
            group("General")
            {
                field(CustomerID; Rec.CustomerID)
                {
                    ApplicationArea = All;

                }
                field(CustomerName; Rec.CustomerName)
                {
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }
            }
            group("Address Details")
            {
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
            }
            group("Contract Details")
            {
                field(Contract; Rec.Contract)
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

            }

        }
    }
}