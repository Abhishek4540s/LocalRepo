table 50922 "Invty Elecwire"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {

        }
        field(21; ItemNmbr; Code[31])
        {

        }
        field(22; ItemDescrip; Text[101])
        {

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