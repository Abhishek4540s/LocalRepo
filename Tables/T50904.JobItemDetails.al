table 50904 "Job Item Details"
{
    DataClassification = ToBeClassified;
    Caption = 'Job Item Details';
    fields
    {
        field(1; WS_Job_Number; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; SOPTYPE; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(3; SOPNUMBER; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; LNITMSEQ; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(5; CMPNTSEQ; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(6; ITEMNMBR; code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'ITEMNMBR 4/25/24 w Qty added';
        }
        field(7; QTYFULFI; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(8; QTYTOINV; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(9; QUANTITY; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(10; QTYREMAI; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(11; UNITCOST; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(12; CURRCOST; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(13; EXTDCOST; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(14; XTNDPRCE; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(15; ITMCLSCD; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(16; STNDCOST; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(17; LaborUnpExtCst; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(18; GV_Ext_Cost_LaborExtCst; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'GV Ext_Cost + LaborExtCst';
        }
        field(19; GVEXTDCOST2; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(20; FileName; Text[150])
        {
            DataClassification = ToBeClassified;
            caption = 'File Name';
        }
        field(21; FileImportedDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'File Imported Date';
        }
        field(22; FileImportedBy; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'File Imported By';
        }
        field(23; IsProcessed; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Is Processed';
        }
        field(24; Error; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Error';
        }
        field(25; ErrorMessage; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Error Message';
        }
        field(26; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'EntryNo';
            // AutoIncrement = true;
        }
        field(27; BCDimension1; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'BCDImension1';
        }
        field(28; CUSTNMBR; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(29; CUSTNAME; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(30; Divisions; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Divisions';
        }
        field(31; "BCdscriptnDim1"; Text[100])
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