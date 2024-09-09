page 50949 "Kit Components"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'WennSoft Kit Components';
    SourceTable = "Kit Components";
    AdditionalSearchTerms = 'WennSoft';

    layout
    {
        area(Content)
        {
            repeater(List)
            {
                field(ITEMNMBR; Rec.ITEMNMBR)
                {
                    ApplicationArea = All;

                }
                field(ITEMDESC; Rec.ITEMDESC)
                {
                    ApplicationArea = All;
                }
                field(CMPTITNM; Rec.CMPTITNM)
                {
                    ApplicationArea = All;
                }

                field("Component Item Desc."; Rec."Component Item Desc.")
                {
                    ApplicationArea = All;
                }
                field(CMPITUOM; Rec.CMPITUOM)
                {
                    ApplicationArea = All;
                }
                field(CMPITQTY; Rec.CMPITQTY)
                {
                    ApplicationArea = All;
                }
                field("Parent Current Cost"; Rec."Parent Current Cost")
                {
                    ApplicationArea = All;
                }
                field("Parent Standard Cost"; Rec."Parent Standard Cost")
                {
                    ApplicationArea = All;
                }
                field("Component Current Cost"; Rec."Component Current Cost")
                {
                    ApplicationArea = All;
                }
                field("Component Std Cost"; Rec."Component Std Cost")
                {
                    ApplicationArea = All;
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;

                }
                field("File Imported Date"; Rec."File Imported Date")
                {
                    ApplicationArea = All;

                }
                field("File Imported By"; Rec."File Imported By")
                {
                    ApplicationArea = All;

                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("&Import")
            {
                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import data from excel.';
                trigger OnAction()
                var
                    Import_CU: Codeunit ImportJobfiles;
                begin
                    Import_CU.ImportKitComponents();
                end;
            }
            // action(UpdateItem)
            // {
            //     Caption = 'Create Assembly BOM';
            //     Image = UpdateDescription;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     ApplicationArea = All;
            //     ToolTip = 'Create Assembly BOM';
            //     trigger OnAction()
            //     var
            //         // KitCompHeaderRec: Record "Kit Components";
            //         CreateAssemblyBOM: Codeunit CreateAssemblyBOM;
            //     begin
            //         if Confirm('Do you want to create for all') then
            //             CreateAssemblyBOM.CheckItemsInKitComponents();
            //     end;
            // }
            action("Filter")
            {
                Caption = 'Create Assembly BOM';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import data from excel.';
                RunObject = report "Kit Assembly BOM Report";
            }
        }
    }


}