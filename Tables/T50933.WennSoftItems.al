table 50933 WennSoftItems
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; ITEMNMBR; Code[60])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Item Desc."; Text[150])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Short Desc."; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Generic Desc."; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Class ID"; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(7; "Item Type"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(8; "Valuation Method"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(9; "Valuation Method in Text"; Text[80])
        {
            DataClassification = ToBeClassified;

        }
        field(10; "Qty. decimals"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(11; "Currency Decimals"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(12; "Sales Tax Options"; Enum TaxOptions)
        {
            DataClassification = ToBeClassified;

        }
        field(13; "Tax Schedule ID-1"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(14; "UOM Schedule ID"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(15; "Purchase Tax Options"; Enum TaxOptions)
        {
            DataClassification = ToBeClassified;

        }
        field(16; "Tax Schedule ID-2"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(17; "Std. Cost"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(18; "Current Cost"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(19; "List Price"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(20; "Qty. on Hold"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(21; "Qty. Available"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(22; "Qty Backorder"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(23; "Available less backorder"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(24; "File Name"; Text[120])
        {
            DataClassification = ToBeClassified;

        }
        field(25; "File Imported Date"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(26; "File Imported By"; Code[50])
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