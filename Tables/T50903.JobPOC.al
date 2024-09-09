table 50903 "Job POC"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CUSTNMBR; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; CUSTNAME; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; WS_Job_Number; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; Divisions; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(5; AdjTotalPostedCost; Decimal)
        {
            Caption = 'Adj Total Posted Cost';
            DataClassification = ToBeClassified;

        }
        field(6; "Adj Calc Est Cost"; Decimal)
        {
            Caption = 'Adj Calc Estimated Cost ';
            DataClassification = ToBeClassified;

        }
        field(7; "Adj % Complete"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(8; "Calc Contract Amt"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(9; "Revenue Earned"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(10; "Net Billed"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(11; "Adj Accrual (Deferral)"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(12; "Adj Accrued Revenue"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(13; "Adj Deffered Revenue"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(14; "##"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(15; "Billing$"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(16; "%Billed"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(17; "Billing Returns$"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(18; "Orig Contract Amt"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(19; "Unposted Billing$"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(20; "Labor Unposted$"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(21; "Unposted Material Cost$"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(22; "Actual material Cost$"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(23; "SOP_Cost$"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(24; "Cost returns$"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(25; "Posted labor$"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(26; "Posted Other$"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(27; "File Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(28; "File Imported Date"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(29; "File Imported By"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(30; "Is processed"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(31; Error; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(32; "Error Message"; Text[250])
        {
            DataClassification = ToBeClassified;

        }
        field(33; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(34; "Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Item Details error"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "No. of items"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Job Item Details" WHERE(WS_Job_Number = FIELD(WS_Job_Number)));
        }
        field(37; "BCdimension1"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "BCdscriptnDim1"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(pk; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }


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