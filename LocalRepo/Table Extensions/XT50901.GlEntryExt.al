tableextension 50901 GlEntryExt extends "G/L Entry"
{
    fields
    {
        field(50001; JRNENTRY; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; ORMSTRID; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; SOURCDOC; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; ORMSTRNM; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; BCdscriptnDim1; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "BC GL Name"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "BC Income/Balance"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "BC Account Category"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "BC Account Subcategory"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Job or Null"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "REFRENCE"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Fiscal Year"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "Period"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Actnumst"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "GP  Data Import "; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50016; "GP Entry No"; Integer)
        {
            Caption = 'GP Entry No';
            DataClassification = ToBeClassified;
        }

    }

}