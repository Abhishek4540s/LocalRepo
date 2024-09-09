table 50907 "Credit Card Fees"
{
    Caption = 'Credit Card Fees';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; Credit_Card; Text[20])
        {
            Caption = 'Credit_Card';
        }
        field(22; CC_Fee_Rate; Decimal)
        {
            Caption = 'CC_Fee_Rate';
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
