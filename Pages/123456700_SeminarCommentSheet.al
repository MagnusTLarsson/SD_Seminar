page 123456700 SeminarCommentSheet {
//2018-03-15 MLA_Dev
    
    Caption = 'Seminar Comment Sheet';
    PageType = List;
    SourceTable = "SeminarCommentLine";
    UsageCategory = Tasks;
    AutoSplitKey = true;

    layout {
        area(content) {
            repeater(Group) {
                field("Date"; "Date") {}

                field("Code"; "Code") {
                    Visible = false;
                }

                field("Comment"; "Comment") {}
            }
        }
    }

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        SetupNewLine();
    end;

}