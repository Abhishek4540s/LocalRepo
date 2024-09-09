table 50909 "EE4Pts Project"
{
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; GVEmployeeCode; Code[6])
        {
            DataClassification = ToBeClassified;
            Caption = 'GVEmployee Code';
        }
        field(22; GVEEname; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'GVEEname';
        }
    }

    keys
    {
        key(Key1; "Entry No")
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