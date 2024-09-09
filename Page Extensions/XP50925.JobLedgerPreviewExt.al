pageextension 50925 JobPreviewledgerExt extends "Job Ledger Entries Preview"
{
    layout
    {
        addafter("Global Dimension 2 Code")
        {
            field("Tax Area Code"; Rec."Tax Area Code")
            {
                ApplicationArea = All;
                Visible = true;
            }
            field("Tax Group Code"; Rec."Tax Group Code")
            {
                ApplicationArea = All;
                Visible = true;
            }
            field("Salesperson Code"; Rec."Salesperson Code")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
    }


}