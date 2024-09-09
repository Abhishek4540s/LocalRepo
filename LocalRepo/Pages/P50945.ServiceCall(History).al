page 50945 "Service Call(History)"
{

    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'WennSoft Service Call(History)';
    CardPageId = "Service Call(History) Card";
    SourceTable = "Service Call(All)";
    SourceTableView = where(CallStatus = filter(CLOSED));
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
                field("Salesperson Name"; Rec."Salesperson Name")
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
                }
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
                field(JobNumber; Rec.JobNumber)
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

}
