pageextension 50922 "Job Journal Ext" extends "Job Journal"
{
    layout
    {
        addafter("Shortcut Dimension 1 Code")
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
