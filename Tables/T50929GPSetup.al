table 50929 GPSetup
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }

        field(2; "Gen. Jnl. Template Name"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template";

        }
        field(3; "Gen. Jnl. Batch Name"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Gen. Jnl. Template Name"));
        }
        field(4; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }

    }
    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}