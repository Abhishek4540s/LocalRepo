pageextension 50936 CustomerLedgerPreExt extends "Cust. Ledg. Entries Preview"
{
    layout
    {
        addafter("Customer No.")
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