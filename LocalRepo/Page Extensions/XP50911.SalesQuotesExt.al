pageextension 50911 SalesQuotesExt extends "Sales Quotes"
{
    layout
    {
        modify("Sell-to Customer No.")
        {
            StyleExpr = StyleTxt;
        }
        modify("Sell-to Customer Name")
        {
            StyleExpr = StyleTxt;
            Visible = false;
        }
        modify("External Document No.")
        {
            StyleExpr = StyleTxt;
        }
        modify("Sell-to Contact")
        {
            StyleExpr = StyleTxt;
        }
        modify("Posting Date")
        {
            StyleExpr = StyleTxt;
        }
        modify("Due Date")
        {
            StyleExpr = StyleTxt;
        }
        modify(Amount)
        {
            StyleExpr = StyleTxt;
        }
        modify("Location Code")
        {
            StyleExpr = StyleTxt;
        }
        addbefore("External Document No.")
        {
            field("Sell-to Customer Name 2"; Rec."Sell-to Customer Name 2")
            {
                ApplicationArea = all;
                StyleExpr = StyleTxt;
                Visible = true;
                Caption = 'Sell to Customer Name';
            }
            field("Job No"; Rec."Job No")
            {
                ApplicationArea = all;
                StyleExpr = StyleTxt;
                Visible = true;
                Caption = 'Project No.';
            }
            field("Generic Customer No"; Rec."Generic Customer No")
            {
                ApplicationArea = all;
                StyleExpr = StyleTxt;
                Visible = true;
                Caption = 'Generic Customer No.';
            }
        }
    }

    actions
    {
        modify(DeleteOverdueQuotes)
        {
            Enabled = false;
            Visible = false;
        }

        addbefore(Dimensions)
        {
            action("Archive Project affiliated Quotes")
            {
                ApplicationArea = All;
                // Promoted = true;
                Image = Archive;
                trigger OnAction()
                var
                    SalesHeaderRec: Record "Sales Header";
                begin
                    CurrPage.SetSelectionFilter(SalesHeaderRec);
                    QuoteToJJobCdu.ArchiveProjectAffiliatedSalesQuote(SalesHeaderRec);
                    CurrPage.Update();
                end;
            }
            action(OpenJob)
            {
                ApplicationArea = All;
                // Promoted = true;
                Image = Job;
                Caption = 'Open Project';
                Visible = true;
                // RunObject = page "Job Card";
                // RunPageLink = "No." = field("Job No");
                trigger OnAction()
                var
                    JobCard_lPage: Page "Job Card";
                    Job_lRec: Record Job;
                begin
                    if Rec."Job No" = '' then
                        Message('Project does not exists with this Sales Quote - %1, Kindly create a new project.', Rec."No.")
                    else begin
                        Job_lRec.Reset();
                        Job_lRec.Get(Rec."Job No");
                        // JobCard_lPage.SetTableView(Job_lRec);
                        JobCard_lPage.SetRecord(Job_lRec);
                        JobCard_lPage.run;
                    end;
                end;
            }
        }
        addfirst(Category_Category4)
        {
            actionref(Archive; "Archive Project affiliated Quotes")
            {
            }
        }
        addlast(Category_Process)
        {
            actionref(Open; OpenJob)
            {
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        StyleTxt := SetStyle();
    end;

    var
        StyleTxt: Text;
        QuoteToJJobCdu: Codeunit QuoteToJob;
}
