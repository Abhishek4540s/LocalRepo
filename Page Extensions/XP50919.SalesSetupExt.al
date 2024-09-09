
pageextension 50919 SalesRecievablesExt extends "Sales & Receivables Setup"
{
    layout
    {
        addafter(General)
        {
            group(Projects)
            {
                field("Restrict Expired Quote"; Rec."Restrict Expired Quote")
                {
                    Caption = 'Warning Message On Project Creation From Expired Sales Quote';
                    ApplicationArea = all;
                    Visible = true;
                }
            }

        }
    }
}
