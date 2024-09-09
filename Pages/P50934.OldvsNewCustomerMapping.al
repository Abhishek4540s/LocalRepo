

page 50934 "Old vs New Customer Mapping"
{
    ApplicationArea = All;
    Caption = 'Old vs New Customer Mapping';
    PageType = List;
    SourceTable = "Old vs New Customer Mapping";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Old Customer No"; Rec."Old Customer No")
                {
                    ToolTip = 'Specifies the value of the Old Customer No field.', Comment = '%';
                }
                field("Old Customer Name"; Rec."Old Customer Name")
                {
                    ToolTip = 'Specifies the value of the Old Customer Name field.', Comment = '%';
                }
                field("New Customer No"; Rec."New Customer No")
                {
                    ToolTip = 'Specifies the value of the New Customer No field.', Comment = '%';
                }
                field("New Customer Name"; Rec."New Customer Name")
                {
                    ToolTip = 'Specifies the value of the New Customer Name field.', Comment = '%';
                }
            }
        }
    }
}
