table 50931 "Old vs New Item Number"
{
    Caption = 'Old vs New Item Number';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Company Type"; Enum CompanyType)
        {
            Caption = 'Company Type';
        }
        field(21; "GP ITEMNMBR"; Code[31])
        {
            Caption = 'GP ITEMNMBR';
        }
        field(22; "Trim Item_Number CA"; Code[31])
        {
            Caption = 'Trim Item_Number CA';
        }
        field(23; GVnmbrChrtr; Integer)
        {
            Caption = 'GVnmbrChrtr';
        }
        field(24; "BC New Item Number"; Code[20])
        {
            Caption = 'BC New Item Number';
        }
        field(25; GVnmbrChrtrNew; Integer)
        {
            Caption = 'GVnmbrChrtrNew';
        }
        field(26; ItemType2; Text[50])
        {
            Caption = 'ItemType2';
        }
        field(27; ITEMTYPE; Integer)
        {
            Caption = 'ITEMTYPE';
        }
        field(28; ITMCLSCD; Text[20])
        {
            Caption = 'ITMCLSCD';
        }
        field(29; "Item Description"; Text[250])
        {
            Caption = 'Item Description';
        }
        field(30; USCATVLS_6; Code[10])
        {
            Caption = 'USCATVLS_6';
        }
        field(31; DeletedItemNmbrs; Code[20])
        {
            Caption = 'Deleted Item Numbers';
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
