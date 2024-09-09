table 50930 "Old vs New Customer Mapping"
{
    Caption = 'Old vs New Customer Mapping';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; "Old Customer No"; Code[31])
        {
            Caption = 'Old Customer No';
        }
        field(22; "Old Customer Name"; Text[100])
        {
            Caption = 'Old Customer Name';
        }
        field(23; "New Customer No"; Code[20])
        {
            Caption = 'New Customer No';
        }
        field(24; "New Customer Name"; Text[100])
        {
            Caption = 'New Customer Name';
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
