table 50913 "Invty Kits Sec Panel"
{
    Caption = 'Invty Kits Sec Panel';
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; "Item Number (Kit)"; Code[31])
        {
            Caption = 'Item Number (Kit)';
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
