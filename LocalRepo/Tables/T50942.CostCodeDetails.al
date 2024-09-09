table 50942 "Wensoft Cost Code Details"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "WS_Job_Number"; code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Project_Number"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Cost_Code_Number_1"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Cost_Code_Number_2"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Cost_Code_Number_3"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Cost_Code_Number_4"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Cost_Code_Alias"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Cost_Code_Description"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Cost_Element"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "WS_Manager_ID"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "WS_Inactive"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Profit_Type_Number"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Profit_Amount"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Type_of_Transaction"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Next_Subdivision_Type"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "WS_Account_Index_1"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "WS_Account_Index_2"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Added_By_CO_Module"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Track_Production_Qty"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Cost_Code_Act_Cost_TTD"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Cost_Code_Act_Cost_YTD"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Actual_Units_TTD"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Cost_Code_Estimated_Cst"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Change_Order_Est_Cost"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Cost_Code_Rvsd_Est_Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Cost_Code_Forecast_Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Cost_Code_Rvsd_Forecast"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Forecasted_Units"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Committed_Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Committed_Units"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Cost_Code_Est_Unit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Estimated_Amt_Units"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Production_Estimate_Qty"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Production_Actual_Qty"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Production_Qty_Unit"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Production_Qty_Curr_Per"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Production_Best"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Production_Best_Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Production_Measure_Code"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "OVHD1_UOM"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "OVHD1_Type"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "OVHD1_Percent"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "OVHD1_Estimated_Units"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "OVHD1_Actual_Units"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(46; "OVHD1_Forecasted_Units"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(47; "OVHD1_Amt_Per_Unit"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(48; "OVHD1_Estimated_Amount"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(49; "OVHD1_Actual_Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50; "OVHD1_Profit_Type"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(51; "OVHD1_Profit_Amount"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(52; "OVHD2_UOM"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(53; "OVHD2_Type"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(54; "OVHD2_Percent"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(55; "OVHD2_Estimated_Units"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(56; "OVHD2_Actual_Units"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(57; "OVHD2_Forecasted_Units"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(58; "OVHD2_Amt_Per_Unit"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(59; "OVHD2_Estimated_Amount"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(60; "OVHD2_Actual_Amount"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(61; "OVHD2_Profit_Type"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(62; "OVHD2_Profit_Amount"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(63; "Bill_Type"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(64; "Sched_Completion_Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(65; "ACTCOMPDATE"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(66; "Schedule_Start_Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(67; ACTSTARTDATE; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(68; "Billing_Schedule_Line"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(69; "Estimated_Measure_Code"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70; "Amount_Pct_Complete"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(71; "Units_Pct_Complete"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(72; "Production_Pct_Complete"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(73; "Field_Pct_Complete"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(74; "Posted_To"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(75; "WRKRCOMP"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(76; "Change_Order_Est_Units"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(77; "Labor_Group_Name"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(78; "USERID"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(79; "User_Define_1"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(80; "User_Define_2"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(81; "USERDEF1"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(82; "USERDEF2"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(83; "User_Def_Integer_1"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(84; "User_Def_Integer_2"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85; "User_Defined_Integer_3"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(86; "User_Defined_Integer_4"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(87; "User_Defined_Dollar_1"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(88; "User_Defined_Dollar_2"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(89; "User_Defined_Dollar_3"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(90; "User_Defined_Dollar_4"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(91; "USRDAT01"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(92; "USRDAT02"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(93; "User_Defined_Date_3"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(94; "User_Defined_Date_4"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(95; "User_Defined_CB_1"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(96; "User_Defined_CB_2"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(97; "User_Defined_CB_3"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(98; "User_Defined_CB_4"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(99; "VNDRNMBR"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(100; "ITEMNMBR"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(101; "PORDNMBR"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(102; "CC_Rvsd_Forecast_Units"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(103; "Rate_Per_Unit"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(104; "Original_Estimate_Units"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(105; "Original_Forecast_Units"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(106; "Wennsoft_Affiliate"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(107; "Wennsoft_Branch"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(108; "Wennsoft_Region"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(109; "MODIFDT"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(110; "Modified_Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(111; "MDFUSRID"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(112; "SV_Language_ID"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(113; "Time_Zone"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(114; "WSReserved_CB1"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(115; "WSReserved_CB2"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(116; "WSReserved_CB3"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(117; "WSReserved_CB4"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(118; "WSReserved_CB5"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(119; "WSReserved_CB6"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(120; "WSReserved_CB7"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(121; "WSReserved_CB8"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(122; "WSReserved_CB9"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(123; "WSReserved_CB10"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(124; "WSReserved_STR1"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(125; "WSReserved_STR2"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(126; "Revenue_Code"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(127; "DEX_ROW_ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(128; "File Name"; Text[120])
        {
            DataClassification = ToBeClassified;

        }
        field(129; "File Imported Date"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(130; "File Imported By"; Code[50])
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