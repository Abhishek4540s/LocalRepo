table 50921 "Invty Dead Commercial Tag"
{


    fields
    {
        field(1; "Entry No."; Integer)
        {

        }

        field(21; DeadCommercial; Code[15])
        {

        }
        field(22; D_ITEMNMBR; Code[31])
        {

        }
        field(23; D_ITEMDESC; Text[101])
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