table 50911 "GL Division 1"
{


    fields
    {

        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; GVDivisions; Code[15])
        {


        }
        field(22; GL_Divisions; Code[10])
        {


        }
    }

    keys
    {
        key(pk; "Entry No")
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