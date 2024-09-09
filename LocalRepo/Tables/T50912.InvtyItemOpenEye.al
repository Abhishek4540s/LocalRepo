table 50912 "Invty Item OpenEye"
{
    Caption = 'Invty Item OpenEye';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; ItemNMBR; Code[31])
        {
            Caption = 'ItemNMBR';
        }
        field(22; ItemDscr; Text[101])
        {
            Caption = 'ItemDscr';
        }
        field(23; ItemType; Text[15])
        {
            Caption = 'ItemType';
        }
        field(24; ItemClassCode; Text[10])
        {
            Caption = 'ItemClassCode';
        }
        field(25; CurrentCost; Decimal)
        {
            Caption = 'CurrentCost';
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
