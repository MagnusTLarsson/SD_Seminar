page 123456703 SeminarCard {
    //2018-03-16 MLA

    PageType = Card;
    SourceTable = Seminar;
    Caption = 'Seminar Card';
    UsageCategory = Tasks;

    layout {
        area(content) {
            group(General) {
                field("No.";"No.") {
                    trigger OnAssistEdit();
                    begin
                        if AssistEdit then
                            CurrPage.Update;
                    end;
                }

                field("Search Name";"Search Name") {}

                field("Seminar Duration";"Seminar Duration") {}

                field("Minimum Participants";"Minimum Participants") {}

                field("Maximum Participants";"Maximum Participants") {}

                field(Blocked;Blocked) {}

                field("Last Date Modified";"Last Date Modified") {}
            }

            group(Invoicing) {
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group") {}

                field("VAT Prod. Posting Group";"VAT Prod. Posting Group") {}

                field("Seminar Price";"Seminar Price") {}
            }
        }

        area(FactBoxes) {
            systempart("Links"; Links) {}

            systempart("Notes"; Notes) {}
        }
    }

    actions {
        area(Navigation) {
            group("&Seminar") {
                action("Co&mments") {
                    RunObject = page SeminarCommentSheet;
                    RunPageLink = "Table Name" = const(Seminar), "No." = field("No.");
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                }
            }
        }
    }
    
    var
        myInt : Integer;
}