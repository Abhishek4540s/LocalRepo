pageextension 50920 SalesOrderCard extends "Sales Order"
{
    // layout
    // {
    //     addafter("Attached Documents")
    //     {
    //         part("Margin Details"; "Sales Margin Factbox")
    //         {
    //             ApplicationArea = All;
    //             Caption = 'Margin Details';
    //             Provider = SalesLines;
    //             SubPageLink = "Document Type" = field("Document Type"),
    //                           "Document No." = field("Document No."),
    //                           "Line No." = field("Line No.");
    //         }
    //     }
    // }
    layout
    {
        addafter(Status)
        {
            field("Job No"; Rec."Job No")
            {
                Caption = 'Project No.';
                ApplicationArea = all;
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
    }

    trigger OnOpenPage()
    begin
        // CurrPage."Sales Margin Factbox".page.UpdateMargins(Rec)
    end;

    trigger OnAfterGetRecord()
    begin

        if User_gRec.Get(Rec.SystemCreatedBy) then;
        if User_gRec1.Get(Rec.SystemModifiedBy) then;
    end;

    var
        User_gRec: Record User;
        User_gRec1: Record User;
}