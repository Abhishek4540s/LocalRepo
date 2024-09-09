table 50947 "GL Trans"
{
    DataClassification = ToBeClassified;
    Caption = 'GL Trans';

    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No';
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
        field(5; ACTNUMBR_1; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(6; ACTNUMBR_3; Code[20])
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
        field(9; ORMSTRID; Code[50])
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
        field(13; SOURCDOC; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(14; ORMSTRNM; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(15; BACHNUMB; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(16; ORDOCNUM; code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(17; DSCRIPTN; Text[150])
        {
            DataClassification = ToBeClassified;

        }
        field(18; ORGNTSRC; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(19; VOIDED; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(20; GPsegment1; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(21; BCdimension1; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(22; BCdscriptnDim1; Text[100])
        {

            DataClassification = ToBeClassified;
        }

        field(23; GPAcctNmbr; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'GP AcctNmbr';
        }

        field(24; BCGLNo; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'BC GL No';
        }
        field(25; BCGLName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'BC GL Name';
        }
        field(26; BCIncomeBalance; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'BC Income/Balance';
        }
        field(27; BCAccountCategory; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'BC Account Category';
        }
        field(28; BCAccountSubcategory; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'BC Account Subcategory';
        }
        field(29; BCAccountType; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'BC Account Type';
        }
        field(30; REFRENCE; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(31; JobrelatedORnot; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Job related OR not';
        }
        field(32; JobORNOTJobrelated; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Job OR NOT Job related';
        }

        field(33; JobORNull; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Job OR Null';
        }
        field(34; JournalTemplate; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Journal Template';
        }
        field(35; JournalbatchName; code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Journal batch Name';
        }
        field(36; FileName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'File Name';
        }
        field(37; ImportedBY; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Imported BY';
        }
        field(38; ImportedOnDate; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Imported On Date';
        }
        field(39; IsProcessed; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Is Processed';
        }
        field(40; "Error Log"; Text[150])
        {
            DataClassification = ToBeClassified;
            Caption = 'Error Log';
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