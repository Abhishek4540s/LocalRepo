page 50939 "Kit Document"
{
    ApplicationArea = All;
    Caption = 'Kit Details';
    PageType = Document;
    SourceTable = "Kit Master Header";
    AdditionalSearchTerms = 'WennSoft';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(ITEMNMBR; Rec.ITEMNMBR)
                {
                }
                field(ITEMDESC; Rec.ITEMDESC)
                {
                }
                field(IVCOGSIX; Rec.IVCOGSIX)
                {
                }
                field(CURRCOST; Rec.CURRCOST)
                {
                }
                field(STNDCOST; Rec.STNDCOST)
                {
                }
            }
            part("Kit Components"; "Kit Components Subform")
            {
                ApplicationArea = All;
                SubPageLink = ITEMNMBR = field(ITEMNMBR);
            }
        }
    }
}
