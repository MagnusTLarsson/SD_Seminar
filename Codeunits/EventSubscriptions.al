codeunit 123456739 EventSubscriptions {
//2018-03-17 TBM: Created
    
    //[EventSubscriber(ObjectType::ObjectType, ObjectId, 'OnSomeEvent', 'ElementName', SkipOnMissingLicense, SkipOnMissingPermission)]
    [EventSubscriber(ObjectType::Codeunit, 212, 'OnBeforeResLedgEntryInsert', '', true, true)]
    local procedure PostResJnlLineOnBeforeResLedgEntryInsert (var ResLedgerEntry : Record "Res. Ledger Entry";
    ResJournalLine : Record "Res. Journal Line");
    begin
        ResLedgerEntry."Seminar No." := ResJournalLine."Seminar No.";
        ResLedgerEntry."Seminar Registration No." := ResJournalLine."Seminar Registration No.";
    end;
}