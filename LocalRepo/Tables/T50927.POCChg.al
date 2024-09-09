table 50927 "POC Chg"
{
    Caption = 'POC Chg';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'POCJobNumber';
        }
        field(2; POCJobNumber; Code[17])
        {
            Caption = 'POCJobNumber';
        }
        field(3; POCchgJul2015; Decimal)
        {
            Caption = 'POCchgJul2015';
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
