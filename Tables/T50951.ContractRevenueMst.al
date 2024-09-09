table 50951 "Contract Revenue Method MSTR"
{
    DataClassification = ToBeClassified;
    Caption = 'Contract Revenue Method MSTR';

    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No';
        }
        field(2; CUSTNMBR; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; ADRSCODE; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(4; Contract_Number; code[30])
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
        field(7; Wennsoft_Affiliate; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(8; Wennsoft_Region; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(9; Wennsoft_Branch; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(10; USERID; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(11; Technician_ID; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(12; Technician_Team; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(13; YEAR1; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14; PERIODID; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(15; DOCAMNT; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(16; DATE1; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(17; POSTDATE; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(18; WS_Closed; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(19; MODIFDT; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(20; Modified_Time; Time)
        {
            DataClassification = ToBeClassified;

        }
        field(21; MDFUSRID; Text[50])
        {
            DataClassification = ToBeClassified;

        }

        field(22; Time_Zone; Text[50])
        {
            DataClassification = ToBeClassified;

        }

        field(23; Base_Currency_ID; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(24; Base_Curr_Conv_Factor; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(25; Billing_Currency_ID; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(26; Billing_Curr_Conv_Factor; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(27; Local_Currency_ID; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(28; GLJournalEntry; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(29; PB_ACTINDX; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(30; CE_ACTINDX; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(31; PB_SEQNUMBR; Integer)
        {
            DataClassification = ToBeClassified;

        }

        field(32; CE_SEQNUMBR; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(33; WSReserved_CB1; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(34; WSReserved_CB2; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(35; WSReserved_CB3; Integer)
        {
            DataClassification = ToBeClassified;

        }

        field(36; WSReserved_CB4; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(37; WSReserved_CB5; Integer)
        {
            DataClassification = ToBeClassified;

        }

        field(38; WSReserved_STR1; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(39; WSReserved_STR2; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(40; RMDTYPAL; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(41; ACTINDX_CR; Integer)
        {

            DataClassification = ToBeClassified;

        }
        field(42; ACTINDX_DR; Integer)
        {
            DataClassification = ToBeClassified;


        }
        field(43; Reference_TRX_Number; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(44; JRNENTRY; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(45; LNSEQNBR; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(46; Contract_Sequence_Number; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(47; DEX_ROW_ID; Integer)
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

}