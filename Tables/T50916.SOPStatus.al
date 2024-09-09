table 50916 SOPStatus
{
    Caption = 'SOPStatus';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; GVSOPstatus; Integer)
        {
            Caption = 'GVSOPstatus';
        }
        field(22; SOPStatusDescr; Text[20])
        {
            Caption = 'SOPStatusDescr';
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
