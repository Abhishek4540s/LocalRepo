page 50906 "Job POC"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Job POC";
    Caption = 'Job POC';
    InsertAllowed = false;
    ModifyAllowed = false;

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
                field(Divisions; Rec.Divisions)
                {
                    ApplicationArea = All;

                }
                field(AdjTotalPostedCost; Rec.AdjTotalPostedCost)
                {
                    ApplicationArea = All;

                }
                field("Adj Calc Est Cost"; Rec."Adj Calc Est Cost")
                {
                    ApplicationArea = All;

                }
                field("Adj % Complete"; Rec."Adj % Complete")
                {
                    ApplicationArea = All;

                }
                field("Calc Contract Amt"; Rec."Calc Contract Amt")
                {
                    ApplicationArea = All;

                }
                field("Revenue Earned"; Rec."Revenue Earned")
                {
                    ApplicationArea = All;

                }
                field("Net Billed"; Rec."Net Billed")
                {
                    ApplicationArea = All;

                }
                field("Adj Accrual (Deferral)"; Rec."Adj Accrual (Deferral)")
                {
                    ApplicationArea = All;

                }
                field("Adj Accrued Revenue"; Rec."Adj Accrued Revenue")
                {
                    ApplicationArea = All;

                }
                field("Adj Deffered Revenue"; Rec."Adj Deffered Revenue")
                {
                    ApplicationArea = All;

                }
                field("##"; rec."##")
                {
                    ApplicationArea = All;

                }
                field("Billing$"; Rec."Billing$")
                {
                    ApplicationArea = All;

                }
                field("%Billed"; Rec."%Billed")
                {
                    ApplicationArea = All;

                }
                field("Billing Returns$"; Rec."Billing Returns$")
                {
                    ApplicationArea = All;

                }
                field("Orig Contract Amt"; Rec."Orig Contract Amt")
                {
                    ApplicationArea = All;

                }
                field("Unposted Billing$"; Rec."Unposted Billing$")
                {
                    ApplicationArea = All;

                }
                field("Labor Unposted$"; Rec."Labor Unposted$")
                {
                    ApplicationArea = All;

                }
                field("Unposted Material Cost$"; Rec."Unposted Material Cost$")
                {
                    ApplicationArea = All;

                }
                field("Actual material Cost$"; Rec."Actual material Cost$")
                {
                    ApplicationArea = All;

                }
                field("SOP_Cost$"; Rec."SOP_Cost$")
                {
                    ApplicationArea = All;

                }
                field("Cost returns$"; Rec."Cost returns$")
                {
                    ApplicationArea = All;

                }
                field("Posted labor$"; Rec."Posted labor$")
                {
                    ApplicationArea = All;

                }
                field("Posted Other$"; Rec."Posted Other$")
                {
                    ApplicationArea = All;

                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;

                }
                field("File Imported Date"; Rec."File Imported Date")
                {
                    ApplicationArea = All;

                }
                field("File Imported By"; Rec."File Imported By")
                {
                    ApplicationArea = All;

                }
                field("Is processed"; Rec."Is processed")
                {
                    ApplicationArea = All;

                }
                field(Error; Rec.Error)
                {
                    ApplicationArea = All;

                }
                field("Error Message"; Rec."Error Message")
                {
                    ApplicationArea = All;
                    Style = Attention;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;

                }
                field("Item Details error"; Rec."Item Details error")
                {
                    ApplicationArea = All;
                    Style = Attention;
                }
                field("No. of items"; Rec."No. of items")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        JobItemDetails_lRec: Record "Job Item Details";
                    begin
                        JobItemDetails_lRec.Reset();
                        JobItemDetails_lRec.SetRange(WS_Job_Number, Rec.WS_Job_Number);
                        Page.Run(Page::"Job Item Details", JobItemDetails_lRec);

                    end;

                }
                field(BCdimension1; Rec.BCdimension1)
                {
                    ApplicationArea = All;

                }
                field(BCdscriptnDim1; Rec.BCdscriptnDim1)
                {
                    ApplicationArea = All;

                }
                field("Entry No."; Rec."Entry No.")
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
            action("&Import")
            {
                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import data from excel.';
                trigger OnAction()
                begin
                    Import_CU.ImportJobPOC();
                end;
            }
            action("Batch job post")
            {
                Caption = 'Batch job post';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Post all the data to the jobs';
                trigger OnAction()
                begin
                    if Confirm('Do you wnat to create Job for all the records', false) then
                        CustomJob_CU.BatchJobEntries();
                end;
            }
            action("Single job post")
            {
                Caption = 'Single job post';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Post only single data to the post';
                trigger OnAction()
                var
                    Temp_lInt: Integer;
                    Temp_lBool: Boolean;
                begin
                    Temp_lInt := 1;
                    Temp_lBool := true;
                    if Confirm('Do you wnat to create Job for specific record', false) then
                        CustomJob_CU.InserJobDetails(Rec, Temp_lInt, Temp_lBool);
                end;
            }
            action("Show Item Details")
            {
                Caption = 'Show Item Details';
                Image = View;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'View the item details of the job';
                RunObject = page "Job Item Details";
                RunPageLink = WS_Job_Number = field(WS_Job_Number);
            }
            action("View Job")
            {
                Caption = 'View Job';
                Image = View;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'View Job details of the POC line';
                RunObject = page "Job Card";
                RunPageLink = "No." = field(WS_Job_Number);
            }



        }
    }


    var
        Import_CU: Codeunit ImportJobfiles;
        CustomJob_CU: Codeunit CustomJobLedEntry;
}