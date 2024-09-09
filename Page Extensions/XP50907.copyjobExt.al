pageextension 50907 "copy job Ext" extends "Copy Job Tasks"
{
    layout
    {
        addafter(CopyDimensions)
        {
            field("Copy Date"; CopyDate)
            {
                ApplicationArea = all;
                ToolTip = 'To make the Starting date and Ending date fields not editable';
                trigger OnValidate()
                var
                    SICodeunit_CU: Codeunit SingleInstance_CU;
                begin
                    if CopyDate then
                        TempBool := true
                    else
                        TempBool := false;
                    SICodeunit_CU.SetCopyDate(CopyDate)
                end;
            }
        }

        modify(FromDate)
        {
            Editable = TempBool;

        }
        modify(ToDate)
        {
            Editable = TempBool;

        }
    }



    var
        TempBool: Boolean;
        CopyDate: Boolean;

    trigger OnOpenPage()
    var
        SICodeunit_CU: Codeunit SingleInstance_CU;
    begin
        SICodeunit_CU.ClearDate();
    end;

    trigger OnAfterGetRecord()
    begin
        if CopyDate then
            TempBool := true
        else
            TempBool := false;
    end;


}
