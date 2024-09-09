table 50949 "SSTAZ_Contract_Billing"
{
    DataClassification = ToBeClassified;
    Caption = 'SSTAZ_Contract_billing';
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No';
        }
        field(2; CUSTNMBR; text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(3; ADRSCODE; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Contract_Number; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; WSCONTSQ; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; SEQNUMBR; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Wennsoft_Affiliate"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Wennsoft_Region"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Wennsoft_Branch"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "USERID"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Technician_ID; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Technician_Team; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Wennsoft_Close_Date; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; YEAR1; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15; PERIODID; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Contract_Billing_Desc; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17; Billing_Date; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18; Corporate_Invoice_Number; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19; Corporate_Contract_Nbr; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(20; WSMSTRCONTSQ; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(21; RMDTYPAL; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(22; Tax_Detail_ID_1; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(23; Tax_Amount1; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(24; Tax_Detail_ID_2; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(25; Tax_Amount2; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(26; Tax_Detail_ID_3; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(27; Tax_Amount3; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(28; Tax_Detail_ID_4; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(29; Tax_Amount_4; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(30; DOCAMNT; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31; Escalation_Idx_ID_Equip; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(32; Escal_Idx_ID_Material; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(33; Escalation_Idx_ID_Labor; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(34; Escalation_Index_ID_Subs; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(35; Escalation_Idx_ID_Other; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(36; Escalation_Pct_Equip; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(37; Escalation_Pct_Material; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(38; Escalation_Pct_Labor; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(39; Escalation_Pct_Subs; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(40; Escalation_Pct_Other; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(41; Escal_Fixed_Amt_Equip; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(42; Escalation_Fixed_Amt_Mat; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(43; Escal_Fixed_Amt_Labor; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(44; Escal_Fixed_Amt_Subs; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(45; Escal_Fixed_Amt_Other; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(46; Billable_Escalation; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(47; Billable_Total; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(48; Contract_Escalation_Desc; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(49; DATE1; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50; POSTDATE; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(51; Period2; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(52; WS_Closed; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(53; Invoice_Comment_ID_1; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(54; Invoice_Comment_ID_2; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(55; SLPRSNID; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(56; COMPRCNT; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(57; Commission_Pct_of_Sale; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(58; COMMERNG; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(59; SALSTERR; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60; Salesperson_ID_2; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(61; Commission_Percent_2; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(62; Commission_Pct_of_Sale_2; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(63; Commission_Earnings_2; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(64; Sales_Territory_2; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65; Invoice_Style; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(66; Service_User_Define_1; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(67; Service_User_Define_2; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(68; Service_User_Define_3; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(69; Service_User_Define_4; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70; Service_User_Define_5; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(71; Service_User_Define_6; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(72; Service_User_Define_7; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(73; Service_User_Define_8; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(74; Service_User_Define_9; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(75; Service_User_Define_10; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(76; Service_User_Define_11; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(77; Service_User_Define_12; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(78; Service_User_Define_18; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(79; Service_User_Define_19; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(80; Service_User_Define_20; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(81; Service_User_Define_21; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(82; Service_User_Define_22; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(83; Service_User_Define_23; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(84; Service_User_Define_24; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(85; Service_User_Define_25; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(86; MODIFDT; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(87; Modified_Time; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(88; MDFUSRID; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(89; Time_Zone; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(90; Base_Currency_ID; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(91; Base_Curr_Conv_Factor; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(92; Billing_Currency_ID; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(93; Billing_Curr_Conv_Factor; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(94; Local_Currency_ID; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(95; Bill_Customer_Number; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(96; Bill_Address_Code; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(97; RMDNUMWK; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(98; ACTINDX_CR; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(99; ACTINDX_DR; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(100; GLPOSTDT; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(101; JRNENTRY; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(102; WSReserved_CB1; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(103; WSReserved_CB2; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(104; WSReserved_CB3; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(105; WSReserved_CB4; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(106; WSReserved_CB5; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(107; WSReserved_STR1; TEXT[50])
        {
            DataClassification = ToBeClassified;
        }
        field(108; WSReserved_STR2; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(109; DEX_ROW_ID; code[50])
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