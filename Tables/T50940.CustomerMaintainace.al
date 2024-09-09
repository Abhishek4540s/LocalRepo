table 50940 "Customer Maintainence"
{
    DataClassification = ToBeClassified;
    caption = 'Customer Maintainence';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Customer ID"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Name; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Short Name"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Parent Customer ID "; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Statment Name"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Class ID"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "SalesPerson ID"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Territory ID"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "User Defined 1"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "User Defined2"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "UPS Zone"; code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Shipping Method"; code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Tax Schedule ID"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Comment 1"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Comment 2"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Trade Discount"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Payment Terms"; code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Discout Grace Period"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Due Date Grace Period"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Price Level"; code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Priority"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Contact Person 1"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Phone 1"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Contact Person 2"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Phone 2"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Phone 3"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Fax"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Hold"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Inactive"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Salesperson Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Address ID"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Location Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Address"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "City"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "State"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Zip Code"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Country Code"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Country"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Ship to"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Bill to"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Statment To"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Service Area"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Primary Technician "; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(45; "Secondary Technician"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Labor Rate Group"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Price Matrix"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Division"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Service Call Priority"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "PO Required"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(51; "Service Level ID"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(52; "Time Zone"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(53; "File Name"; Text[120])
        {
            DataClassification = ToBeClassified;

        }
        field(54; "File Imported Date"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(55; "File Imported By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}