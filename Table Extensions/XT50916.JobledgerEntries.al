tableextension 50916 JobLedgerExt extends "Job Ledger Entry"
{
    fields
    {
        field(65100; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            DataClassification = ToBeClassified;
            TableRelation = "Tax Area";
        }
        field(65101; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            DataClassification = ToBeClassified;
            TableRelation = "Tax Group";
        }
        field(65102; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
        }
    }
}