table 50926 "Create Journal Entries"
{
    Caption = 'Create Journal Entries';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; Year; Integer)
        {
            Caption = 'Year';
        }
        field(22; periodid; Integer)
        {
            Caption = 'periodid';
        }
        field(23; perdblnc; Decimal)
        {
            Caption = 'perdblnc';
        }
        field(24; "BC GL No"; Code[10])
        {
            Caption = 'BC GL No';
        }
        field(25; BCdimension1; Code[10])
        {
            Caption = 'BCdimension1';
        }
        field(26; "GP ACTNUMST "; Code[16])
        {
            Caption = 'GP ACTNUMST ';
        }
        field(27; "Document No"; Code[20])
        {
            Caption = 'Document No';
        }
        field(28; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(29; "Journal Template"; Code[10])
        {
            Caption = 'Journal Template';

        }
        field(30; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';


        }
        field(31; "File Name"; Text[50])
        {
            Caption = 'File Name';
        }
        field(32; "Imported By"; Code[50])
        {
            Caption = 'Imported By';
        }
        field(33; "Imported On Date"; DateTime)
        {
            Caption = 'Imported On Date';
        }
        field(34; "Is Processed"; Boolean)
        {
            Caption = 'Is Processed';
        }
        field(35; "Error Log"; Text[250])
        {
            Caption = 'Error Log';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
