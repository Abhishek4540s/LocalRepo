page 50937 "PO Generator filters"
{
    ApplicationArea = All;
    PageType = Card;
    UsageCategory = Administration;
    SourceTable = POfilters;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    layout
    {
        area(content)
        {
            group("JOB planning lines filters")
            {
                Caption = 'JOB planning lines filters';
                field(StartingDate; Rec.FromDate)
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the date to use for new orders. This date is used to evaluate the inventory.';
                }
                field(EndingDate; Rec.ToDate)
                {
                    Caption = 'Ending Date';
                    ToolTip = 'Specifies the date where the planning period ends. Demand is not included beyond this date.';
                }
                field(ItemNo; Rec.ItemNo)
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies a Item No. that should be included';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(Location; Rec.Location)
                {
                    Caption = 'Location Filter';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.FromDate := 0D;
        Rec.ToDate := 0D;
        Rec.ItemNo := '';
        Rec.Description := '';
        Rec.Location := '';
        Rec.Modify();
    end;


}