table 50923 "ManBllgBill2Ship2Address"
{
    DataClassification = ToBeClassified;
    Caption = 'ManBllgBill2Ship2Address';
    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'EntryNo';

        }
        field(21; Contract; code[11])
        {
            DataClassification = ToBeClassified;
            Caption = 'Contract#';
        }
        field(22; Cust; Code[15])
        {
            DataClassification = ToBeClassified;
            Caption = 'Cust_#';
        }
        field(23; Cust_Name; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(24; dbo_SV00500_ADRSCODE; Text[15])
        {
            DataClassification = ToBeClassified;
            Caption = 'dbo_SV00500.ADRSCODE';
        }
        field(25; dbo_RM00101_ADRSCODE; Text[15])
        {
            DataClassification = ToBeClassified;
            Caption = 'dbo_RM00101.ADRSCODE';
        }
        field(26; CUSTCLAS; Text[15])
        {
            DataClassification = ToBeClassified;

        }
        field(27; BillTo_Name; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(28; BillToAddr1; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(29; BillToAddr2; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(30; BillToAddr3; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(31; BillToAddr4; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(32; BillTo_City; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(33; BillTo_State; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(34; BillTo_Zip; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(35; ShipTo_Name; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(36; ShipToAddr1; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(37; ShipToAddr2; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(38; ShipToAddr3; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(39; ShipToAddr4; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(40; ShipTo_City; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(41; ShipTo_State; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(42; ShipTo_Zip; code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(43; Description; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(44; Development; Text[100])
        {
            DataClassification = ToBeClassified;

        }

    }

    keys
    {
        key(Key1; EntryNo)
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