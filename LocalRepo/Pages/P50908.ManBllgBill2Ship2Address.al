page 50908 "ManBllgBill2Ship2Address"
{

    PageType = List;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "ManBllgBill2Ship2Address";
    SaveValues = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    AdditionalSearchTerms = 'SST';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Contract; Rec.Contract)
                {

                    ApplicationArea = All;
                    Caption = 'Contract#';
                }
                field(Cust; Rec.Cust)
                {
                    ApplicationArea = All;
                    Caption = 'Cust_#';
                }
                field(Cust_Name; Rec.Cust_Name)
                {
                    ApplicationArea = All;

                }
                field(dbo_SV00500_ADRSCODE; Rec.dbo_SV00500_ADRSCODE)
                {
                    ApplicationArea = All;

                }
                field(dbo_RM00101_ADRSCODE; Rec.dbo_RM00101_ADRSCODE)
                {
                    ApplicationArea = All;

                }
                field(CUSTCLAS; Rec.CUSTCLAS)
                {
                    ApplicationArea = All;

                }
                field(BillTo_Name; Rec.BillTo_Name)
                {
                    ApplicationArea = All;

                }
                field(BillToAddr1; Rec.BillToAddr1)
                {
                    ApplicationArea = All;

                }
                field(BillToAddr2; Rec.BillToAddr2)
                {
                    ApplicationArea = All;

                }
                field(BillToAddr3; Rec.BillToAddr3)
                {
                    ApplicationArea = All;

                }
                field(BillToAddr4; Rec.BillToAddr4)
                {
                    ApplicationArea = All;

                }
                field(BillTo_City; Rec.BillTo_City)
                {
                    ApplicationArea = All;

                }
                field(BillTo_State; Rec.BillTo_State)
                {
                    ApplicationArea = All;

                }
                field(BillTo_Zip; Rec.BillTo_Zip)
                {
                    ApplicationArea = All;

                }
                field(ShipTo_Name; Rec.ShipTo_Name)
                {
                    ApplicationArea = All;

                }
                field(ShipToAddr1; Rec.ShipToAddr1)
                {
                    ApplicationArea = All;

                }
                field(ShipToAddr2; Rec.ShipToAddr2)
                {
                    ApplicationArea = All;

                }
                field(ShipToAddr3; Rec.ShipToAddr3)
                {
                    ApplicationArea = All;


                }
                field(ShipToAddr4; Rec.ShipToAddr4)
                {
                    ApplicationArea = All;


                }
                field(ShipTo_City; Rec.ShipTo_City)
                {
                    ApplicationArea = All;


                }
                field(ShipTo_State; Rec.ShipTo_State)
                {
                    ApplicationArea = All;


                }
                field(ShipTo_Zip; Rec.ShipTo_Zip)
                {
                    ApplicationArea = All;


                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;


                }
                field(Development; Rec.Development)
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
                    ImportSSTFiles_lCdu: Codeunit "Import SST Files";
                begin

                    ImportSSTFiles_lCdu.ReadExcelSheet();
                    ImportSSTFiles_lCdu.Import_ManBllgBill2Ship2Address();
                end;
            }
        }
    }


}