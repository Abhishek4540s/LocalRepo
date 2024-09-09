page 50932 GPSetup
{
    ApplicationArea = All;
    Caption = 'GP Setup';
    PageType = Card;
    SourceTable = GPSetup;
    UsageCategory = Administration;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Gen. Jnl. Template Name"; Rec."Gen. Jnl. Template Name")
                {
                    ApplicationArea = All;
                }
                field("Gen. Jnl. Batch Name"; Rec."Gen. Jnl. Batch Name")
                {
                    ApplicationArea = All;
                }

                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
