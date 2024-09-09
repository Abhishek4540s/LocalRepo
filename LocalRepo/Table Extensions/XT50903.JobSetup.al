tableextension 50903 JobSetupExt extends "Jobs Setup"
{
    fields
    {
        field(50000; "Default Billing type"; Enum "Job Line Type Enum")
        {
        }
        field(50001; "Default Item type"; Enum "Job Line Type Enum")
        {
        }
        field(50002; "Default Labor type"; Enum "Job Line Type Enum")
        {
        }
        field(50003; "Default Billing No."; Code[20])
        {
            TableRelation = IF ("Default Billing type" = CONST(Resource)) Resource
            ELSE
            IF ("Default Billing type" = CONST(Item)) Item
            ELSE
            IF ("Default Billing type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Default Billing type" = CONST(Text)) "Standard Text";
            ValidateTableRelation = false;
        }
        field(50004; "Default Item No."; Code[20])
        {
            TableRelation = IF ("Default Item type" = CONST(Resource)) Resource
            ELSE
            IF ("Default Item type" = CONST(Item)) Item
            ELSE
            IF ("Default Item type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Default Item type" = CONST(Text)) "Standard Text";
            ValidateTableRelation = false;
        }
        field(50005; "Default Labor No."; Code[20])
        {
            TableRelation = IF ("Default Labor type" = CONST(Resource)) Resource
            ELSE
            IF ("Default Labor type" = CONST(Item)) Item
            ELSE
            IF ("Default Labor type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Default Labor type" = CONST(Text)) "Standard Text";
            ValidateTableRelation = false;
        }
        field(50006; "Inventory Posting Group"; Code[20])
        {
            Caption = 'Default Inventory Post Grp';
            TableRelation = "Inventory Posting Group";
        }
        field(50007; "Dimensions"; Code[20])
        {
            Caption = 'Dimensions';
            TableRelation = Dimension;
        }
        field(50008; "Default Location Code"; Code[20])
        {
            Caption = 'Default Location Code';
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(50009; "Restrict Duplicate Project"; Boolean)
        {
            Caption = 'Restrict Duplicate Project';
            DataClassification = ToBeClassified;
        }


    }

}