table 50910 "Invty Commercial"
{

    fields
    {

        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; "ITEMNMBR Comm Table"; Code[31])
        {


        }
        field(22; "GV Invty Category"; Code[10])
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