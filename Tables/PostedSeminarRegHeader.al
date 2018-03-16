table 123456718 "Posted Seminar Reg. Header" {
//2018-03-16 TBM: Created

    Caption = 'Posted Seminar Reg. Header';

    fields {
        field(1;"No.";Code[20]) {
            Caption = 'No.';
        }
        field(2;"Starting Date";Date)
        {   
            Caption = 'Starting Date';
        }
        field(3;"Seminar No.";Code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = Seminar;
        }
        field(4;"Seminar Name";Text[50])
        {
            Caption = 'Seminar Name';
        }
        field(5;"Instructor Resource No.";Code[20])
        {
            Caption = 'Instructor Resource No.';
            TableRelation = Resource where (Type=const(Person));
        }
        field(6;"Instructor Name";Text[50])
        {
            Caption = 'Instructor Name';
            CalcFormula = Lookup(Resource.Name where ("No."=Field("Instructor Resource No."),
                                                      Type=const(Person)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7;Status;Option)
        {
            Caption = 'Status';
            OptionCaption = 'Planning,Registration,Closed,Canceled';
            OptionMembers = Planning,Registration,Closed,Canceled;
        }
        field(8;Duration;Decimal)
        {
            Caption = 'Duration';
            DecimalPlaces = 0:1;
        }
        field(9;"Maximum Participants";Integer)
        {
            Caption = 'Maximum Participants';
        }
        field(10;"Minimum Participants";Integer)
        {
            Caption = 'Minimum Participants';
        }
        field(11;"Room Resource No.";Code[10])
        {
            Caption = 'Room Resource No.';
            TableRelation = Resource where (Type=const(Machine));
        }
        field(12;"Room Name";Text[30])
        {
            Caption = 'Room Name';
        }
        field(13;"Room Address";Text[30])
        {
            Caption = 'Room Address';
        }
        field(14;"Room Address 2";Text[30])
        {
            Caption = 'Room Address 2';
        }
        field(15;"Room Post Code";Code[20])
        {
            Caption = 'Room Post Code';
            TableRelation = "Post Code".Code;
            ValidateTableRelation = false;
        }
        field(16;"Room City";Text[30])
        {
            Caption = 'Room City';
        }
        field(17;"Room Country/Reg. Code";Code[10])
        {   
            Caption = 'Room Country/Reg. Code';
            TableRelation = "Country/Region";
        }
        field(18;"Room County";Text[30])
        {
            Caption = 'Room County';
        }
        field(19;"Seminar Price";Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
        }
        field(20;"Gen. Prod. Posting Group";Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group".Code;
        }
        field(21;"VAT Prod. Posting Group";Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group".Code;
        }
        field(22;Comment;Boolean)
        {
            Caption = 'Comment';
            
            CalcFormula = Exist(SeminarCommentLine
            where ("Table Name" = const("Posted Seminar Registration"),"No."=Field("No.")));
            
            Editable = false;
            FieldClass = FlowField;
        }
        field(23;"Posting Date";Date)
        {
            Caption = 'Posting Date';
        }
        field(24;"Document Date";Date)
        {
            Caption = 'Document Date';
        }
        field(25;"Reason Code";Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code".Code;
        }
        field(26;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series".Code;
        }
        field(27;"Posting No. Series";Code[10])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series".Code;
        }
        field(29;"User Id";Code[50]) {
            Caption = 'User Id';
            TableRelation = User."User Name";
            ValidateTableRelation = false;
            
            trigger OnLookup();
            var
                UserMgt : Codeunit "User Management";
            begin
                UserMgt.LookupUserID("User Id");
            end;
        }

        field(30; "Source Code"; Code[10]) {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }

    }

    keys {
        key(PK;"No.") {}
        key(Key2;"Room Resource No.")
        {
            SumIndexFields = Duration;
        }
    }
}

