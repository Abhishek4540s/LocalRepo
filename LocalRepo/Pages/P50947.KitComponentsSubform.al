page 50947 "Kit Components Subform"
{
    ApplicationArea = All;
    Caption = 'Kit Components';
    PageType = ListPart;
    SourceTable = "Kit Components";
    AdditionalSearchTerms = 'WennSoft';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ITEMNMBR; Rec.ITEMNMBR)
                {
                    ApplicationArea = All;

                }
                field(CMPTITNM; Rec.CMPTITNM)
                {
                    ApplicationArea = All;
                }

                field("Component Item Desc."; Rec."Component Item Desc.")
                {
                    ApplicationArea = All;
                }
                field(CMPITUOM; Rec.CMPITUOM)
                {
                    ApplicationArea = All;
                }
                field(CMPITQTY; Rec.CMPITQTY)
                {
                    ApplicationArea = All;
                }
                field("Parent Current Cost"; Rec."Parent Current Cost")
                {
                    ApplicationArea = All;
                }
                field("Parent Standard Cost"; Rec."Parent Standard Cost")
                {
                    ApplicationArea = All;
                }
                field("Component Current Cost"; Rec."Component Current Cost")
                {
                    ApplicationArea = All;
                }
                field("Component Std Cost"; Rec."Component Std Cost")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
