table 50918 "Svc Jobs"
{
    Caption = 'Svc Jobs';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; SvcJobs; Text[20])
        {
            Caption = 'SvcJobs';
        }
        field(22; Divisions; Text[15])
        {
            Caption = 'Divisions';
        }
        field(23; "GL Div"; Text[10])
        {
            Caption = 'GL Div';
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
