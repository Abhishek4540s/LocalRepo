reportextension 50901 JobPlanningExt extends "Job - Planning Lines"
{
    dataset
    {
        modify("Job Planning Line")
        {
            RequestFilterFields = "Ready to Bill";
        }
    }


    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
    }
}