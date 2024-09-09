pageextension 50908 SalesQuotePageExt extends "Sales Quote"

{
    DataCaptionExpression = DataCaption_gTex;
    layout
    {
        modify("Language Code")
        {
            Visible = true;
        }
        // modify("Format Region")
        // {
        //     Visible = true;
        // }
        modify(General)
        {
            Editable = StatusEditable;
        }
        modify("Shipping and Billing")
        {
            Editable = StatusEditable;
        }
        modify("Foreign Trade")
        {
            Editable = StatusEditable;
        }
        modify("Invoice Details")
        {
            Editable = StatusEditable;
        }
        modify("Sell-to Customer Name")
        {
            Visible = false;
        }
        modify("Sell-to Contact No.")
        {
            Visible = false;
        }
        modify("Sell-to Contact")
        {
            Visible = false;
        }
        modify(SellToPhoneNo)
        {
            Visible = false;
        }
        modify(SellToMobilePhoneNo)
        {
            Visible = false;
        }
        modify(SellToEmail)
        {
            Visible = false;
        }
        addafter("Sell-to Customer Name")
        {
            field("Sell-to Customer Name 2"; Rec."Sell-to Customer Name 2")
            {
                Caption = 'Customer Name';
                ApplicationArea = all;
                Visible = True;
                Editable = True;
                trigger OnValidate()
                begin
                    CurrPage.Update();
                end;
            }
        }
        // modify("Bill-to Name")
        // {
        //     Visible = Visible_gBool;
        // }
        // addafter("Bill-to Name")
        // {
        //     field("Bill-to Name 2"; Rec."Bill-to Name 2")
        //     {
        //         Caption = 'Name';
        //         ApplicationArea = all;
        //         Visible = Visible_gBool1;
        //         Editable = True;
        //         trigger OnValidate()
        //         begin
        //             CurrPage.Update();
        //         end;
        //     }

        // }
        addafter("Sell-to Country/Region Code")
        {
            field(PhoneNo; Rec.PhoneNo)
            {
                ApplicationArea = all;
                Visible = True;
                Editable = true;
            }
            field(Email; Rec.Email)
            {
                ApplicationArea = all;
                Visible = True;
                Editable = true;
            }
            field(MobileNo; Rec.MobileNo)
            {
                ApplicationArea = all;
                Visible = True;
                Editable = true;
            }
            field("Contact Name"; Rec."Contact Name")
            {
                ApplicationArea = all;
                Visible = True;
                Editable = true;
            }
        }
        addafter("Sell-to Customer No.")
        {
            field("Generic Customer No"; Rec."Generic Customer No")
            {
                Caption = 'Generic Customer No.';
                ApplicationArea = all;
                Visible = true;
                Editable = false;
            }
            field("Job No"; Rec."Job No")
            {
                Caption = 'Project No.';
                ApplicationArea = all;
                Visible = true;
                Editable = false;
            }
        }
        addlast("Shipping and Billing")
        {
            field("Ship to Location Code"; Rec."Ship to Location Code")
            {
                ApplicationArea = all;
                Visible = false;
                Editable = true;
            }
            field("Ship to Service Zone Code"; Rec."Ship to Service Zone Code")
            {
                ApplicationArea = all;
                Visible = false;
                Editable = true;
            }
            field("Ship to Tax Area Code"; Rec."Ship to Tax Area Code")
            {
                ApplicationArea = all;
                Visible = false;
                Editable = true;
            }
            field("Ship to Tax Liable"; Rec."Ship to Tax Liable")
            {
                ApplicationArea = all;
                Visible = false;
                Editable = true;
            }
        }
        addlast("Invoice Details")
        {
            field("Registration Number"; Rec."Registration Number")
            {
                ApplicationArea = All;
            }
            field("VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = All;
            }
            field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = All;
            }
            field("Customer Posting Group"; Rec."Customer Posting Group")
            {
                ApplicationArea = All;
            }
            field("Customer Disc. Group"; Rec."Customer Disc. Group")
            {
                ApplicationArea = All;
            }
            field("Customer Price Group"; Rec."Customer Price Group")
            {
                ApplicationArea = All;
            }
            field("Price Calculation Method"; Rec."Price Calculation Method")
            {
                ApplicationArea = All;
            }
            field("Combine Shipments"; Rec."Combine Shipments")
            {
                ApplicationArea = All;
            }
            field(Reserve; Rec.Reserve)
            {
                ApplicationArea = All;
            }
            field("Shipping Advice"; Rec."Shipping Advice")
            {
                ApplicationArea = All;
            }
            field("Shipping Time"; Rec."Shipping Time")
            {
                ApplicationArea = All;
            }
            field(Comment; Rec.Comment)
            {
                ApplicationArea = All;
            }
            field("Tax Exemption No."; Rec."Tax Exemption No.")
            {

                ApplicationArea = all;

            }
            field("Prepayment %"; Rec."Prepayment %")
            {
                ApplicationArea = All;
            }

        }
        addafter(Status)

        {
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

    actions
    {
        modify(Reopen)
        {
            Enabled = (Rec.Status <> Rec.Status::Open) and (Rec."Job No" = '');
        }
        addafter("&View")
        {
            action(CreateNewCustomer)
            {
                ApplicationArea = All;
                Promoted = true;
                Image = UpdateDescription;
                Caption = 'Create New Customer from Generic';
                Visible = true;
                trigger OnAction()
                var
                    QuoteToJob_Cdu: Codeunit QuoteToJob;
                begin
                    QuoteToJob_Cdu.CreateNewCustomer(Rec, Customer_gRec);
                    //  CurrPage.Close();
                end;
            }

            action(MakeJob)
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Job;
                Caption = 'Make Project';
                Visible = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    QuoteToJob_Cdu: Codeunit QuoteToJob;
                begin
                    QuoteToJob_Cdu.MakeJob(Rec, Customer_gRec);
                end;
            }
            action(OpenJob)
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Job;
                Caption = 'Open Project';
                Visible = true;
                PromotedCategory = Process;
                // RunObject = page "Job Card";
                // RunPageLink = "No." = field("Job No");
                trigger OnAction()
                var
                    JobCard_lPage: Page "Job Card";
                    Job_lRec: Record Job;
                begin
                    if Rec."Job No" = '' then
                        Message('Project does not exists with this Sales Quote - %1, Kindly create a new project.', Rec."No.")
                    else begin
                        Job_lRec.Reset();
                        Job_lRec.Get(Rec."Job No");
                        // JobCard_lPage.SetTableView(Job_lRec);
                        JobCard_lPage.SetRecord(Job_lRec);
                        JobCard_lPage.run;
                    end;
                end;
            }
        }
    }


    trigger OnOpenPage()
    begin
        StatusEditable := true;
        if (Rec."No." <> '') and (Rec."Sell-to Customer Name 2" <> '') then
            DataCaption_gTex := Rec."No." + ' . ' + Rec."Sell-to Customer Name 2";
    end;


    trigger OnAfterGetRecord()
    var
        Customer_lRec: Record Customer;
    begin
        If Rec."Job No" = '' then
            StatusEditable := true
        else
            StatusEditable := false;
        // if Customer_lRec.Get(Rec."Sell-to Customer No.") then begin
        //     if Customer_lRec."Is Generic Customer" then begin
        //         Visible_gBool := false;
        //         Visible_gBool1 := true;
        //     end
        //     else begin
        //         Visible_gBool := true;
        //         Visible_gBool1 := false;
        //     end;
        // end;


        if User_gRec.Get(Rec.SystemCreatedBy) then;
        if User_gRec1.Get(Rec.SystemModifiedBy) then;
        if (Rec."No." <> '') and (Rec."Sell-to Customer Name 2" <> '') then begin
            DataCaption_gTex := Rec."No." + ' . ' + Rec."Sell-to Customer Name 2";
        end;
    end;



    procedure SetStyle(): Text
    begin
        if (Rec."Quote Valid Until Date" <> 0D) and (WorkDate() > Rec."Quote Valid Until Date") then
            exit('Unfavorable');

        exit('');
    end;

    var
        Customer_gRec: Record Customer;
        StatusEditable: Boolean;

        User_gRec: Record User;
        User_gRec1: Record User;

        DataCaption_gTex: Text[200];
        Visible_gBool: Boolean;
        Visible_gBool1: Boolean;

}
