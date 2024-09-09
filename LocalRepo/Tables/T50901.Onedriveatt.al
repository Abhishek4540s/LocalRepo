table 50901 OneDriveAttachment
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Table));
        }
        field(3; "No."; Code[20])
        {
        }
        field(4; "Attached Date"; DateTime)
        {
        }
        field(5; "File Name"; Text[250])
        {
        }
        field(6; "File Extension"; Text[30])
        {
            Caption = 'File Extension';

            trigger OnValidate()
            begin
                case LowerCase("File Extension") of
                    'jpg', 'jpeg', 'bmp', 'png', 'tiff', 'tif', 'gif':
                        "File Type" := "File Type"::Image;
                    'pdf':
                        "File Type" := "File Type"::PDF;
                    'docx', 'doc':
                        "File Type" := "File Type"::Word;
                    'xlsx', 'xls':
                        "File Type" := "File Type"::Excel;
                    'pptx', 'ppt':
                        "File Type" := "File Type"::PowerPoint;
                    'msg':
                        "File Type" := "File Type"::Email;
                    'xml':
                        "File Type" := "File Type"::XML;
                    else
                        "File Type" := "File Type"::Other;
                end;
            end;
        }
        field(7; "File Type"; Enum "Document Attachment File Type")
        {
            Caption = 'File Type';
            Editable = false;
        }
        field(10; User; Code[50])
        {
            Caption = 'User';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(User."User Name" where("License Type" = const("Full User")));
        }
    }
    keys
    {
        key(PK; ID)
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