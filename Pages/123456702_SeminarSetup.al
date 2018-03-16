page 123456702 SeminarSetup {
    //2018-03-16 MLA
    PageType = Card;
    Caption = 'Seminar Setup';
    SourceTable = SeminarSetup;
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;

    layout {
        area(content) {
            group(Numbering) {
                field("Seminar Nos.";"Seminar Nos.") {
                    
                }

                field("Seminar Registration Nos.";"Seminar Registration Nos.") {

                }

                field("Posted Seminar Reg. Nos."; "Posted Seminar Reg. Nos.") {

                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        if not get then begin
            init;
            insert;
        end;
    end;
}