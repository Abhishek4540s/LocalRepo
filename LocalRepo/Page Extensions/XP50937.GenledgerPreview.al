pageextension 50937 GenledgerLedgerPreExt extends "G/L Entries Preview"
{
    layout
    {

        modify("Job No.")
        {
            Visible = true;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}