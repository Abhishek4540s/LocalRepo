table 50900 RenwickavTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No';
            AutoIncrement = true;
        }
        field(2; DocumentStatus; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Document Status';
            OptionMembers = " ","Posted","Unposted","POC 94.4%","POC 21.1%","POC 21.9%","POC 98%";
        }
        field(3; SOPType; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'SOP Type';
            OptionMembers = " ","Order","Invoice","Return","Quote";
        }
        field(4; SOPNumber; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'SOP Number';
        }
        field(5; OriginalNumber; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Original Number';

        }
        field(6; DocumentDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Document Date';
        }
        field(7; ItemNumber; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item Number';
        }
        field(8; ItemDescription; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item Description';
        }
        field(9; QTY; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'QTY';
            DecimalPlaces = 5;
        }
        field(10; QTYRemaining; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'QTY Remaining';
            DecimalPlaces = 5;
        }
        field(11; UnitPrice; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Unit Price';
            DecimalPlaces = 5;
        }
        field(12; ExtendedPrice; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Extended Price';
            DecimalPlaces = 5;
        }
        field(13; StandardCost; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Standard Cost';
            DecimalPlaces = 5;
        }
        field(14; UnitCost; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Unit Cost';
            DecimalPlaces = 5;
        }
        field(15; ExtendedCost; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Extended Cost';
            DecimalPlaces = 5;
        }
        field(16; CustomerNumber; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Number';
        }
        field(17; PrimaryAddressCode; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Primary Shipto Address Code from Sales Transaction';
        }
        field(18; Phase; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Phase';
        }
        field(19; LocationCode; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Location Code';
        }
        field(20; CreatedBy; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Created By';
        }
        field(21; CreatedDateTime; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Created DateTime';
        }
        field(22; FileName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'File Name';
        }
        field(23; SheetName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Sheet Name';
        }



    }

    keys
    {
        key(Pk; EntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; EntryNo, DocumentStatus, SOPType, SOPNumber)
        {
        }
    }

}