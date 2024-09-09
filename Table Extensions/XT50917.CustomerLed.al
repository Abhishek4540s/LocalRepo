tableextension 50917 CustLedgExt extends "Cust. Ledger Entry"
{
    fields
    {
        field(50900; "Job No."; Code[20])
        {
            Caption = 'Project No.';
            TableRelation = Job;
        }
    }

}