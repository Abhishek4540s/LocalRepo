pageextension 50903 FixedAssestPage extends "Fixed Asset Card"
{
    layout
    {
        addafter("Last Date Modified")
        {
            field("Tax Group Code"; Rec."Tax Group Code")
            {
                ApplicationArea = all;
            }
        }
    }


}