tableextension 50915 SalesCreditLineExt extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50900; "Standard Cost"; Decimal)
        {
            Caption = 'Standard Cost';
            DataClassification = ToBeClassified;
        }

        field(65100; "Billing Line"; Boolean)
        {
            Caption = 'Billing Line';
            DataClassification = ToBeClassified;
        }
        field(65101; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            DataClassification = ToBeClassified;
        }
    }
}