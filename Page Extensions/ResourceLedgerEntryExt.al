pageextension 123456703 ResourceLedgerEntryExt extends "Resource Ledger Entries" {
//2018-03-17 TBM: Created
    
    layout {
        addlast(Content) {
            field("Seminar No.";"Seminar No.") {}
            field("Seminar Registration No."; "Seminar Registration No.") {}
        }
    }

    actions {
        // Add changes to page actions here
    }
    
    var
        myInt : Integer;
}