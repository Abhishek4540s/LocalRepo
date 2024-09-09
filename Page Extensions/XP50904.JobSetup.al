pageextension 50904 JobSetupExt extends "Jobs Setup"
{
    layout
    {
        addafter("Job WIP Nos.")
        {
            field("Default Billing type"; Rec."Default Billing type")
            {
                ApplicationArea = all;
            }
            field("Default Item type"; Rec."Default Item type")
            {
                ApplicationArea = all;
            }
            field("Default Labor type"; Rec."Default Labor type")
            {
                ApplicationArea = all;
            }
            field("Default Billing No."; Rec."Default Billing No.")
            {
                ApplicationArea = all;
            }
            field("Default Item No."; Rec."Default Item No.")
            {
                ApplicationArea = all;
            }
            field("Default Labor No."; Rec."Default Labor No.")
            {
                ApplicationArea = all;
            }
            field("Inventory Posting Group"; Rec."Inventory Posting Group")
            {
                ApplicationArea = all;
            }
        }
        addafter("Document No. Is Job No.")
        {
            field(Dimensions; Rec.Dimensions)
            {
                ApplicationArea = all;
            }
            field("Default Location Code"; Rec."Default Location Code")
            {
                ApplicationArea = all;
            }
            field("Restrict Duplicate Project"; Rec."Restrict Duplicate Project")
            {
                Caption = 'Restrict Duplicate Project Creation';
                ApplicationArea = all;
            }
        }
    }


    var
        myInt: Integer;
}