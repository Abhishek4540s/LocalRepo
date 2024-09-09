tableextension 50919 SalescreditInvoiceExt extends "Sales Cr.Memo Header"
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