table 123456703 Seminar {
//2018-03-15 ML_dev
    Caption = 'Seminar';
    
    fields
    {
        field(10; "No."; Code[20]) {
            Caption = 'No.';
            AssistEdit = true;
            trigger onAssistEdit();
            begin
                if AssistEdit then
                    CurrPage.Update;
            end;
        }

        field(20; "Name"; Text[50]) {
            Caption = 'Name';
            trigger OnValidate();
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or
                    ("Search Name" = '') then
                    "Search Name" := Name;
            end;
        }

        field(30; "Seminar Duration"; Decimal) {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0:1;
        }

        field(40; "Minimum Participants"; Integer) {
            Caption = 'Minimum Participants';
        }

        field(50; "Maximum Participants"; Integer) {
            Caption = 'Maximum Participants';
        }

        field(60; "Search Name"; Code[50]) {
            Caption = 'Search Name';
        }

        field(70; "Blocked"; Boolean) {
            Caption = 'Blocked';
        }

        field(80; "Last Date Modified"; Date) {
            Caption = 'Last Date Modified';
            Editable = false;
        }

        field(90; "Comment"; Boolean) {
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Comment Line" where("Table Name" = const(123456700), "No."=field("No.")));
        }

        field(100; "Seminar Price"; Decimal) {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
        }

        field(110; "Gen. Prod. Posting Group"; Code[10]) {
            Caption = 'Gen. Product Posting Group';
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate();
            begin
                if (xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group") then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup
                        (GenProdPostingGroup, "VAT Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group",
                        GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;
            end;
        }

        field(120; "VAT Prod. Posting Group"; Code[10]) {
            Caption = 'VAT Prod. Psoting Group';
            TableRelation = "VAT Product Posting Group";
        }

        field(130; "No. Series"; Code[10]) {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys {
        key(PK; "No.") {
            Clustered = true;
        }
    }
    
    var
        SeminarSetup : Record SeminarSetup;
        SeminarCommentLine : Record SeminarCommentLine;
        Seminar: Record Seminar;
        GenProdPostingGroup : Record "Gen. Product Posting Group";
        NoSeriesMgt : Codeunit NoSeriesManagement;

    trigger OnInsert();
    begin
        if "No." = '' then begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify();
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete();
    begin
        SeminarCommentLine.Reset;
        SeminarCommentLine.SetRange("Table Name", 123456702); //Seminar
        SeminarCommentLine.SetRange("No.", "No.");
        SeminarCommentLine.DeleteAll;
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := Today;
    end;
    
procedure AssistEdit() : Boolean;
    begin
        with Seminar do begin
            Seminar := Rec;
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");

            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.",
            xRec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                exit(true);
            end;
        end;
    end;
}