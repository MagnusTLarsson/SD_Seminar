codeunit 123456734 "Seminar Reg.-Show Ledger" {
//2018-03-16 TBM Created

    TableNo = "Seminar Register";

    trigger OnRun();
    begin
        SeminarLedgerEntry.SetRange("Entry No.", "From Entry No.", "To Entry No.");
        page.Run(Page::"Seminar Ledger Entries", SeminarLedgerEntry);
    end;
    
    var
        SeminarLedgerEntry : Record "Seminar Ledger Entry";
}