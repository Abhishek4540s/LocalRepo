tableextension 50918 SalesInvoiceExt extends "Sales Invoice Header"
{
    fields
    {
        field(65101; "Job No"; Code[20])
        {
            Caption = 'Project No.';
            TableRelation = Job;
            Editable = false;
        }
    }

}