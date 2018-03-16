table 123456700 SeminarCommentLine {
    //2018-03-15 ML_Dev
    
    Caption = 'Seminar Comment Line';
    LookupPageId = SeminarCommentList;
    DrillDownPageId = SeminarCommentList;

    fields {
        field(10; "Table Name"; Option) {
            Caption = 'Table Name';
            OptionMembers = "Seminar", "Seminar Registration", "Posted Seminar Reg.";
            OptionCaption = 'Seminar,Seminar Registration,Posted Seminar Reg.';
        }

        field(20; "Document Line no."; Integer) {
            Caption = 'Document Line No.';
        }

        field(30; "No."; Code[20]) {
            Caption = 'No.';
            TableRelation = if ("Table Name" = const(Seminar)) "Seminar";
        }

        field(40; "Line No."; Integer) {
            Caption = 'Line No.';
        }

        field(50; "Date"; Date) {
            Caption = 'Date';
        }

        field(60; "Code"; Code[10]) {
            Caption = 'Code';
        }

        field(70; "Comment"; Text[80]) {
            Caption = 'Comment';
        }
    }

    keys {
        key(PK; "Table Name", "Document Line no.", "No.", "Line No.") {
            Clustered = true;
        }
    }
    


}