table 50939 "Service Call(All)"
{
    DataClassification = ToBeClassified;
    Caption = 'Service Call(All)';
    DataCaptionFields = Customer, "Customer Name";
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No';
        }

        field(2; Customer; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Customer Name"; code[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Location; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; ADDRESS1; code[150])
        {
            DataClassification = ToBeClassified;
        }
        field(6; ADDRESS2; code[150])
        {
            DataClassification = ToBeClassified;
        }
        field(7; ADDRESS3; code[150])
        {
            DataClassification = ToBeClassified;
        }
        field(8; COUNTRY; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; CITY; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; STATE; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; ZIP; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; ServiceCallId; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Call Id';
        }
        field(13; Description; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(14; ProblemType; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'ProblemType';
        }
        field(15; Division; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16; SalespersonID; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Salesperson ID';
        }
        field(17; CallType; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Call Type';
        }
        field(18; Priority; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(19; CustomerPONumber; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer PO Number';
        }
        field(20; ContactNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Contact Number';
        }
        field(21; EquimpentID; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Equimpent ID';
        }
        field(22; TaskCode; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Task Code';
        }
        field(23; TechnicianID; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Technician ID';
        }
        field(24; Technician_Long_Name; code[150])
        {
            DataClassification = ToBeClassified;
        }
        field(25; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; EstimatedHours; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Estimated Hours';
        }
        field(27; StartingTime; Time)
        {
            DataClassification = ToBeClassified;
            Caption = 'Starting Time';
        }
        field(28; CallStatus; Option)
        {
            OptionMembers = CLOSED,COMPLETE,OPEN;
            DataClassification = ToBeClassified;
            Caption = 'Call Status';
        }
        field(29; CompletionDate; Date)
        {
            DataClassification = ToBeClassified;
            caption = 'Completion Date';
        }
        field(30; Resolution; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(31; UserDefineda; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'User Defined a';
        }
        field(32; Order; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Order #';
        }
        field(33; UserDefinedc; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'User Defined c';
        }
        field(34; BillCustomer; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bill Customer';
        }
        field(35; CUSTNAME; code[150])
        {
            DataClassification = ToBeClassified;
        }
        field(36; BillADDRESS1; code[150])
        {
            DataClassification = ToBeClassified;
        }
        field(37; BillADDRESS2; code[150])
        {
            DataClassification = ToBeClassified;
        }
        field(38; BillADDRESS3; Code[150])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bill Address';
        }
        field(39; BillCOUNTRY; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(40; BillCITY; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(41; BillSTATE; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(42; BillZIP; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(43; BillAddress; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(44; JobNumber; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Job Number';
        }
        field(45; OriginatingCallID; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Originating Call ID';
        }
        field(46; DateTimeLock; Option)
        {
            OptionMembers = "Locked","Not Locked";
            DataClassification = ToBeClassified;
            Caption = 'Date/Time Lock';
        }
        field(47; "File Name"; Text[120])
        {
            DataClassification = ToBeClassified;

        }
        field(48; "File Imported Date"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(49; "File Imported By"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(50; "Salesperson Name"; Text[120])
        {
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
