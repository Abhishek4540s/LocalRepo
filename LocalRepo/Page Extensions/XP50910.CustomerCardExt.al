

pageextension 50910 CustomerCardExt extends "Customer Card"
{
    layout
    {
        addafter("No.")
        {
            field("Generic Customer No"; Rec."Generic Customer No")
            {
                ApplicationArea = All;
                Visible = false;
                Editable = false;
            }
        }
        addafter("Disable Search by Name")
        {
            field("Is Generic Customer"; Rec."Is Generic Customer")
            {
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field(SystemCreatedBy; User_gRec."User Name")
            {
                Caption = 'Created By';

                ApplicationArea = all;
                Visible = true;
                Editable = false;
            }
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'Created At';
                ApplicationArea = all;
                Visible = true;
                Editable = false;
            }
            field(SystemModifiedBy; User_gRec1."User Name")
            {
                Caption = 'Modified By';
                ApplicationArea = all;
                Visible = true;
                Editable = false;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'Modified At';
                ApplicationArea = all;
                Visible = true;
                Editable = false;
            }
        }
        addlast(Invoicing)
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }
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
                    Hyperlink('https://sstsun.sharepoint.com/sites/Testing/Shared%20Documents/Forms/AllItems.aspx?FolderCTID=0x012000A14934A62AE3044D9F083A227D1A2B70&id=%2Fsites%2FTesting%2FShared%20Documents%2FCustomers&viewid=52d8eb00%2D717d%2D42d5%2D894d%2D61d39ca2c112');
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        if User_gRec.Get(Rec.SystemCreatedBy) then;
        if User_gRec1.Get(Rec.SystemModifiedBy) then;
    end;

    var
        User_gRec: Record User;
        User_gRec1: Record User;
}

