table 50906 "Segment Dimension Mapping"
{
    Caption = 'Segment Dimension Mapping';
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; "Segment Code"; Code[10])
        {
            Caption = 'Segment Code';
        }
        field(22; "Segment Number"; Code[10])
        {
            Caption = 'Segment Number';
        }
        field(23; "Old Dimension"; Code[20])
        {
            Caption = 'Old Dimension';
            TableRelation = Dimension;
        }
        field(24; "Old Dimension Code"; Code[20])
        {
            Caption = 'Old Dimension Code';
            TableRelation = "Dimension Value";
        }
        field(25; "New Dimension"; Code[20])
        {
            Caption = 'New Dimension';
            TableRelation = Dimension;
        }
        field(26; "New Dimension Code"; Code[20])
        {
            Caption = 'New Dimension Code';
            TableRelation = "Dimension Value";
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
