table 50944 "JC_Job_Detail_Summary"
{
    DataClassification = ToBeClassified;
    Caption = 'JC_Job_Detail_Summary';
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No';
        }
        field(2; WS_Job_Number; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Project_Number; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; YEAR1; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(5; PERIODID; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(6; Cost_Code_Number_1; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(7; Cost_Code_Number_2; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(8; Cost_Code_Number_3; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(9; Cost_Code_Number_4; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(10; Cost_Element; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(11; Cost_Code_Actual_Cost; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(12; Actual_Units_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(13; Cost_Code_Actual_Mkp_Cst; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(14; Revsd_Forecast_Cost; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(15; Revsd_Forecast_Units; Decimal)
        {

            DataClassification = ToBeClassified;

        }
        field(16; USERID; Text[50])
        {

            DataClassification = ToBeClassified;

        }
        field(17; User_Define_1; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(18; User_Define_2; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19; USERDEF1; Code[20])
        {

            DataClassification = ToBeClassified;

        }
        field(20; USERDEF2; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(21; User_Def_Integer_1; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(22; User_Def_Integer_2; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(23; User_Defined_Integer_3; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(24; User_Defined_Integer_4; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(25; User_Defined_Dollar_1; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(26; User_Defined_Dollar_2; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(27; User_Defined_Dollar_3; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(28; User_Defined_Dollar_4; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(29; USRDAT01; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(30; USRDAT02; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(31; User_Defined_Date_3; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(32; User_Defined_Date_4; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(33; User_Defined_CB_1; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(34; User_Defined_CB_2; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(35; User_Defined_CB_3; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(36; User_Defined_CB_4; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(37; Wennsoft_Affiliate; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(38; Wennsoft_Branch; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(39; Wennsoft_Region; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(40; MODIFDT; DateTime)
        {
            DataClassification = ToBeClassified;

        }

        field(41; Modified_Time; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(42; MDFUSRID; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(43; SV_Language_ID; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(44; Time_Zone; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(45; WSReserved_CB1; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(46; WSReserved_CB2; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(47; WSReserved_CB3; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(48; WSReserved_CB4; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(49; WSReserved_CB5; Integer)
        {

            DataClassification = ToBeClassified;

        }
        field(50; WSReserved_STR1; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(51; WSReserved_STR2; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(52; DEX_ROW_ID; Integer)
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