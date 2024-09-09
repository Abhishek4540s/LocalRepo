table 50937 "Maintenance Contract"
{
    DataClassification = ToBeClassified;
    Caption = 'Maintenance Contract';
    DataCaptionFields = Customer, CustomerName, CITY;
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
        field(3; CustomerName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Name';
        }
        field(4; Location; code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(5; ADDRESS1; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(6; ADDRESS2; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(7; ADDRESS3; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(8; COUNTRY; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(9; CITY; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(10; STATE; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(11; ZIP; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(12; ContractNumber; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Contract Number';
        }
        field(13; MasterContractID; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Master Contract ID';
        }
        field(14; ContractType; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Contract Type';
        }
        field(15; CurrencyID; code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Currency ID';
        }
        field(16; ContractAmount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Contract Amount';
        }
        field(17; StartDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Start Date';
        }
        field(18; ExpirationDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Expiration Date';
        }
        field(19; AnniversaryDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Anniversary Date';
        }
        field(20; Divisions; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(21; BillingFrequency; Enum "Billing Frequency")
        {
            DataClassification = ToBeClassified;
            Caption = 'Billing Frequency';
        }
        field(22; AutomaticallyBilling; Option)
        {
            OptionMembers = YES;
            DataClassification = ToBeClassified;
            Caption = 'Automatically Billing';
        }

        field(23; InvoiceBillingDay; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Invoice Billing Day';
        }

        field(24; BilltoCustomer; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bill to Customer';
        }
        field(25; CUSTNAME; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bill to Customer Name';
        }
        field(26; BilltoADDRESS1; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bill to ADDRESS1';
        }
        field(27; BilltoADDRESS2; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bill to ADDRESS2';
        }
        field(28; BilltoADDRESS3; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bill to ADDRESS3';
        }
        field(29; BilltoCOUNTRY; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bill to COUNTRY';
        }
        field(30; BilltoCITY; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bill to CITY';
        }
        field(31; BilltoSTATE; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bill to STATE';
        }
        field(32; BilltoZIP; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bill to ZIP';
        }

        field(33; BilltoLocation; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bill to Location';
        }
        field(34; ServiceCallDay; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Call Day';
        }
        field(35; MasterTaxSchedule; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Master Tax Schedule';
        }
        field(36; PONumber; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'P.O. Number';
        }

        field(37; SalespersonID; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Salesperson ID';
        }
        field(38; SalespersonName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Salesperson Name';
        }

        field(39; PrimaryTechnicianID; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Primary Technician ID';
        }
        field(40; ServiceLevelID; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Level ID';
        }
        field(41; Hold; Option)
        {
            OptionMembers = "0","1";
            DataClassification = ToBeClassified;

        }
        field(42; LeaveContractOpen; Option)
        {
            OptionMembers = "0","1";
            DataClassification = ToBeClassified;
            Caption = 'Leave Contract Open';
        }
        field(43; RenewalValue; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Renewal Value';

        }


        field(44; Status; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(45; User_Define_1a; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(46; User_Define_2a; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(47; User_Define_3a; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(48; User_Define_4a; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(49; OriginalStartDate; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Original Start Date';
        }
        field(50; OriginalEndDate; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Original End Date';
        }
        field(51; "File Name"; Text[120])
        {
            DataClassification = ToBeClassified;

        }
        field(52; "File Imported Date"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(53; "File Imported By"; Code[50])
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

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}