table 50948 SSTAZ_SV_MAint_Invoice_MSTR
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No';
        }
        field(2; CUSTNMBR; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; ADRSCODE; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Contract_Number; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; WSCONTSQ; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; DATE1; text[30])
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
        field(11; Technician_ID; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Technician_Team; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Corporate_Invoice_Number; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; Corporate_Contract_Nbr; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15; WSMSTRCONTSQ; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16; Position_on_Invoice; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17; Wennsoft_Billing_Date; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18; Wennsoft_Period_ID; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19; Billable_Tax; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; Billable_Subtotal; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; Tax_Detail_ID_1; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(22; Tax_Amount1; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23; Tax_Detail_ID_2; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(24; Tax_Amount2; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25; Tax_Detail_ID_3; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(26; Tax_Amount3; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(27; Tax_Detail_ID_4; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(28; Tax_Amount_4; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(29; Billable_All; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30; PORDNMBR; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(31; Invoice_Comment_ID_1; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(32; Invoice_Comment_ID_2; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(33; Contract_Billing_Desc; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(34; Billing_Date; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(35; RMDNUMWK; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(36; RMDTYPAL; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(37; PB_ACTINDX; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(38; SLPRSNID; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(39; COMPRCNT; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(40; Commission_Pct_of_Sale; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(41; COMMERNG; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(42; SALSTERR; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(43; Salesperson_ID_2; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(44; Commission_Percent_2; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(45; Commission_Pct_of_Sale_2; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(46; Commission_Earnings_2; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(47; Sales_Territory_2; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(48; Invoice_Style; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(49; No_Times_Printed; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50; Printed_Date; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(51; Wennsoft_Posting_Status; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(52; MODIFDT; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(53; Modified_Time; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(54; MDFUSRID; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(55; Time_Zone; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(56; SV_Language_ID; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(57; Base_Currency_ID; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(58; Base_Curr_Conv_Factor; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(59; Billing_Currency_ID; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60; Billing_Curr_Conv_Factor; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(61; Local_Currency_ID; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(62; Base_Currency_Amount; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(63; Billing_Currency_Amount; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(64; Billable_Escalation; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(65; Billable_Total; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(66; Escalation_Idx_ID_Equip; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(67; Escal_Idx_ID_Material; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(68; Escalation_Idx_ID_Labor; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(69; Escalation_Index_ID_Subs; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70; Escalation_Idx_ID_Other; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(71; Escalation_Pct_Equip; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(72; Escalation_Pct_Material; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(73; Escalation_Pct_Labor; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(74; Escalation_Pct_Subs; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(75; Escalation_Pct_Other; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(76; Escal_Fixed_Amt_Equip; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(77; Escalation_Fixed_Amt_Mat; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(78; Escal_Fixed_Amt_Labor; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(79; Escal_Fixed_Amt_Subs; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(80; Escal_Fixed_Amt_Other; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(81; Contract_Escalation_Desc; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(82; Bill_Customer_Number; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(83; Bill_Address_Code; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(84; WSReserved_CB1; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(85; WSReserved_CB2; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(86; WSReserved_CB3; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(87; WSReserved_CB4; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(88; WSReserved_CB5; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(89; WSReserved_CB6; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(90; WSReserved_CB7; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(91; WSReserved_CB8; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(92; WSReserved_CB9; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(93; WSReserved_CB10; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(94; WSReserved_STR1; TEXT[50])
        {
            DataClassification = ToBeClassified;
        }
        field(95; WSReserved_STR2; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(96; WS_GL_Posting_Date; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(97; DEX_ROW_ID; code[50])
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