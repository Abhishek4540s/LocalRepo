codeunit 50912 "Manual Event Subscriber"
{
    EventSubscriberInstance = Manual;
    // [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnRecreateSalesLinesOnBeforeSalesLineDeleteAll, '', false, false)]
    // local procedure "Sales Header_OnRecreateSalesLinesOnBeforeSalesLineDeleteAll"(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; CurrentFieldNo: Integer; var IsHandled: Boolean)
    // var
    //     Customer: Record Customer;
    // begin
    //     If not Customer.get(SalesHeader."Sell-to Customer No.") then
    //         exit;
    //     IF Customer."Generic Customer No" = '' then
    //         exit;
    //     // IsHandled := true;
    //     SalesLine.SuspendStatusCheck(true);
    // end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnBeforeTestStatusOpen, '', false, false)]
    local procedure "Sales Line_OnBeforeTestStatusOpen"(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header"; var IsHandled: Boolean; xSalesLine: Record "Sales Line"; CallingFieldNo: Integer; var StatusCheckSuspended: Boolean)
    var
        Customer: Record Customer;
    begin
        If not Customer.get(SalesHeader."Sell-to Customer No.") then
            exit;
        IF Customer."Generic Customer No" = '' then
            exit;
        StatusCheckSuspended := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::subscriber, OnBeforeCheckProjectSalesQuoteDeleteValidations, '', false, false)]
    local procedure C65105_OnBeforeCheckProjectSalesQuoteDeleteValidations(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;

    // [EventSubscriber(ObjectType::Table, Database::Job, OnBeforeValidateEvent, "Ship-to Code", false, false)]
    // local procedure "Job_ShipToCode_OnBeforeValidateEvent"(CurrFieldNo: Integer; var Rec: Record Job; var xRec: Record Job)
    // var
    //     JobPlanningLines: Record "Job Planning Line";
    //     ShipToAddrress: Record "Ship-to Address";
    //     Customer: Record Customer;
    //     Job_lRec: Record Job;
    //     ShipToAddress_lRec: Record "Ship-to Address";
    //     ShipToAddress_lTex: Text[100];
    // begin
    //     // if CurrFieldNo = 0 then
    //     //     exit;
    //     if (Rec."Ship-to Code" <> '') then begin
    //         // Rec.GetHideValidationDialog() then 
    //         // if (xRec."No." <> '') then begin
    //         if Rec."Ship-to Code" <> xRec."Ship-to Code" then begin
    //             Job_lRec.Reset();
    //             Job_lRec.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
    //             Job_lRec.SetRange("Ship-to Code", Rec."Ship-to Code");
    //             Job_lRec.SetFilter(Status, '<>%1', Job_lRec.Status::Completed);
    //             if ShipToAddress_lRec.Get(Rec."Sell-to Customer No.", Rec."Ship-to Code") then
    //                 ShipToAddress_lTex := ShipToAddress_lRec.Name;
    //             if Job_lRec.FindFirst() then begin
    //                 if not Confirm('Project already exist with same Customer No. %1 and Ship-To Address %2.\Do you still want to change the Ship-To Address?', false, Rec."Sell-to Customer No.", ShipToAddress_lTex) then
    //                     Error('');
    //             end;
    //         end;
    //         // end;
    //     end;
    // end;





}