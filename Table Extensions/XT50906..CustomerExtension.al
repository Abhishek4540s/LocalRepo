
tableextension 50906 CustomerExtension extends Customer
{
    fields
    {

        field(65100; "Generic Customer No"; Code[20])
        {
            Caption = 'Generic Customer No';
            DataClassification = ToBeClassified;
        }
        field(65101; "Is Generic Customer"; Boolean)
        {
            Caption = 'Is Generic Customer';
            DataClassification = ToBeClassified;
        }
        field(65102; "Is New Customer"; Boolean)
        {
            Caption = 'Is New Customer';
            DataClassification = ToBeClassified;
        }

    }
}
