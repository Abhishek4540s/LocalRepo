pageextension 50905 JobPlanningExt extends "Job Planning Lines"
{
    layout
    {
        addafter("Invoiced Amount (LCY)")
        {
            field("Tax Area Code"; Rec."Tax Area Code")
            {
                ApplicationArea = All;
                Visible = true;
            }
            field("Tax Group Code"; Rec."Tax Group Code")
            {
                ApplicationArea = All;
                Visible = true;
            }
            field("Salesperson Code"; Rec."Salesperson Code")
            {
                ApplicationArea = All;
                Visible = true;
            }

        }
        modify("Line Type")
        {
            trigger OnBeforeValidate()
            begin
                IF Rec."Line Type" = Rec."Line Type"::Billable then
                    MyBool := true
                else
                    MyBool := false;

            end;
        }
        modify("Remaining Total Cost (LCY)")
        {
            Visible = true;
        }
        addafter("Invoiced Amount (LCY)")
        {
            field("Ready to Bill"; Rec."Ready to Bill")
            {
                ApplicationArea = all;
                Editable = MyBool;
            }

        }
        // addafter("Salesperson Code")
        // {
        //     field("Global Dimension 1 Filter"; Rec."Global Dimension 1 Filter")
        //     {
        //         // CaptionClass = '1,2,1';
        //         ApplicationArea = all;
        //     }
        // }
        addlast(Control1)
        {
            // field("Reorder Point"; Rec."Reorder Point")
            // {
            //     ApplicationArea = all;
            // }
            // field("Reorder Quantity"; Rec."Reorder Quantity")
            // {
            //     ApplicationArea = all;
            // }
            // field(Inventory; Rec.Inventory)
            // {
            //     ApplicationArea = all;
            // }
            // field("Vendor No."; Rec."Vendor No.")
            // {
            //     ApplicationArea = all;
            // }
            // field("PO No."; Rec."PO No.")
            // {
            //     ApplicationArea = all;
            // }
            field("PO Generator"; Rec."PO Generator")
            {
                ApplicationArea = all;
            }
            field("Original Qty."; Rec."Original Qty.")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("Base Line No."; Rec."Base Line No.")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("Current Cost Updated"; Rec."Current Cost Updated")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("Current Cost"; Rec."Current Cost")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("Total Current Cost"; Rec."Total Current Cost")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }

    }
    actions
    {
        addfirst("F&unctions")
        {
            action(TestPlanningLines)
            {
                ApplicationArea = All;
                Caption = 'TestResouceLines';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Planning_CU: Codeunit RecurrencePlanninglines;
                begin
                    Planning_CU.Testing(Rec);
                end;
            }
            action(TestItemLines)
            {
                ApplicationArea = All;
                Caption = 'TestItemLines';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Planning_CU: Codeunit RecurrencePlanninglinesItem;
                begin
                    Planning_CU.Testing(Rec);
                end;
            }
        }

    }





    trigger OnAfterGetRecord()
    begin
        IF Rec."Line Type" = Rec."Line Type"::Billable then
            MyBool := true
        else
            MyBool := false;
    end;


    var
        MyBool: Boolean;
}