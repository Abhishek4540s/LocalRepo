
report 50904 UpdateOldItemNo
{
    ProcessingOnly = true;
    ApplicationArea = All;
    Caption = 'Update Desc 2 from Old Item No.';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Item; Item)
        {
            trigger OnPreDataItem()
            begin
                if (Text_gStr <> '') then
                    Item.SetFilter("No.", Text_gStr);
                ProcessedCount := 0;
                ProgressWindow.Open(Text_gText);
                ProgressWindow.Update(1, Item.Count);

            end;

            trigger OnAfterGetRecord()
            begin
                OldItemNos.SetRange("Company Type", OldItemNos."Company Type"::SST);
                OldItemNos.SetRange("BC New Item Number", Item."No.");
                If OldItemNos.DeletedItemNmbrs = '' then begin
                    if OldItemNos.FindFirst() then begin
                        If Item_gRec.Get(Item."No.") then begin
                            Item_gRec."Description 2" := OldItemNos."GP ITEMNMBR";
                            Item_gRec.Modify(true);
                            ProcessedCount := ProcessedCount + 1;
                            ProgressWindow.Update(2, ProcessedCount);
                        end;
                    end;
                end else begin
                    Item_gRec."Description 2" := OldItemNos.DeletedItemNmbrs;
                    Item_gRec.Modify(true);
                end;
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
            area(Content)
            {
                group(GroupName)
                {
                    field(ItemNo; Text_gStr)
                    {
                        ApplicationArea = Basic, Suite;
                        TableRelation = "Kit Components".ITEMNMBR;
                        Caption = 'Item Number';

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            Item_Pag: Page "Item List";
                            Item_lRec: Record Item;
                        begin
                            Clear(Text_gStr);
                            Item_lRec.Reset();
                            Clear(Item_Pag);
                            Item_Pag.SetTableView(Item_lRec);
                            Item_Pag.lookupmode(true);
                            If Item_Pag.Runmodal = action::lookupok then begin
                                Item_Pag.SetSelectionFilter(Item_lRec);
                                if Item_lRec.FindSet() then begin
                                    if Item_lRec.Count <> 1 then begin
                                        repeat
                                            Temp_lStr := Format(Item_lRec."No.") + '|' + Temp_lStr;
                                        until Item_lRec.Next() = 0;
                                        Text_gStr := CopyStr(Temp_lStr, 1, StrLen(Temp_lStr) - 1);
                                    end
                                    else
                                        Text_gStr := Format(Item_lRec."No.");
                                end;
                            End;
                        end;

                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        OldItemNos: Record "Old vs New Item Number";
        Temp_lStr: text[200];
        Text_gStr: text[150];
        Item_gRec: Record Item;
        ProcessedCount: Integer;


        ProgressWindow: Dialog;
        Text_gText: Label 'Processing...\Total: #1####################\Current: #2####################';

}
