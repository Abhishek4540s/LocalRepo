page 50942 "Maintenance Contract"
{

    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'WennSoft Maintenance contract';
    SourceTable = "Maintenance Contract";
    CardPageId = "Maintenance Contract Card";
    SaveValues = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    AdditionalSearchTerms = 'WennSoft';


    layout
    {
        area(Content)
        {
            repeater(Group)
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
                field(ServiceCallDay; Rec.ServiceCallDay)
                {
                    ApplicationArea = All;
                }
                field(MasterTaxSchedule; Rec.MasterTaxSchedule)
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
                    Import_CU.ImportMaintainceContract();
                end;
            }
        }
    }


}