tableextension 50905 JobPlanningExt extends "Job Planning Line"
{
    fields
    {
        modify("No.")
        {
            trigger OnAfterValidate()
            begin
                PopulateTaxGroupCode();
            end;
        }
        modify("Job Task No.")
        {
            trigger OnAfterValidate()
            var
                Customer: Record Customer;
                Job: Record Job;
                ShipToAddrress: Record "Ship-to Address";
            begin
                if "Job Task No." <> '' then begin
                    if Job.Get("Job No.") then begin
                        if Job."Ship-to Code" = '' then begin
                            if Customer.Get(Job."Bill-to Customer No.") then
                                "Tax Area Code" := Customer."Tax Area Code";
                        end else begin
                            if ShipToAddrress.Get(Job."Bill-to Customer No.", Job."Ship-to Code") then begin
                                if ShipToAddrress."Tax Area Code" <> '' then
                                    "Tax Area Code" := ShipToAddrress."Tax Area Code"
                                else if Customer.Get(Job."Bill-to Customer No.") then
                                    "Tax Area Code" := Customer."Tax Area Code";
                            end else if Customer.Get(Job."Bill-to Customer No.") then
                                    "Tax Area Code" := Customer."Tax Area Code";
                        end;
                    end;
                end;
            end;
        }


        field(65100; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            DataClassification = ToBeClassified;
            TableRelation = "Tax Area";
        }
        field(65101; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            DataClassification = ToBeClassified;
            TableRelation = "Tax Group";
        }

        field(50001; "Ready to Bill"; Boolean)
        {
            Caption = 'Ready to Bill';
        }
        field(50002; "Reorder Point"; Decimal)
        {
            Caption = 'Reorder Point';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Reorder Point" where("No." = field("No.")));
        }
        field(50003; "Reorder Quantity"; Decimal)
        {
            Caption = 'Reorder Quantity';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Reorder Quantity" where("No." = field("No.")));
        }
        field(50004; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50005; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(50006; "Location Filter"; Code[10])
        {
            Caption = 'Location Filter';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(50007; Inventory; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                  "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                  "Location Code" = field("Location Filter")));
            Caption = 'Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50008; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Vendor No." where("No." = field("No.")));
        }
        field(50009; "PO No."; Code[20])
        {
            Caption = 'PO No.';

        }
        field(50010; "PO Generator"; Boolean)
        {
            Caption = 'PO Generator';
        }
        field(50011; "Original Qty."; Decimal)
        {
            Caption = 'Original Qty.';
            trigger OnValidate()
            begin
                "Total Current Cost" := "Current Cost" * Quantity;
            end;
        }
        field(50012; "Base Line No."; Integer)
        {
            Caption = 'Base Line No.';
        }
        field(50013; "Current Cost Updated"; Boolean)
        {
            Caption = 'Current Cost Updated';
        }
        field(50014; "Current Cost"; Decimal)
        {
            Caption = 'Current Cost';
            trigger OnValidate()
            begin
                "Total Current Cost" := "Current Cost" * Quantity;
            end;
        }
        field(50015; "Total Current Cost"; Decimal)
        {
            Caption = 'Total Current Cost';
        }
        field(50016; "Allow modification"; Boolean)
        {
            Caption = 'Allow modification';
            InitValue = false;
        }

        field(65102; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
        }
    }
    local procedure PopulateTaxGroupCode()
    var
        Item: Record Item;
        GLAccount: Record "G/L Account";
        Resource: Record Resource;
    begin
        case "Type" of
            "Type"::Item:
                if Item.Get("No.") then
                    "Tax Group Code" := Item."Tax Group Code";
            "Type"::"G/L Account":
                if GLAccount.Get("No.") then
                    "Tax Group Code" := GLAccount."Tax Group Code";
            "Type"::Resource:
                if Resource.Get("No.") then
                    "Tax Group Code" := Resource."Tax Group Code";
        end;

    end;

}