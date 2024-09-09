
tableextension 50913 SalesRecievablesExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(65100; "Restrict Expired Quote"; Boolean)
        {
            Caption = 'Restrict Expired Quote';
            DataClassification = ToBeClassified;
        }
    }
}
