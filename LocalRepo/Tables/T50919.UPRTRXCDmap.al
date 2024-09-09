table 50919 UPRTRXCDmap
{
    Caption = 'UPRTRXCDmap';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; GVUPRTRXCD; Text[10])
        {
            Caption = 'GVUPRTRXCD';
        }
        field(22; Gvcode; Text[10])
        {
            Caption = 'Gvcode';
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
