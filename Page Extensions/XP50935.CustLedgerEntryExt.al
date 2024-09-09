pageextension 50935 CustomerLedgerExt extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Customer Name")
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = All;
                Caption = 'Project No.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}