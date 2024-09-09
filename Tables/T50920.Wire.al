table 50920 Wire
{
    Caption = 'Wire';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; ItemNumber; Text[31])
        {
            Caption = 'ItemNumber';
        }
        field(22; ItemClassCode; Text[10])
        {
            Caption = 'ItemClassCode';
        }
        field(23; ItemDescr; Text[100])
        {
            Caption = 'ItemDescr';
        }
        field(24; ItemType; Text[15])
        {
            Caption = 'ItemType';
        }
        field(25; Phase; Text[5])
        {
            Caption = 'Phase';
        }
        field(26; "Bill / Sale"; Text[5])
        {
            Caption = 'Bill / Sale';
        }
    }
    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
    }
}
