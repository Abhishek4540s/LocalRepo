tableextension 50911 PurchaseHeaderExt extends "Purchase Header"
{
    fields
    {
        field(50000; "PO Generator"; Boolean)
        {
            Caption = 'PO Generator';
        }
        field(50001; "Create PO"; Boolean)
        {
            Caption = 'Create PO';
        }
        field(50002; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
    }
}