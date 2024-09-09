table 50932 POfilters
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; FromDate; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; ToDate; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; ItemNo; text[150])
        {
            trigger OnLookup()
            var
                Item_lRec: Record Item;
                Item_lPage: Page "Item List";
            begin
                Item_lRec.Reset();
                Clear(Item_lPage);
                Item_lPage.SetTableView(Item_lRec);
                Item_lPage.lookupmode(true);
                If Item_lPage.Runmodal = action::lookupok then
                    ItemNo := Item_lPage.GetSelectionFilter();
            end;

        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(6; Location; text[150])
        {

            trigger OnLookup()
            var
                Location_lRec: Record Location;
                Location_lPage: Page "Location List";
            begin
                Location_lRec.Reset();
                Clear(Location_lPage);
                Location_lPage.SetTableView(Location_lRec);
                Location_lPage.lookupmode(true);
                If Location_lPage.Runmodal = action::lookupok then
                    Location := Location_lPage.GetSelectionFilter();
            end;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}