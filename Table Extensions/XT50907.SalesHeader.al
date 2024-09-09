

tableextension 50907 SalesQuoteExtension extends "Sales Header"
{
    // DataCaptionFields = DataClassifieldFiled_gTxt;
    fields
    {

        field(65100; "Generic Customer No"; Code[20])
        {
            Caption = 'Generic Customer No';
            DataClassification = ToBeClassified;
        }
        field(65101; "Job No"; Code[20])
        {
            Caption = 'Project No.';
            DataClassification = ToBeClassified;
        }
        field(65102; MobileNo; Text[30])
        {
            Caption = 'Mobile No.';
            DataClassification = ToBeClassified;
        }
        field(65103; PhoneNo; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
        }
        field(65104; "Email"; Text[80])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
        }
        field(65105; "Contact Name"; Text[100])
        {
            Caption = 'Contact Name';
            DataClassification = ToBeClassified;
        }
        field(65106; "Ship to Contact"; Text[100])
        {
            Caption = 'Ship to Contact';
            DataClassification = ToBeClassified;
        }
        field(65107; "Ship to Location Code"; code[20])
        {
            Caption = 'Ship to Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(65108; "Ship to Service Zone Code"; Text[100])
        {
            Caption = 'Ship to Service Zone Code';
            DataClassification = ToBeClassified;
        }
        field(65109; "Ship to Tax Liable"; Boolean)
        {
            Caption = 'Ship to Tax Liable';
            DataClassification = ToBeClassified;
        }
        field(65110; "Ship to Tax Area Code"; Code[20])
        {
            Caption = 'Ship to Tax Area Code';
            DataClassification = ToBeClassified;
            TableRelation = "Tax Area";
        }
        modify("Sell-to Customer Name 2")
        {
            trigger OnBeforeValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.get(Rec."Sell-to Customer No.") then begin
                    if not Customer."Is Generic Customer" then begin
                        Rec.TestField("Sell-to Customer Name 2");
                        if Rec."Sell-to Customer Name 2" <> Customer.Name then
                            Rec.FieldError("Sell-to Customer Name 2", 'You cannot edit the Customer Name for Non-Generic Customer');
                    end;
                end;
            end;
        }

    }

    // var
    //     DataClassifieldFiled_gTxt: List of [Text[200]];
}
