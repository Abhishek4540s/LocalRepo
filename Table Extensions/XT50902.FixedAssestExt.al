tableextension 50902 FixedAssestExt extends "Fixed Asset"
{
    fields
    {
        field(50000; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
    }

}