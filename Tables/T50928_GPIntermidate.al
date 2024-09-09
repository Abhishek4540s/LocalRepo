table 50928 GPIntermediary
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; JRNENTRY; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; OPENYEAR; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; PERIODID; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; ACTNUMBR_1; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; ACTNUMBR_3; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; ACTNUMST; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; TRXDATE; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(9; ORMSTRID; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; DEBITAMT; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; CRDTAMNT; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; Net_DrCr; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; SOURCDOC; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; ORMSTRNM; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(15; BACHNUMB; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16; ORDOCNUM; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17; DSCRIPTN; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(18; ORGNTSRC; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19; VOIDED; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20; GPsegmentID; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "BCdimension1"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; BCdscriptnDim1; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "GP AcctNmbrStrng"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "BC GL No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "BC GL Name"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "BC Income/Balance"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "BC Account Category"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "BC Account Subcategory"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "BC Account Type"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "REFRENCE"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Job related or not"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Job or not Job related"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Job or Null"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Imported File Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Imported Date & Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Imported By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Processed Date & Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Processed By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Journal Line Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Journal Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(41; "General Ledger Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Error Log"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            DataClassification = ToBeClassified;
        }
        field(44; "Journal Batch Name"; Code[10])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
    }

}