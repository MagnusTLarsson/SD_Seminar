tableextension 123456704  ResJournalLineExt extends "Res. Journal Line" {
// 2018-03-17 TBM: Created
    fields {
        field(123456700;"Seminar No.";code[20]) {
            Caption='Seminar No.';
            TableRelation=Seminar;
        }

        field(123456701;"Seminar Registration No.";code[20]) {
            Caption='Seminar Registration No.';
            TableRelation="Seminar Registration Header";
        }
    }
    
    var
        myInt : Integer;
}