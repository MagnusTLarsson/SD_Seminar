page 123456704 SeminarList {
    //2018-03-16 TBM (mla)
    Caption = 'SeminarList';
    PageType = List;
    SourceTable = Seminar;
    Editable = false;
    CardPageId = 123456703;
    UsageCategory = Lists;

    layout {
        area(content) {
            repeater(Group) {
                field("No.";"No.") {}

                field(Name;Name) {}

                field("Seminar Duration";"Seminar Duration") {}

                field("Seminar Price";"Seminar Price") {}

                field("Minimum Participants";"Minimum Participants") {}

                field("Maximum Participants";"Maximum Participants") {}
            }
        }
        area(factboxes) {
            systempart("Links"; Links) {}
            systempart("Notese"; Notes) {}
        }
    }

    actions {
        area(Navigation) {
            group("&Seminar") {
                action("Co&mments") {
                    RunObject = page SeminarCommentSheet;
                    RunPageLink = "Table Name" = const(Seminar), "No."=field("No.");
                    Image = Comment;
                }
            }
        }
    }
}