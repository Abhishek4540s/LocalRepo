table 50924 "Invtry Item Type"
{
    DataClassification = ToBeClassified;
    Caption = 'Invtry Item Type Description';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Item Type1"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Item Type2"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(pk; "Entry No.")
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