pageextension 50914 PurhaseOrders extends "Purchase Order List"
{

    actions
    {
        addfirst(processing)
        {
            action("PO Generator")
            {
                Promoted = true;
                ApplicationArea = all;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    POGenerator_CU: Codeunit POGenerator;
                    POfilters_Page: page "PO Generator filters";
                    Pofilter_gRec: Record POfilters;
                begin
                    Clear(POfilters_Page);
                    POfilters_Page.LookupMode(true);
                    POfilters_Page.SetTableView(Pofilter_gRec);
                    if POfilters_Page.RunModal = Action::LookupOK then
                        POGenerator_CU.CreatePO();
                end;
            }
        }

    }

    var
        myInt: Integer;
}