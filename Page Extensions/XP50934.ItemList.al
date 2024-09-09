pageextension 50934 ItemListExt extends "Item List"
{
    layout
    {
        modify("Description 2")
        {
            Visible = true;
            ApplicationArea = all;
        }
    }

    actions
    {
        addfirst(Action126)
        {
            action(Modifyyy)
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    Item: Record Item;
                begin
                    // Item.SetRange(Type, Item.Type::Service); //PREVENTATIVE MAINT, SERVICE BILLING
                    Item.SetRange(Type, Item.Type::Service); //PREVENTATIVE MAINT, SERVICE BILLING
                    If Item.FindSet() then begin
                        repeat
                            Item.Type := Item.type::"Non-Inventory";
                            Item.Modify();
                        //Message(Format(Item.Count));
                        until Item.Next() = 0;
                    end;
                end;
            }

        }

        addfirst(Functions)
        {
            action(UpdateOldItemNos)
            {
                Caption = 'Update GP Old Item Nos';
                Visible = true;
                // Promoted = true;
                ApplicationArea = All;
                Image = Process;

                trigger OnAction()
                var
                    UpdateOldItemNos: Codeunit CreateAssemblyBOM;
                begin
                    UpdateOldItemNos.UpdateOldItemInDesc2();
                end;

            }

            action(Filter)
            {
                Caption = 'Update using filter';
                Visible = true;
                // Promoted = true;
                ApplicationArea = All;
                Image = Process;
                RunObject = report UpdateOldItemNo;

            }
        }


        addfirst(Category_New)
        {
            actionref(Modifyy; Modifyyy)
            {
            }
            actionref(UpdateOldItemNo; UpdateOldItemNos)
            {
            }
            actionref(UsingFilter; Filter)
            {
            }
        }
    }

    var
        myInt: Integer;
}