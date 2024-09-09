

reportextension 50902 "Standard Sales Quote Ext" extends "Standard Sales - Quote"
{
    dataset
    {
        add(Header)
        {


            column(CustomerAddr1; CustAddr1[1])
            {
            }
            column(CustomerAddr2; CustAddr1[2])
            {
            }
            column(CustomerAddr3; CustAddr1[3])
            {
            }
            column(CustomerAddr4; CustAddr1[4])
            {
            }
            column(CustomerAddr5; CustAddr1[5])
            {
            }
            column(CustomerAddr6; CustAddr1[6])
            {
            }
            column(CustomerAddr7; CustAddr1[7])
            {
            }
            column(CustomerAddr8; CustAddr1[8])
            {
            }
            column(Contact_Name; "Contact Name")
            {
            }

        }
        modify(Header)
        {

            trigger OnAfterAfterGetRecord()
            var
                FormatAddr: Codeunit "Format Address";

            begin
                Clear(CustAddr1);
                FormatAddr.SalesHeaderSellTo(CustAddr1, Header);
            end;
        }
        add(Line)
        {
            column(Unit_Price; "Unit Price")
            {
            }
            column(Line_Amount; "Line Amount")
            {
            }
            column(VATAmountLCY; VatAmount)
            {
            }

        }
        modify(Line)
        {
            trigger OnAfterAfterGetRecord()
            var
                GLAccountBillingLineExists: Boolean;
                TempLine: Record "Sales Line";
            begin
                GLAccountBillingLineExists := false;

                TempLine.Reset();
                TempLine.SetRange("Document No.", Line."Document No.");
                if TempLine.FindSet() then
                    repeat
                        if (TempLine.Type = TempLine.Type::"G/L Account") and TempLine."Billing Line" then begin
                            GLAccountBillingLineExists := true;
                            break;
                        end;
                    until TempLine.Next() = 0;

                if GLAccountBillingLineExists then begin
                    if (Line.Type = Line.Type::"G/L Account") and Line."Billing Line" then begin
                        "Unit Price" := Line."Unit Price";
                        "Line Amount" := Line."Line Amount";
                        VatAmount := (Line."Amount Including VAT") - (Line."Line Amount");
                    end
                    else begin
                        "Unit Price" := 0;
                        "Line Amount" := 0;
                        VatAmount := 0;
                    end;
                end
                else begin
                    if not Line."Billing Line" then begin
                        "Unit Price" := Line."Unit Price";
                        "Line Amount" := Line."Line Amount";
                        VatAmount := (Line."Amount Including VAT") - (Line."Line Amount");
                    end
                end;
            end;
        }
    }


    var
        CustAddr1: array[8] of Text[100];
        VatAmount: Decimal;
}


