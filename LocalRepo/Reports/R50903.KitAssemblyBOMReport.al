
report 50903 "Kit Assembly BOM Report"
{
    ProcessingOnly = true;
    ApplicationArea = All;
    Caption = 'Kit Assembly BOM Report';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Item; Item)
        {
            ///DataItemTableView = sorting(ITEMNMBR, "Entry No.");
            // RequestFilterFields = ITEMNMBR;

            trigger OnPreDataItem()
            begin
                if (ITEMNMBR_gCod <> '') then
                    Item.SetFilter("No.", ITEMNMBR_gCod);

                CalcFields(Item."Assembly BOM");
                IF not RecreateBOM then
                    Item.SetRange("Assembly BOM", false);
                ProcessedCount := 0;
                ProgressWindow.Open(Text_gText);
                ProgressWindow.Update(1, Item.Count);

            end;

            trigger OnAfterGetRecord()
            var
            begin

                KitCompHeaderRec.Reset();
                KitCompHeaderRec.SetRange(ITEMNMBR, Item."No.");
                If KitCompHeaderRec.IsEmpty then
                    CurrReport.Skip();

                BOMComponentRec.Reset();
                BOMComponentRec.SetRange("Parent Item No.", Item."No.");

                if BOMComponentRec.FindSet() then
                    BOMComponentRec.DeleteAll();
                Clear(BOMComponentRec);
                If KitCompHeaderRec.FindSet() then begin
                    repeat
                        BOMComponentRec.Reset();
                        BOMComponentRec.SetRange("Parent Item No.", Item."No.");
                        if BOMComponentRec.FindLast() then
                            LineNo := BOMComponentRec."Line No." + 10000
                        else
                            LineNo := 10000;

                        BOMComponentRec.Init();
                        BOMComponentRec.Validate("Parent Item No.", KitCompHeaderRec.ITEMNMBR);
                        BOMComponentRec."Line No." := LineNo;
                        BOMComponentRec.Insert(true);

                        if ItemRec.Get(KitCompHeaderRec."CMPTITNM") then
                            BOMComponentRec.Validate(Type, BOMComponentRec.Type::Item);

                        if ResourceRec.Get(KitCompHeaderRec."CMPTITNM") then
                            BOMComponentRec.Validate(Type, BOMComponentRec.Type::Resource);

                        BOMComponentRec.Validate("No.", KitCompHeaderRec."CMPTITNM");
                        //BOMComponentRec.Validate(Description, KitCompHeaderRec."Component Item Desc.");
                        BOMComponentRec.Validate("Quantity per", KitCompHeaderRec."CMPITQTY");
                        BOMComponentRec.Modify(true);

                    until KitCompHeaderRec.Next() = 0;
                end;
                ProcessedCount := ProcessedCount + 1;
                ProgressWindow.Update(2, ProcessedCount);
            end;

            trigger OnPostDataItem()
            begin
                ProgressWindow.Close();
            end;

        }

    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Group)
                {
                    field(ITEMNMBR; ITEMNMBR_gCod)
                    {
                        ApplicationArea = Basic, Suite;
                        TableRelation = "Kit Components".ITEMNMBR;
                        Caption = 'Item Number';

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            KitCompHeaderPag: Page "Kit Components";
                            KitCompHeaderRec1: Record "Kit Components";
                        begin
                            Clear(ITEMNMBR_gCod);
                            KitCompHeaderRec1.Reset();
                            Clear(KitCompHeaderPag);
                            KitCompHeaderPag.SetTableView(KitCompHeaderRec1);
                            KitCompHeaderPag.lookupmode(true);
                            If KitCompHeaderPag.Runmodal = action::lookupok then begin
                                KitCompHeaderPag.SetSelectionFilter(KitCompHeaderRec1);
                                if KitCompHeaderRec1.FindSet() then begin
                                    if KitCompHeaderRec1.Count <> 1 then begin
                                        repeat
                                            Temp_lStr := Format(KitCompHeaderRec1.ITEMNMBR) + '|' + Temp_lStr;
                                        until KitCompHeaderRec1.Next() = 0;
                                        ITEMNMBR_gCod := CopyStr(Temp_lStr, 1, StrLen(Temp_lStr) - 1);
                                    end
                                    else
                                        ITEMNMBR_gCod := Format(KitCompHeaderRec1.ITEMNMBR);
                                end;
                            End;
                        end;

                    }
                    field(RecreateBOM; RecreateBOM)
                    {
                        ApplicationArea = Basic, Suite;
                    }
                }
            }
        }

    }

    var
        ITEMNMBR_gCod: Code[150];
        RecreateBOM: Boolean;
        ItemRec: Record Item;
        BOMComponentRec: Record "BOM Component";
        ResourceRec: Record Resource;
        LineNo: Integer;
        ProcessedCount: Integer;
        KitCompHeaderRec: Record "Kit Components";
        Temp_lStr: text[200];

        ProgressWindow: Dialog;
        Text_gText: Label 'Processing...\Total: #1####################\Current: #2####################';
}

