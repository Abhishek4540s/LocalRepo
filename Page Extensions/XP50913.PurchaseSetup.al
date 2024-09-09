pageextension 50913 Purchasetup extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Disable Search by Name")
        {
            field("User Location for PO Gen"; Rec."User Location for PO Gen")
            {
                ApplicationArea = all;
                Visible = true;
            }
            field(Location; Rec.Location)
            {
                ApplicationArea = all;
                Visible = true;
            }
            // Add changes to page layout here
        }
    }

}