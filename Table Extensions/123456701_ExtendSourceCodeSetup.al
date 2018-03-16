tableextension 123456701 ExtendSourceCodeSetup extends "Source Code Setup" {
    //2018-3-16 TBM
    //  - add new fields:
    //      - Seminar
    fields {
        field(123456700; Seminar; Code[10]) {
            Caption = 'Seminar';
            TableRelation = "Source Code";
        }
    }
}