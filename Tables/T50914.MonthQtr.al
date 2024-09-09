table 50914 MonthQtr
{
    Caption = 'MonthQtr';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; Month; Integer)
        {
            Caption = 'Month';
        }
        field(22; Qtr; Text[10])
        {
            Caption = 'Qtr';
        }
        field(23; Qtr_; Text[10])
        {
            Caption = 'Qtr_';
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
