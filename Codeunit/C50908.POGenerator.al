codeunit 50908 POGenerator
{
    Permissions = tabledata "Purchase Header" = rid, tabledata "Purchase Line" = rid;

    var
        PurchaseSetup_gRec: Record "Purchases & Payables Setup";
        SICodeUnit_gCU: Codeunit SingleInstance_CU;
        PoFilters_gRec: Record POfilters;

    procedure CreatePO()
    var
        CustPO_lPage: Page "Custom Purchase Order List";
        PlanningLines_lRec: Record "Job Planning Line";
        ReorderPoint_lDec: Decimal;
        ReorderQty_lDec: Decimal;
        RemainingQty_lDec: Decimal;
        Inventory_lDec: Decimal;
        Quantity_lDec: Decimal;
        VendorNo_lCod: Code[20];
        PurchLine_lRec: Record "Purchase Line";
        LineNo_lInt: Integer;
    begin
        SICodeUnit_gCU.ClearOrder();
        PurchaseSetup_gRec.Get();
        PoFilters_gRec.Get();
        PlanningLines_lRec.Reset();
        PlanningLines_lRec.SetRange(Type, PlanningLines_lRec.Type::Item);
        PlanningLines_lRec.SetFilter("Line Type", '%1|%2', PlanningLines_lRec."Line Type"::Budget, PlanningLines_lRec."Line Type"::"Both Budget and Billable");
        if (PoFilters_gRec.FromDate <> 0D) or (PoFilters_gRec.ToDate <> 0D) then
            PlanningLines_lRec.SetFilter("Planning Date", '%1..%2', PoFilters_gRec.FromDate, PoFilters_gRec.ToDate);
        if PoFilters_gRec.ItemNo <> '' then
            PlanningLines_lRec.SetFilter("No.", '%1', PoFilters_gRec.ItemNo);
        if PoFilters_gRec.Description <> '' then
            PlanningLines_lRec.SetFilter(Description, '%1', PoFilters_gRec.Description);
        if PoFilters_gRec.Location <> '' then
            PlanningLines_lRec.SetFilter("Location Code", '%1', PoFilters_gRec.Location);
        if PlanningLines_lRec.FindSet() then begin
            repeat
                PlanningLines_lRec.CalcFields("Reorder Point", "Reorder Quantity", "Vendor No.", Inventory);
                ReorderPoint_lDec := PlanningLines_lRec."Reorder Point";
                ReorderQty_lDec := PlanningLines_lRec."Reorder Quantity";
                if PurchaseSetup_gRec."User Location for PO Gen" then
                    Inventory_lDec := PlanningLines_lRec.Inventory
                else
                    Inventory_lDec := 0;
                RemainingQty_lDec := PlanningLines_lRec."Remaining Qty.";
                Quantity_lDec := CalculateQty_lFun(ReorderPoint_lDec, ReorderQty_lDec, Inventory_lDec, RemainingQty_lDec);
                VendorNo_lCod := CalcDefaultVendor(PlanningLines_lRec."No.");
                if (Quantity_lDec > 0) and (VendorNo_lCod <> '') then begin
                    SICodeUnit_gCU.InsertOrders(VendorNo_lCod, Quantity_lDec, PlanningLines_lRec."No.", PlanningLines_lRec);
                end;
            until PlanningLines_lRec.Next() = 0;
        end;
        Commit();
        CustPO_lPage.LOOKUPMODE(true);
        CustPO_lPage.RunModal();
    end;


    local procedure CalculateQty_lFun(ReorderPoint_lDec: Decimal; ReorderQty_lDec: Decimal; Inventory_lDec: Decimal; RemainingQty_lDec: Decimal): Decimal
    var
        A_lDec: Decimal;
        B_lDec: Decimal;
        C_lDec: Decimal;
        D_lDec: Decimal;
    begin
        A_lDec := RemainingQty_lDec - Inventory_lDec;
        if A_lDec > 0 then begin
            B_lDec := ReorderQty_lDec - A_lDec;
            if B_lDec < 0 then
                B_lDec := 0;
            C_lDec := A_lDec + B_lDec;
        end;
        D_lDec := ReorderPoint_lDec - Inventory_lDec;
        If C_lDec > D_lDec then
            exit(C_lDec)
        else
            exit(D_lDec);
    end;


    local procedure CalcDefaultVendor("No.": Code[20]): Code[20]
    var
        Item_lRec: Record Item;
    begin
        Item_lRec.Reset();
        if Item_lRec.Get("No.") then
            exit(Item_lRec."Vendor No.");
    end;



    procedure InsertOrder(var Rec: Record "Purchase Header" temporary)
    var
        PurchHeader_lRec: Record "Purchase Header";
    begin
        PurchHeader_lRec.Reset();
        PurchHeader_lRec.Init();
        PurchHeader_lRec.TransferFields(Rec);
        PurchHeader_lRec.Validate("No.", Rec."No.");
        PurchHeader_lRec.Insert(true);
        CreateOrderLines(PurchHeader_lRec)
    end;

    local procedure CreateOrderLines(PurchHeader_lRec: Record "Purchase Header")
    var
        PurchLine_lRecTemp: Record "Purchase Line" temporary;
        PurchLine_lRec: Record "Purchase Line";
    begin
        // PurchLine_lRecTemp.Copy(SICodeUnit_gCU.GetOrderLines(PurchHeader_lRec));
        SICodeUnit_gCU.GetOrderLines(PurchHeader_lRec, PurchLine_lRecTemp);
        if PurchLine_lRecTemp.FindSet() then
            repeat
                PurchLine_lRec.Init();
                PurchLine_lRec.TransferFields(PurchLine_lRecTemp);
                PurchLine_lRec.Insert(true);
                PurchLine_lRec.Validate(Type, PurchLine_lRecTemp.Type);
                PurchLine_lRec.Validate("No.", PurchLine_lRecTemp."No.");
                PurchLine_lRec.Validate(Quantity, PurchLine_lRecTemp.Quantity);
                PurchLine_lRec.Modify(true);
                ModifyPlanningLines(PurchLine_lRec."Document No.");
            until PurchLine_lRecTemp.Next() = 0;
    end;

    local procedure ModifyPlanningLines("No.": Code[20])
    var
        PlanningLines_lRec: Record "Job Planning Line";
    begin
        PlanningLines_lRec.Reset();
        PlanningLines_lRec.SetRange("PO No.", "No.");
        if PlanningLines_lRec.FindSet() then
            PlanningLines_lRec.ModifyAll("PO Generator", true, true);
    end;
}