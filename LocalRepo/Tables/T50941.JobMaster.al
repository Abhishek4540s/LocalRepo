table 50941 "Wennsoft Job Master"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; WS_Job_Number; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Project_Number; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; WS_Job_Name; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Divisions; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; CUSTNMBR; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Job_Address_Code; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Bill_Customer_Number; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Job_Billto_Address_Code; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Estimator_ID; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; WS_Manager_ID; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; USERID; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Bid_Due_Date; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Schedule_Start_Date; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(15; Sched_Completion_Date; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(16; ACTCOMPDATE; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(17; Est_Labor_Cost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; Est_Material_Cost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; Est_Equipment_Cost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; Est_Subs_Cost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; Est_Misc_Other_Cost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; Est_Cost_UserDef1; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; Est_Cost_UserDef2; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; Est_Cost_UserDef3; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25; Est_Cost_UserDef4; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26; Total_Estimated_Cost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27; Est_Labor_Cost_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; Est_Equip_Cost_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; Est_Materials_Cost_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30; Est_Subs_Cost_Markup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31; Est_Misc_Other_Cst_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32; Est_UserDef1_Cost_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33; Est_UserDef2_Cost_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; Est_UserDef3_Cost_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(35; Est_UserDef4_Cost_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36; Total_Est_Plus_Markup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(37; Calc_Pct_Compl_to_Date; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(38; Est_Pct_Complete_to_Date; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(39; JC_Contract_Number; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(40; Contract_Type; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(41; WS_Billing_Type; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(42; Project_Billing; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(43; Overhead_Labor_Pct; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(44; Overhead_User_Def_Pct; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(45; Overhead_Flat_Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(46; Orig_Contract_Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(47; Originating_Contract_Amt; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(48; Contract_Max_Bill_Amt; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(49; Confirmed_Chg_Order_Amt; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50; In_Process_Chg_Ord_Amt; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(51; CO_Amount_UserDef1; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(52; CO_Amount_UserDef2; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(53; CO_Amount_UserDef3; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(54; Contract_to_Date; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(55; Orig_Contract_To_Date; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(56; Retention_Pct; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(57; Act_Labor_Cost_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(58; Act_Materials_Cost_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59; Act_Equipment_Cost_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60; Act_Subs_Cost_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(61; Act_Misc_Other_Cost_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(62; Act_Cost_TTD_UserDef1; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(63; Act_Cost_TTD_UserDef2; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(64; Act_Cost_TTD_UserDef3; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(65; Act_Cost_TTD_UserDef4; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(66; Total_Actual_Cost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(67; Act_Labor_Cost_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(68; Act_Equip_Cost_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69; Act_Materials_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70; Act_Subs_Cost_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(71; Act_Other_Cost_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(72; Act_UserDef1_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(73; Act_UserDef2_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(74; Act_UserDef3_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(75; Act_UserDef4_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(76; Billed_Labor_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(77; Billed_Mat_Cst_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(78; Billed_EquipTTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(79; Billed_Subs_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80; Billed_Other_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(81; Billed_UsrDef1_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(82; Billed_UsrDef2_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(83; Billed_UsrDef3_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(84; Billed_UsrDef4_TTD_Mkup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(85; Billed_Amount_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(86; Retention_Amount_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(87; Retention_Billed_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(88; Net_Billed_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(89; Cash_Received_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(90; Billed_YTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(91; Retention_Amount_YTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(92; Retention_Billed_YTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(93; MSCTXAMT; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(94; TAXAMNT; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(95; DISCAMNT; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(96; WROFAMNT; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(97; Net_Billed_YTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(98; Cash_Received_YTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(99; Last_Billing_Date; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(100; Expected_Contract; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(101; Orig_Expected_Contract; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(102; CURNCYID; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(103; CURRNIDX; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(104; XCHGRATE; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(105; EXCHDATE; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(106; TIME1; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(107; RATETPID; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(108; EXGTBLID; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(109; Act_Labor_Cost_YTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(110; Act_Materials_Cost_YTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(111; Act_Equipment_Cost_YTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(112; Act_Subs_Cost_YTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(113; Act_Misc_Other_YTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(114; Act_Cost_YTD_UserDef1; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(115; Act_Cost_YTD_UserDef2; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(116; Act_Cost_YTD_UserDef3; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(117; Act_Cost_YTD_UserDef4; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(118; Tax_Exempt_Number; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(119; TAXSCHID; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(120; Committed_Equipment_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(121; Committed_Materials_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(122; Committed_Labor_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(123; Committed_Subs_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(124; Committed_Other_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(125; Committed_TTD_UserDef1; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(126; Committed_TTD_UserDef2; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(127; Committed_TTD_UserDef3; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(128; Committed_TTD_UserDef4; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(129; Committed_Cost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(130; Forecast_Equipment_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(131; Forecasted_Labor_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(132; Forecast_Materials_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(133; Forecast_Misc_Other_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(134; Forecasted_Subs_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(135; Forecast_UserDef1; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(136; Forecast_UserDef2; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(137; Forecast_UserDef3; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(138; Forecast_UserDef4; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(139; Total_Forecasted_Cost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(140; Revsd_Equip_Forecasted; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(141; Revsd_Labor_Forecasted; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(142; Revsd_Materials_Forecst; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(143; Revsd_Subs_Forecast_Cst; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(144; Revsd_Other_Forecst_Cst; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(145; Revsd_Forecast_UserDef1; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(146; Revsd_Forecast_UserDef2; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(147; Revsd_Forecast_UserDef3; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(148; Revsd_Forecast_UserDef4; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(149; Tot_Revsd_Forecast_Cost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(150; Est_Labor_Units_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(151; Act_Labor_Units_TTD; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(152; Anticipated_Markup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(153; SUTASTAT; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(154; LOCALTAX; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(155; Certified_Payroll; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(156; RATECLSS; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(157; Exclude_from_POC_Calc; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(158; WS_Markup_Percent; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(159; Revsd_Forecast_Lab_Units; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(160; Total_Act_Plus_Markup; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(161; User_Define_1; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(162; User_Define_2; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(163; USERDEF1; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(164; USERDEF2; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(165; User_Def_Integer_1; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(166; User_Def_Integer_2; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(167; User_Defined_Integer_3; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(168; User_Defined_Integer_4; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(169; User_Defined_Dollar_1; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(170; User_Defined_Dollar_2; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(171; User_Defined_Dollar_3; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(172; User_Defined_Dollar_4; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(173; USRDAT01; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(174; USRDAT02; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(175; User_Defined_Date_3; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(176; User_Defined_Date_4; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(177; User_Defined_CB_1; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(178; User_Defined_CB_2; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(179; User_Defined_CB_3; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(180; User_Defined_CB_4; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(181; Wennsoft_Affiliate; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(182; Wennsoft_Branch; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(183; Wennsoft_Region; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(184; MODIFDT; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(185; Modified_Time; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(186; MDFUSRID; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(187; SV_Language_ID; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(188; Time_Zone; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(189; Technician_ID; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(190; Technician_Team; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(191; WS_Inactive; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(192; WSReserved_CB1; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(193; WSReserved_CB2; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(194; WSReserved_CB3; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(195; WSReserved_CB4; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(196; WSReserved_CB5; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(197; WSReserved_CB6; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(198; WSReserved_CB7; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(199; WSReserved_CB8; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(200; WSReserved_CB9; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(201; WSReserved_CB10; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(202; WSReserved_STR1; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(203; WSReserved_STR2; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(204; CREATDDT; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(205; CRUSRID; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(206; Reimbursable; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(207; Job_Customer_ID; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(208; USETAXSCHID; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(209; STATECD; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(210; Invoice_Style; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(211; Revenue_Rec_Method_ID; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(212; Exclude_from_RPO_Calc; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(213; DEX_ROW_ID; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(214; "File Name"; Text[120])
        {
            DataClassification = ToBeClassified;

        }
        field(215; "File Imported Date"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(216; "File Imported By"; Code[50])
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