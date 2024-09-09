pageextension 50901 GenJournalExt extends "General Journal"
{
    layout
    {

        addafter(Comment)
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = all;
                Caption = 'Project No.';
            }
            field(JRNENTRY; Rec.JRNENTRY)
            {
                ApplicationArea = all;
                Caption = 'GP_ORDOCNUM';
            }
            field("Fiscal Year"; Rec."Fiscal Year")
            {
                ApplicationArea = all;
            }
            field(Period; Rec.Period)
            {
                ApplicationArea = all;
            }
            field(Actnumst; Rec.Actnumst)
            {
                ApplicationArea = all;
                Caption = 'GP_Actnumst';
            }
            field(ORMSTRID; Rec.ORMSTRID)
            {
                ApplicationArea = all;
                Caption = 'GP_ORMSTRID';
            }
            field(SOURCDOC; Rec.SOURCDOC)
            {
                ApplicationArea = all;
                Caption = 'GP_SOURCDOC';
            }
            field(ORMSTRNM; Rec.ORMSTRNM)
            {
                ApplicationArea = all;
                Caption = 'GP_ORMSTRNM';
            }
            field(BCdscriptnDim1; Rec.BCdscriptnDim1)
            {
                ApplicationArea = all;
                Caption = 'GP_BCdscriptnDim1 ';
            }
            field("BC GL Name"; Rec."BC GL Name")
            {
                ApplicationArea = all;
                Caption = 'GP_BC GL Name ';
            }
            field("BC Income/Balance"; Rec."BC Income/Balance")
            {
                ApplicationArea = all;
                Caption = 'GP_BC Income/Balance';
            }
            field("BC Account Category"; Rec."BC Account Category")
            {
                ApplicationArea = all;
                Caption = 'GP_BC Account Category';
            }
            field("BC Account Subcategory"; Rec."BC Account Subcategory")
            {
                ApplicationArea = all;
                Caption = 'GP_BC Account Subcategory';
            }
            field(REFRENCE; Rec.REFRENCE)
            {
                ApplicationArea = all;
                Caption = 'GP_Refrence';
            }
            field("Job or Null"; Rec."Job or Null")
            {
                ApplicationArea = all;
                Caption = 'GP_Job or Null';
            }
            field("GP  Data Import "; Rec."GP  Data Import ")
            {
                ApplicationArea = all;
            }
            field("Is GL History"; Rec."Is GL History")
            {
                ApplicationArea = all;
            }
        }
    }
}