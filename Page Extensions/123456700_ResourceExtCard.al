pageextension 123456700 "ResourceExtCard" extends "Resource Card" {
    // CSD1.00 - 2018-03-15 - ML_Dev
    
    layout {
        
        addlast(General) {
            field("Resource Type"; "Resource Type") {}
        }

        addafter("Personal Data") {
            group("Room") {
                field("Maximum Participants"; "Maximum Participants") {
                    Visible = ShowMaxField;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        ShowMaxField := (Type = Type::Machine);
        CurrPage.Update(false);
    end;

    var 
        [InDataSet]
        ShowMaxField: Boolean;
}