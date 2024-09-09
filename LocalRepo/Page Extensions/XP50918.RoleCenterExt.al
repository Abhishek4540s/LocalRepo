pageextension 50918 RoleCenterExt extends "Business Manager Role Center"
{
    // layout
    // {
    //     addafter()
    // }

    actions
    {

        addlast(sections)
        {
            group(WennSoft)
            {
                action("Maintenance Contract")
                {
                    ApplicationArea = all;
                    Caption = 'Maintenance Contract';
                    RunObject = Page "Maintenance Contract";
                }
                action("WennSoft_Items")
                {
                    ApplicationArea = all;
                    Caption = 'Items';
                    RunObject = Page WennSoft_Items;
                }
                action("Customer Maintainence")
                {
                    ApplicationArea = all;
                    Caption = 'Customer Maintainence';
                    RunObject = Page "Customer Maintainence";
                }
                action(Technicians)
                {
                    ApplicationArea = all;
                    Caption = 'Technicians';
                    RunObject = Page Technician;
                }
                action("Service Call(All)")
                {
                    ApplicationArea = all;
                    Caption = 'Service Call(All)';
                    RunObject = Page "Service Call(All)";
                }
                action("Service Call(History)")
                {
                    ApplicationArea = all;
                    Caption = 'Service Call(History)';
                    RunObject = Page "Service Call(History)";
                }
                action("Contract History")
                {
                    ApplicationArea = all;
                    Caption = 'Contract History';
                    RunObject = Page "Contract History";
                }
                action("Kit Master Header")
                {
                    ApplicationArea = all;
                    Caption = 'Kit Master Header';
                    RunObject = Page "Kit Master Header";
                }

            }

        }
        addlast(Action40)
        {
            action(Projects)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Projects';
                RunObject = Page "Job List";
            }
        }
    }

}