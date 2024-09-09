page 50952 "Service Call(All) Card"
{
    PageType = Card;
    ApplicationArea = Basic, Suite;
    UsageCategory = Administration;
    SourceTable = "Service Call(All)";

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
                field("Customer Name"; Rec."Customer Name")
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
                field(ServiceCallId; Rec.ServiceCallId)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(ProblemType; Rec.ProblemType)
                {
                    ApplicationArea = All;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = All;
                }
                field(SalespersonID; Rec.SalespersonID)
                {
                    ApplicationArea = All;
                }
                field(CallType; Rec.CallType)
                {
                    ApplicationArea = All;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = All;
                }
                field(CustomerPONumber; Rec.CustomerPONumber)
                {
                    ApplicationArea = All;
                }
                field(ContactNumber; Rec.ContactNumber)
                {
                    ApplicationArea = All;
                    Caption = 'Contract Number';
                }
                field(JobNumber; Rec.JobNumber)
                {
                    ApplicationArea = All;
                }
            }
            group("Contract Information")
            {
                field(EquimpentID; Rec.EquimpentID)
                {
                    ApplicationArea = All;
                }
                field(TaskCode; Rec.TaskCode)
                {
                    ApplicationArea = All;
                }
                field(TechnicianID; Rec.TechnicianID)
                {
                    ApplicationArea = All;
                }
                field(Technician_Long_Name; Rec.Technician_Long_Name)
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field(EstimatedHours; Rec.EstimatedHours)
                {
                    ApplicationArea = All;
                }
                field(StartingTime; Rec.StartingTime)
                {
                    ApplicationArea = All;
                }
                field(CallStatus; Rec.CallStatus)
                {
                    ApplicationArea = All;
                }
                field(CompletionDate; Rec.CompletionDate)
                {
                    ApplicationArea = All;
                }
                field(Resolution; Rec.Resolution)
                {
                    ApplicationArea = All;
                }
                field(UserDefineda; Rec.UserDefineda)
                {
                    ApplicationArea = All;
                }
                field(Order; Rec.Order)
                {
                    ApplicationArea = All;
                }
                field(UserDefinedc; Rec.UserDefinedc)
                {
                    ApplicationArea = All;
                }
            }
            group("Invoice Information")
            {
                field(BillCustomer; Rec.BillCustomer)
                {
                    ApplicationArea = All;
                }
                field(CUSTNAME; Rec.CUSTNAME)
                {
                    ApplicationArea = All;
                }
                field(BillADDRESS1; Rec.BillADDRESS1)
                {
                    ApplicationArea = All;
                }
                field(BillADDRESS2; Rec.BillADDRESS2)
                {
                    ApplicationArea = All;
                }
                field(BillADDRESS3; Rec.BillADDRESS3)
                {
                    ApplicationArea = All;
                }
                field(BillCOUNTRY; Rec.BillCOUNTRY)
                {
                    ApplicationArea = All;
                }
                field(BillCITY; Rec.BillCITY)
                {
                    ApplicationArea = All;
                }
                field(BillSTATE; Rec.BillSTATE)
                {
                    ApplicationArea = All;
                }
                field(BillZIP; Rec.BillZIP)
                {
                    ApplicationArea = All;
                }
                field(BillAddress; Rec.BillAddress)
                {
                    ApplicationArea = All;
                }

                field(OriginatingCallID; Rec.OriginatingCallID)
                {
                    ApplicationArea = All;
                }
                field(DateTimeLock; Rec.DateTimeLock)
                {
                    ApplicationArea = All;
                }
            }
        }
    }


}