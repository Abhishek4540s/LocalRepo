codeunit 50906 SingleInstance_CU

{
    SingleInstance = true;

    var
        CustomerNo_gCode: Code[20];
        ShiptoAddress_gText: Code[10];
        TempPurchHeader_gRec: Record "Purchase Header" temporary;
        TempPurchLine_gRec: Record "Purchase Line" temporary;
        ItemNo_gList: List of [Code[20]];
        CopyDate_gBol: Boolean;

        Filter_gTex: Text[200];
        JobNo: Code[20];

    procedure ClearValues()
    begin
        CustomerNo_gCode := '';
        ShiptoAddress_gText := '';
        Filter_gTex := '';
    end;

    procedure SetValues(CustomerNo_S: Code[20]; ShiptoAddress_S: Code[10])
    begin
        CustomerNo_gCode := CustomerNo_S;
        ShiptoAddress_gText := ShiptoAddress_S;
    end;

    procedure GetCustomerNo(): Code[20]
    begin
        exit(CustomerNo_gCode);
    end;

    procedure GetShipToAddress(): Code[10]
    begin
        exit(ShiptoAddress_gText)
    end;

    procedure ClearOrder()
    begin
        TempPurchHeader_gRec.DeleteAll();
        TempPurchLine_gRec.DeleteAll();
        Clear(ItemNo_gList);
    end;

    procedure SetNewlyCreatedJob(var vJobNo: Code[20])
    var
        myInt: Integer;
    begin
        JobNo := vJobNo;
    end;

    procedure GetNewyCreatedJob(var vJobNo: Code[20])
    var
        myInt: Integer;
    begin
        vJobNo := JobNo;
    end;

    procedure ClearNewlyCreatedJobNo()
    var

    begin
        JobNo := '';
    end;

    procedure ClearDate()
    begin
        CopyDate_gBol := false;
    end;

    procedure InsertOrders(VendorNo_lCod: Code[20]; Quantity_lDec: Decimal; "No.": Code[20]; PlanningLines_lRec: Record "Job Planning Line")
    var
        PurchaseSetup_lRec: Record "Purchases & Payables Setup";
        PurchHeader_lRec: Record "Purchase Header";
        PurchLine_lRec: Record "Purchase Line";

        NoSeries_CU: Codeunit "No. Series";
        NextNumber: Code[20];
    begin
        PurchaseSetup_lRec.Get();
        PurchLine_lRec.Reset();
        // PurchLine_lRec.SetRange("No.", "No.");
        // PurchLine_lRec.SetRange(Quantity, Quantity_lDec);
        // if PurchLine_lRec.FindFirst() then
        //     exit;
        if not ItemNo_gList.Contains("No.") then begin
            ItemNo_gList.Add("No.");
            NextNumber := NoSeries_CU.GetNextNo(PurchaseSetup_lRec."Order Nos.", WorkDate(), true);
            if not TempPurchHeader_gRec.Get(TempPurchHeader_gRec."Document Type"::Order, NextNumber) then begin
                TempPurchHeader_gRec.Reset();
                TempPurchHeader_gRec.Init();
                TempPurchHeader_gRec.Validate("Document Type", TempPurchHeader_gRec."Document Type"::Order);
                TempPurchHeader_gRec."No." := NextNumber;
                TempPurchHeader_gRec.Insert(true);
                TempPurchHeader_gRec.Validate("Buy-from Vendor No.", VendorNo_lCod);
                TempPurchHeader_gRec.Validate("PO Generator", true);
                TempPurchHeader_gRec.Validate("Item No.", "No.");
                TempPurchHeader_gRec.Modify(true);
                InsertOrderLines(TempPurchHeader_gRec, "No.", Quantity_lDec, PlanningLines_lRec);
            end;
        end
        else begin
            TempPurchLine_gRec.SetRange("No.", "No.");
            if TempPurchLine_gRec.FindFirst() then begin
                TempPurchHeader_gRec.SetRange("No.", TempPurchLine_gRec."Document No.");
                if TempPurchHeader_gRec.FindFirst() then
                    InsertOrderLines(TempPurchHeader_gRec, "No.", Quantity_lDec, PlanningLines_lRec);
            end;
        end;
    end;

    procedure GetOrders(var Rec: Record "Purchase Header" temporary)
    begin
        if TempPurchHeader_gRec.FindSet() then
            repeat
                Rec.Copy(TempPurchHeader_gRec, true);
            until TempPurchHeader_gRec.Next() = 0;
    end;

    procedure GetOrderLines(PurchHeader_lRec: Record "Purchase Header"; var PurchLine_lRecTemp: Record "Purchase Line" temporary)
    begin
        TempPurchLine_gRec.SetRange("Document Type", PurchHeader_lRec."Document Type");
        TempPurchLine_gRec.SetRange("Document No.", PurchHeader_lRec."No.");
        if TempPurchLine_gRec.FindSet() then
            repeat
                PurchLine_lRecTemp.Copy(TempPurchLine_gRec, true);
            until TempPurchHeader_gRec.Next() = 0;
    end;



    local procedure InsertOrderLines(var TempPurchHeader_gRec: Record "Purchase Header" temporary; "No.": Code[20]; Quantity_lDec: Decimal; PlanningLines_lRec: Record "Job Planning Line")
    var
        LineNo_lInt: Integer;
    begin
        TempPurchLine_gRec.RESET;
        TempPurchLine_gRec.SETRANGE("Document No.", TempPurchHeader_gRec."No.");
        IF TempPurchLine_gRec.FINDLAST THEN
            LineNo_lInt := TempPurchLine_gRec."Line No." + 10000
        ELSE
            LineNo_lInt := 10000;

        TempPurchLine_gRec.Reset();
        TempPurchLine_gRec.Init();
        TempPurchLine_gRec.Validate("Document Type", TempPurchLine_gRec."Document Type"::Order);
        TempPurchLine_gRec."Document No." := TempPurchHeader_gRec."No.";
        TempPurchLine_gRec.Validate("Line No.", LineNo_lInt);
        TempPurchLine_gRec.Insert();
        TempPurchLine_gRec.Type := TempPurchLine_gRec.Type::Item;
        TempPurchLine_gRec."No." := "No.";
        TempPurchLine_gRec.Quantity := Quantity_lDec;
        TempPurchLine_gRec.Modify();
        PlanningLines_lRec."PO No." := TempPurchHeader_gRec."No.";
        PlanningLines_lRec.Modify(true);
    end;



    procedure SetCopyDate(CopyDate: Boolean)
    begin
        CopyDate_gBol := CopyDate;
    end;

    procedure GetCopyDate(): Boolean
    begin
        exit(CopyDate_gBol);
    end;

    procedure SetFilter(Text_lText: Text[200])
    begin
        Filter_gTex := Text_lText;
    end;

    procedure GetFilter(): Text[200]
    begin
        exit(Filter_gTex);
    end;
}