

tableextension 50909 "Sales Line Ext" extends "Sales Line"
{
    fields
    {
        field(50900; "Standard Cost"; Decimal)
        {
            Caption = 'Standard Cost';
            DataClassification = ToBeClassified;
        }
        field(50901; "Estimated Price"; Decimal)
        {
            Caption = 'Estimated Price';
            DataClassification = ToBeClassified;
        }
        field(50902; "Estimated Cost"; Decimal)
        {
            Caption = 'Estimated Cost';
            DataClassification = ToBeClassified;
        }
        field(50903; "Estimated Cost1"; Decimal)
        {
            Caption = 'Estimated Cost1';
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
            TableRelation = "Salesperson/Purchaser";
        }

    }

}
