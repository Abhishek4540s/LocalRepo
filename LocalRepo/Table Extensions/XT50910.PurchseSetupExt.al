tableextension 50910 PurchasesetupExt extends "Purchases & Payables Setup"
{
    fields
    {
        field(50000; "User Location for PO Gen"; Boolean)
        {
            Caption = 'User Location for PO Gen';
        }
        field(50001; "Location"; Text[110])
        {
            Caption = 'Location';
            trigger OnLookup()
            var
                Location_lRec: Record Location;
                Location_lPage: Page "Location List";
                Temp_lStr: Text[110];
            begin
                Location_lRec.Reset();
                Clear(Location_lPage);
                Location_lPage.SetTableView(Location_lRec);
                Location_lPage.lookupmode(true);
                If Location_lPage.Runmodal = action::lookupok then begin
                    Location_lPage.SetSelectionFilter(Location_lRec);
                    if Location_lRec.FindSet() then begin
                        if Location_lRec.Count <> 1 then begin
                            repeat
                                Temp_lStr := Format(Location_lRec.Code) + '|' + Temp_lStr;
                            until Location_lRec.Next() = 0;
                            Location := CopyStr(Temp_lStr, 1, StrLen(Temp_lStr) - 1);
                        end
                        else
                            Location := Format(Location_lRec.Code);
                    end;
                End;
            end;
        }
    }


}