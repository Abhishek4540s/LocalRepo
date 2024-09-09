page 50951 "Maintenance Contract Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Maintenance Contract";


    layout
    {
        area(Content)
        {
            group("General Information")
            {
                field(Customer; Rec.Customer)
                {
                    ApplicationArea = All;
                }
                field(CustomerName; Rec.CustomerName)
                {
                    ApplicationArea = All;
                }
                field(Location; Rec.Location)
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
                field(ContractNumber; Rec.ContractNumber)
                {
                    ApplicationArea = All;

                }
                field(MasterContractID; Rec.MasterContractID)
                {
                    ApplicationArea = All;
                }
                field(ContractType; Rec.ContractType)
                {
                    ApplicationArea = All;
                }
                field(PONumber; Rec.PONumber)
                {
                    ApplicationArea = All;
                }
                field(SalespersonID; Rec.SalespersonID)
                {
                    ApplicationArea = All;
                }
                field(SalespersonName; Rec.SalespersonName)
                {
                    ApplicationArea = All;
                }
            }
            group("Contract Information")
            {
                field(CurrencyID; Rec.CurrencyID)
                {
                    ApplicationArea = All;
                }
                field(ContractAmount; Rec.ContractAmount)
                {
                    ApplicationArea = All;
                }
                field(StartDate; Rec.StartDate)
                {
                    ApplicationArea = All;
                }
                field(ExpirationDate; Rec.ExpirationDate)
                {
                    ApplicationArea = All;
                }
                field(AnniversaryDate; Rec.AnniversaryDate)
                {
                    ApplicationArea = All;
                }
                field(Divisions; Rec.Divisions)
                {
                    ApplicationArea = All;
                }
                field(BillingFrequency; Rec.BillingFrequency)
                {
                    ApplicationArea = All;

                }
                field(AutomaticallyBilling; Rec.AutomaticallyBilling)
                {
                    ApplicationArea = All;
                }
                field(InvoiceBillingDay; Rec.InvoiceBillingDay)
                {
                    ApplicationArea = All;
                }
            }
            group("Invoice Information")
            {
                field(BilltoCustomer; Rec.BilltoCustomer)
                {
                    ApplicationArea = All;
                }
                field(CUSTNAME; Rec.CUSTNAME)
                {
                    ApplicationArea = All;
                }
                field(BilltoADDRESS1; Rec.BilltoADDRESS1)
                {
                    ApplicationArea = All;
                }
                field(BilltoADDRESS2; Rec.BilltoADDRESS2)
                {
                    ApplicationArea = All;
                }
                field(BilltoADDRESS3; Rec.BilltoADDRESS3)
                {
                    ApplicationArea = All;
                }
                field(BilltoCOUNTRY; Rec.BilltoCOUNTRY)
                {
                    ApplicationArea = All;
                }
                field(BilltoCITY; Rec.BilltoCITY)
                {
                    ApplicationArea = All;
                }
                field(BilltoSTATE; Rec.BilltoSTATE)
                {
                    ApplicationArea = All;
                }
                field(BilltoZIP; Rec.BilltoZIP)
                {
                    ApplicationArea = All;
                }
                field(BilltoLocation; Rec.BilltoLocation)
                {
                    ApplicationArea = All;
                }
            }
            group("Other Information")
            {
                field(ServiceCallDay; Rec.ServiceCallDay)
                {
                    ApplicationArea = All;
                }
                field(MasterTaxSchedule; Rec.MasterTaxSchedule)
                {
                    ApplicationArea = All;
                }
                field(PrimaryTechnicianID; Rec.PrimaryTechnicianID)
                {
                    ApplicationArea = All;
                }
                field(ServiceLevelID; Rec.ServiceLevelID)
                {
                    ApplicationArea = All;
                }
                field(Hold; Rec.Hold)
                {
                    ApplicationArea = All;
                }
                field(LeaveContractOpen; Rec.LeaveContractOpen)
                {
                    ApplicationArea = All;
                }
                field(RenewalValue; Rec.RenewalValue)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(User_Define_1a; Rec.User_Define_1a)
                {
                    ApplicationArea = All;
                }
                field(User_Define_2a; Rec.User_Define_2a)
                {
                    ApplicationArea = All;
                }
                field(User_Define_3a; Rec.User_Define_3a)
                {
                    ApplicationArea = All;
                }
                field(User_Define_4a; Rec.User_Define_4a)
                {
                    ApplicationArea = All;
                }
                field(OriginalStartDate; Rec.OriginalStartDate)
                {
                    ApplicationArea = All;
                }
                field(OriginalEndDate; Rec.OriginalEndDate)
                {
                    ApplicationArea = All;
                }

            }
        }

    }
}