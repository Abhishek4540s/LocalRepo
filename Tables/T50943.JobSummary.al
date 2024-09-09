table 50943 "Wennsoft Job Summary"
{
    DataClassification = ToBeClassified;
    Caption = 'Wennsoft Job Summary';
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
        field(3; PERIODID; Integer)
        {
            DataClassification = ToBeClassified;

        }

        field(4; YEAR1; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(5; Project_Number; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(6; WS_Job_Name; Text[50])
        {
            DataClassification = ToBeClassified;

        }

        field(7; Divisions; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(8; CUSTNMBR; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(9; JC_Contract_Number; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(10; Contract_Type; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(11; WS_Billing_Type; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(12; Contract_to_Date; Decimal)//value of date: 8.48, unable to load the data ,so taking datatype as decimal
        {
            DataClassification = ToBeClassified;

        }
        field(13; Retention_Pct; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(14; Actual_Units_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(15; Act_Labor_Cost_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(16; Act_Materials_Cost_TTD; Decimal)
        {

            DataClassification = ToBeClassified;

        }
        field(17; Act_Equipment_Cost_TTD; Decimal)
        {

            DataClassification = ToBeClassified;

        }
        field(18; Act_Subs_Cost_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(19; Act_Misc_Other_Cost_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; Act_Cost_TTD_UserDef1; Decimal)
        {

            DataClassification = ToBeClassified;

        }
        field(21; Act_Cost_TTD_UserDef2; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(22; Act_Cost_TTD_UserDef3; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(23; Act_Cost_TTD_UserDef4; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(24; Total_Actual_Cost; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(25; Orig_Contract_Amount; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(26; Contract_Earned; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(27; Contract_Earned_Curr_Mo; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(28; Billed_Labor_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(29; Billed_Mat_Cst_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(30; Billed_EquipTTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(31; Billed_Subs_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(32; Billed_Other_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(33; Billed_UsrDef1_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(34; Billed_UsrDef2_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(35; Billed_UsrDef3_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(36; Billed_UsrDef4_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(37; Billed_Amount_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(38; Retention_Amount_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(39; Retention_Billed_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(40; Net_Billed_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(41; Cash_Received_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(42; MSCTXAMT; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(43; TAXAMNT; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(44; DISCAMNT; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(45; WROFAMNT; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(46; Last_Billing_Date; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(47; Expected_Contract; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(48; Committed_Equipment_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(49; Committed_Materials_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50; Committed_Labor_TTD; Decimal)
        {

            DataClassification = ToBeClassified;

        }
        field(51; Committed_Subs_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(52; Committed_Other_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(53; Committed_TTD_UserDef1; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(54; Committed_TTD_UserDef2; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(55; Committed_TTD_UserDef3; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(56; Committed_TTD_UserDef4; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(57; Committed_Cost; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(58; Revsd_Equip_Forecasted; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(59; Revsd_Labor_Forecasted; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(60; Revsd_Materials_Forecst; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(61; Revsd_Subs_Forecast_Cst; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(62; Revsd_Other_Forecst_Cst; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(63; Revsd_Forecast_UserDef1; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(64; Revsd_Forecast_UserDef2; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(65; Revsd_Forecast_UserDef3; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(66; Revsd_Forecast_UserDef4; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(67; Tot_Revsd_Forecast_Cost; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(68; Confirmed_Chg_Order_Amt; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(69; In_Process_Chg_Ord_Amt; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(70; CO_Amount_UserDef1; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(71; CO_Amount_UserDef2; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(72; CO_Amount_UserDef3; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(73; Est_Labor_Units_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(74; Act_Labor_Units_TTD; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(75; Total_Act_Plus_Markup; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(76; Revsd_Forecast_Lab_Units; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(77; User_Define_1; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(78; User_Define_2; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(79; USERDEF1; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(80; USERDEF2; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(81; User_Def_Integer_1; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(82; User_Def_Integer_2; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(83; User_Defined_Integer_3; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(84; User_Defined_Integer_4; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(85; User_Defined_Dollar_1; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(86; User_Defined_Dollar_2; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(87; User_Defined_Dollar_3; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(88; User_Defined_Dollar_4; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(89; USRDAT01; DateTime)
        {
            DataClassification = ToBeClassified;

        }

        field(90; USRDAT02; DateTime)
        {
            DataClassification = ToBeClassified;

        }

        field(91; User_Defined_Date_3; DateTime)
        {
            DataClassification = ToBeClassified;

        }

        field(92; User_Defined_Date_4; DateTime)
        {
            DataClassification = ToBeClassified;

        }

        field(93; User_Defined_CB_1; Integer)
        {
            DataClassification = ToBeClassified;

        }

        field(94; User_Defined_CB_2; Integer)
        {
            DataClassification = ToBeClassified;

        }

        field(95; User_Defined_CB_3; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(96; User_Defined_CB_4; Integer)
        {
            DataClassification = ToBeClassified;

        }

        field(97; Wennsoft_Affiliate; Code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(98; Wennsoft_Branch; Code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(99; Wennsoft_Region; Code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(100; MODIFDT; Date)
        {
            DataClassification = ToBeClassified;

        }

        field(101; Modified_Time; Time)
        {
            DataClassification = ToBeClassified;

        }

        field(102; MDFUSRID; text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(103; SV_Language_ID; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(104; Time_Zone; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(105; Technician_ID; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(106; Technician_Team; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(107; DEX_ROW_ID; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(108; "File Name"; Text[120])
        {
            DataClassification = ToBeClassified;

        }
        field(109; "File Imported Date"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(110; "File Imported By"; Code[50])
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



}