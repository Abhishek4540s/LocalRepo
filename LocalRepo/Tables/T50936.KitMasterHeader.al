table 50936 "Kit Master Header"
{
    DataClassification = ToBeClassified;
    Caption = 'Kit Master Header';
    DataCaptionFields = ITEMNMBR, ITEMDESC;
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No';
        }
        field(2; ITEMNMBR; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(3; ITEMDESC; Text[150])
        {
            DataClassification = ToBeClassified;

        }
        field(4; IVCOGSIX; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(5; CURRCOST; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(6; STNDCOST; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(7; "File Name"; Text[120])
        {
            DataClassification = ToBeClassified;

        }
        field(8; "File Imported Date"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(9; "File Imported By"; Code[50])
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