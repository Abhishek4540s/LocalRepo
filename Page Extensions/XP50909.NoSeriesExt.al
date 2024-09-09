
pageextension 50909 NoSeriesExt extends "No. Series"
{
    layout
    {
        addafter(Code)
        {
            field("Is Generic"; Rec."Is Generic")
            {
                Caption = 'Is Generic Customer No.';
                ApplicationArea = All;
                Visible = true;
            }
        }
    }

}
