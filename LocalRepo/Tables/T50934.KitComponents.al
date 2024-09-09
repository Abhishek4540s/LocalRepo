table 50934 "Kit Components"
{
    DataClassification = ToBeClassified;
    LookupPageId = "Kit Components";
    DrillDownPageId = "Kit Components";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; ITEMNMBR; Code[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3; ITEMDESC; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4; CMPTITNM; Code[70])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Component Item Desc."; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; CMPITUOM; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; CMPITQTY; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Parent Current Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Parent Standard Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Component Current Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Component Std Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "File Name"; Text[120])
        {
            DataClassification = ToBeClassified;

        }
        field(13; "File Imported Date"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(14; "File Imported By"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", ITEMNMBR, ITEMDESC)
        {
        }
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