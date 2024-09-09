table 50935 Technician
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Technician ID"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Link To"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Emp ID"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Vendor ID"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Technician Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(7; "Primary Skill Level"; Code[80])
        {
            DataClassification = ToBeClassified;

        }
        field(8; "Technician Team"; Code[80])
        {
            DataClassification = ToBeClassified;

        }
        field(9; "Extended Hours"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(10; "Page Vendor"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(11; "Page Number"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(12; "Pager Pin/Email"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(13; "Refrigerant Certification"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(18; "Time zone"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(19; "Allow Double booking"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(20; "File Name"; Text[120])
        {
            DataClassification = ToBeClassified;

        }
        field(21; "File Imported Date"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(22; "File Imported By"; Code[50])
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