page 50907 "Job Item Details"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "Job Item Details";
    SaveValues = true;


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(CUSTNMBR; Rec.CUSTNMBR)
                {
                    ApplicationArea = All;

                }
                field(CUSTNAME; Rec.CUSTNAME)
                {
                    ApplicationArea = All;

                }
                field(WS_Job_Number; Rec.WS_Job_Number)
                {

                    ApplicationArea = All;

                }
                field(SOPTYPE; Rec.SOPTYPE)
                {
                    ApplicationArea = All;

                }
                field(SOPNUMBER; Rec.SOPNUMBER)
                {
                    ApplicationArea = All;

                }
                field(LNITMSEQ; Rec.LNITMSEQ)
                {
                    ApplicationArea = All;

                }
                field(CMPNTSEQ; Rec.CMPNTSEQ)
                {
                    ApplicationArea = All;

                }
                field(ITEMNMBR; Rec.ITEMNMBR)
                {
                    ApplicationArea = All;
                    Caption = 'ITEMNMBR 4/25/24 w Qty added';
                }
                field(QTYFULFI; Rec.QTYFULFI)
                {
                    ApplicationArea = All;

                }
                field(QTYTOINV; Rec.QTYTOINV)
                {
                    ApplicationArea = All;

                }
                field(QUANTITY; Rec.QUANTITY)
                {
                    ApplicationArea = All;

                }
                field(QTYREMAI; Rec.QTYREMAI)
                {
                    ApplicationArea = All;

                }
                field(UNITCOST; Rec.UNITCOST)
                {
                    ApplicationArea = All;

                }
                field(CURRCOST; Rec.CURRCOST)
                {
                    ApplicationArea = All;

                }
                field(EXTDCOST; Rec.EXTDCOST)
                {
                    ApplicationArea = All;

                }
                field(XTNDPRCE; Rec.XTNDPRCE)
                {
                    ApplicationArea = All;

                }
                field(ITMCLSCD; Rec.ITMCLSCD)
                {
                    ApplicationArea = All;

                }
                field(STNDCOST; Rec.STNDCOST)
                {
                    ApplicationArea = All;

                }
                field(LaborUnpExtCst; Rec.LaborUnpExtCst)
                {
                    ApplicationArea = All;

                }
                field(GV_Ext_Cost_LaborExtCst; Rec.GV_Ext_Cost_LaborExtCst)
                {
                    ApplicationArea = All;
                    Caption = 'GV Ext_Cost + LaborExtCst';

                }
                field(GVEXTDCOST2; Rec.GVEXTDCOST2)
                {
                    ApplicationArea = All;


                }
                field(FileName; Rec.FileName)
                {
                    ApplicationArea = All;


                }
                field(FileimportedDate; Rec.FileimportedDate)
                {
                    ApplicationArea = All;


                }
                field(FileImportedBy; Rec.FileImportedBy)
                {
                    ApplicationArea = All;


                }

                field(IsProcessed; Rec.IsProcessed)
                {
                    ApplicationArea = All;


                }
                field(Error; Rec.Error)
                {
                    ApplicationArea = All;


                }
                field(ErrorMessage; Rec.ErrorMessage)
                {
                    ApplicationArea = All;


                }
                field(BCDimension1; Rec.BCDimension1)
                {
                    ApplicationArea = All;


                }
                field(BCdscriptnDim1; Rec.BCdscriptnDim1)
                {
                    ApplicationArea = All;

                }
                field(Divisions; Rec.Divisions)
                {
                    ApplicationArea = All;

                }
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = All;

                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Import)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = ImportExcel;
                ToolTip = 'Import Data From Excel';

                trigger OnAction();
                var
                begin
                    Import_CU.ImportJobItemdetails();
                end;
            }
        }
    }

    var
        Import_CU: Codeunit ImportJobfiles;

}