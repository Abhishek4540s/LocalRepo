table 50917 StdOpt
{
    Caption = 'StdOpt';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(21; Last2Char; Code[10])
        {
            Caption = 'Last2Char';
        }
        field(22; "Std or Opt"; Text[15])
        {
            Caption = 'Std or Opt';
        }
        field(23; "Std.Opt.abr"; Text[15])
        {
            Caption = 'Std.Opt.abr';
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
