page 123456734 "Posted Seminar Registration"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 7 - Lab 3
    //     - Created new page

    Caption = 'Seminar Registration';
    Editable = false;
    PageType = Document;
    SourceTable = Table123456718;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                }
                field("Starting Date";"Starting Date")
                {
                }
                field("Seminar No.";"Seminar No.")
                {
                }
                field("Seminar Name";"Seminar Name")
                {
                }
                field("Instructor Resource No.";"Instructor Resource No.")
                {
                }
                field("Instructor Name";"Instructor Name")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field(Status;Status)
                {
                }
                field(Duration;Duration)
                {
                }
                field("Minimum Participants";"Minimum Participants")
                {
                }
                field("Maximum Participants";"Maximum Participants")
                {
                }
            }
            part(SeminarRegistrationLines;123456735)
            {
                SubPageLink = Document No.=FIELD(No.);
            }
            group("Seminar Room")
            {
                field("Room Resource No.";"Room Resource No.")
                {
                }
                field("Room Name";"Room Name")
                {
                }
                field("Room Address";"Room Address")
                {
                }
                field("Room Address 2";"Room Address 2")
                {
                }
                field("Room Post Code";"Room Post Code")
                {
                }
                field("Room City";"Room City")
                {
                }
                field("Room Country/Reg. Code";"Room Country/Reg. Code")
                {
                }
                field("Room County";"Room County")
                {
                }
            }
            group(Invoicing)
            {
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                }
                field("Seminar Price";"Seminar Price")
                {
                }
            }
        }
        area(factboxes)
        {
            part(;123456717)
            {
                SubPageLink = No.=FIELD(Seminar No.);
            }
            part(;9084)
            {
                Provider = SeminarRegistrationLines;
                SubPageLink = No.=FIELD(Bill-to Customer No.);
            }
            systempart(;Links)
            {
            }
            systempart(;Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Seminar Registration")
            {
                Caption = '&Seminar Registration';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = Page 123456706;
                    RunPageLink = No.=FIELD(No.);
                    RunPageView = WHERE(Document Type=CONST(Posted Seminar Registration));
                }
                action("&Charges")
                {
                    Caption = '&Charges';
                    Image = Costs;
                    RunObject = Page 123456739;
                    RunPageLink = Document No.=FIELD(No.);
                }
            }
        }
    }
}

