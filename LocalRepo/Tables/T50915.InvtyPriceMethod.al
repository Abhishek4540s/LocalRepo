table 50915 "Invty PriceMethod"
{
    Caption = 'Invty PriceMethod';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; PriceMth; Integer)
        {
            Caption = 'PriceMth';
        }
        field(22; Price_Method; Text[50])
        {
            Caption = 'Price_Method';
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
