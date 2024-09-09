codeunit 50914 CreateAssemblyBOM
{
    procedure CheckItemsInKitComponents()
    var
        KitCompHeaderRec: Record "Kit Components";
        ItemRec: Record Item;
        BOMComponentRec: Record "BOM Component";
        ResourceRec: Record Resource;
        LineNo: Integer;
        ProcessedCount: Integer;
    // progressDialog: Dialog;
    begin
        ProcessedCount := 0;

        if KitCompHeaderRec.FindSet() then begin
            repeat
                ProcessedCount := ProcessedCount + 1;
                if ItemRec.Get(KitCompHeaderRec."ITEMNMBR") then begin
                    BOMComponentRec.SetRange(BOMComponentRec."Parent Item No.", KitCompHeaderRec."ITEMNMBR");
                    BOMComponentRec.SetRange(BOMComponentRec."No.", KitCompHeaderRec."CMPTITNM");
                    if not BOMComponentRec.FindFirst() then begin

                        BOMComponentRec.SetRange(BOMComponentRec."No.");
                        if BOMComponentRec.FindLast() then
                            LineNo := BOMComponentRec."Line No." + 10000
                        else
                            LineNo := 10000;
                        BOMComponentRec.Init();
                        BOMComponentRec."Parent Item No." := KitCompHeaderRec."ITEMNMBR";
                        BOMComponentRec."Line No." := LineNo;

                        if ItemRec.Get(KitCompHeaderRec."CMPTITNM") then begin
                            BOMComponentRec.Type := BOMComponentRec.Type::Item;
                            BOMComponentRec."Unit of Measure Code" := ItemRec."Base Unit of Measure";
                        end;
                        if ResourceRec.Get(KitCompHeaderRec."CMPTITNM") then begin
                            BOMComponentRec.Type := BOMComponentRec.Type::Resource;
                            BOMComponentRec."Unit of Measure Code" := ResourceRec."Base Unit of Measure";
                        end;

                        BOMComponentRec."No." := KitCompHeaderRec."CMPTITNM";
                        BOMComponentRec."Quantity per" := KitCompHeaderRec."CMPITQTY";
                        BOMComponentRec.Insert(true);
                    end;
                    BOMComponentRec.Reset();
                end;

            until KitCompHeaderRec.Next() = 0;
        end;

        Message('Finished processing %1 records.', ProcessedCount);
    end;


    procedure UpdateOldItemInDesc2()
    var
        Item_lRec: Record Item;
        OldItemNos: Record "Old vs New Item Number";
    begin
        Item_lRec.reset;
        If Item_lRec.findset then begin
            repeat
                OldItemNos.SetRange("Company Type", OldItemNos."Company Type"::SST);
                OldItemNos.SetRange("BC New Item Number", Item_lRec."No.");
                if OldItemNos.FindFirst() then begin
                    Item_lRec."Description 2" := OldItemNos."GP ITEMNMBR";
                    //  Message(Item_lRec."Description 2");
                    Item_lRec.Modify();
                end;

            until Item_lRec.Next() = 0;
            Message('All Description 2 are updated with Old Item Number');
        end;

    end;
}