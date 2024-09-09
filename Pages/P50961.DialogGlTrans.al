page 50961 DialogGtTrans
{
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Select a Customer No. and Ship-to Address for a new Job';
    ModifyAllowed = true;
    InsertAllowed = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("JREntry"; Text_lText)
                {
                    ApplicationArea = All;
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        GLTransRec.Reset();
                        Clear(GLTransPAge);
                        GLTransPAge.SetTableView(GLTransRec);
                        GLTransPAge.lookupmode(true);
                        If GLTransPAge.Runmodal = action::lookupok then begin
                            GLTransPAge.SetSelectionFilter(GLTransRec);
                            if GLTransRec.FindSet() then begin
                                if GLTransRec.Count <> 1 then begin
                                    repeat
                                        Temp_lStr := Format(GLTransRec.JRNENTRY) + '|' + Temp_lStr;
                                    until GLTransRec.Next() = 0;
                                    Text_lText := CopyStr(Temp_lStr, 1, StrLen(Temp_lStr) - 1);
                                end
                                else
                                    Text_lText := Format(GLTransRec.JRNENTRY);
                            end;
                            SICodeunit.SetFilter(Text_lText);
                        End;
                    end;
                }

            }
        }
    }
    var
        GLTransPAge: Page "GL Trans 2024";
        GLTransRec: Record "GL Trans";
        Text_lText: Text[200];
        Temp_lStr: Text[200];

        SICodeunit: Codeunit SingleInstance_CU;

}