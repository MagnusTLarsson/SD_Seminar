pageextension 123456702 SourceCodeSetupExt extends "Source Code Setup" {
    //2018-03-16 TBM
    //  add new group:  Seminar
    //  add new field:  Seminar
    layout
    {
        addafter("Cost Accounting") {
            group(SeminarGroup) {
                Caption = 'Seminar';
            }
        }

        addfirst(SeminarGroup) {
            field(Seminar;Seminar) {}
        }
    }
}