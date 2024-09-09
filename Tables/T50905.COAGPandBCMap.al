table 50905 "COA GP and BC Map"
{
    Caption = 'COA GP and BC Map';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; "Account Number"; Code[30])
        {
            Caption = 'Account Number';
        }
        field(22; Natural; Code[10])
        {
            Caption = 'Natural';
        }
        field(23; Office; Code[10])
        {
            Caption = 'Office';
        }
        field(24; Product; Code[10])
        {
            Caption = 'Product';
        }
        field(25; "Sub Product"; Code[10])
        {
            Caption = 'Sub Product';
        }
        field(26; "GL Code"; Code[20])
        {
            Caption = 'GL Code';
            TableRelation = "G/L Account";
            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
            begin
                if GLAccount.Get("GL Code") then
                    "GL Description" := GLAccount.Name;
            end;
        }
        field(27; "GL Description"; Text[100])
        {
            Caption = 'GL Description';
        }
        field(28; Dimension; Code[20])
        {
            Caption = 'Dimension';
        }
        field(29; "Dimension Value Code"; Code[20])
        {
            Caption = 'Dimension Value Code';
        }
    }
    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
    }
}
