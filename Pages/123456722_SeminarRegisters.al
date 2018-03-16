page 123456722 "Seminar Registers" {
// 2018-03-16 TBM
    PageType = List;
    SourceTable = "Seminar Register";
    Caption = 'Seminar Registers';
    Editable = false;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.") {}
                field("Creation Date";"Creation Date") {}
                field("User ID";"User ID") {}
                field("Source Code";"Source Code") {}
                field("Journal Batch Name";"Journal Batch Name") {}
                field("From Entry No.";"From Entry No.") {}
            }
        }
        area(factboxes) {
            systempart("Links"; Links){}
            systempart("Notes"; Notes){}
        }
    }

    actions {
        area(Navigation) {
            action("Seminar Ledgers") {
                Image = WarrantyLedger;
                RunObject=codeunit "Seminar Reg.-Show Ledger";
            }
        }
    }
}