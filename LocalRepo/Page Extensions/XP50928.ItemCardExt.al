pageextension 50928 ItemCardExt extends "Item Card"
{
    layout
    {
        modify("Description 2")
        {
            Visible = true;
            ApplicationArea = all;
        }
    }
    actions
    {
        addfirst(processing)
        {
            action("Open SharePoint")
            {
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = New;
                ApplicationArea = all;
                trigger OnAction()
                begin
                    Hyperlink('https://sstsun.sharepoint.com/sites/Testing/Shared%20Documents/Forms/AllItems.aspx?FolderCTID=0x012000A14934A62AE3044D9F083A227D1A2B70&id=%2Fsites%2FTesting%2FShared%20Documents%2FItems&viewid=52d8eb00%2D717d%2D42d5%2D894d%2D61d39ca2c112');
                end;
            }
        }
    }

}