table 50938 "Contract History"
{
    DataClassification = ToBeClassified;
    Caption = 'Contract History';
    DataCaptionFields = CustomerID, CustomerName;
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No';
        }
        field(2; Contract; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Description; Text[150])
        {
            DataClassification = ToBeClassified;

        }
        field(4; Amount; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(5; CloseDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Close Date';

        }
        field(6; CustomerID; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(7; CustomerName; Text[150])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Name';
        }
        field(8; ShipToAddressID; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ship To Address ID';

        }
        field(9; ADDRESS1; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(10; ADDRESS2; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(11; ADDRESS3; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(12; COUNTRY; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(13; CITY; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(14; STATE; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(15; ZIP; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(16; "File Name"; Text[120])
        {
            DataClassification = ToBeClassified;

        }
        field(17; "File Imported Date"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(18; "File Imported By"; Code[50])
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