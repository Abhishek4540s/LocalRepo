page 50901 OnedrivePage
{
    Caption = 'Onedrive Attachment';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = OneDriveAttachment;

    layout
    {
        area(Content)
        {
            repeater(Genral)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field("Table ID"; Rec."Table ID")
                {
                    ApplicationArea = All;
                }
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Attached Date"; Rec."Attached Date")
                {
                    ApplicationArea = All;
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;
                }
                field("File Extension"; Rec."File Extension")
                {
                    ApplicationArea = All;
                }
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = All;
                }
                field(User; Rec.User)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}