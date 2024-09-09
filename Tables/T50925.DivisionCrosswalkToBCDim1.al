table 50925 "DivisionCrosswalk to BC Dim1"
{
    DataClassification = ToBeClassified;
    Caption = 'DivisionCrosswalk to BC Dim1';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; GVDivisions; Code[15])
        {
            DataClassification = ToBeClassified;

        }
        field(3; GL_Divisions; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4; BCdimension1; code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5; BCdscriptnDim1; text[50])
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