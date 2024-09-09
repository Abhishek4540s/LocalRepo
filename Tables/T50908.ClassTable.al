table 50908 "Class Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; ID; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(22; Class_ID; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Class_ ID';
        }
        field(23; Builder_Type; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Builder_Type';
        }
        field(24; Mon_Y_N; Enum Mon_Y_N)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mon_Y_N';
        }
        field(25; Div_Map; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Div_Map';
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