pageextension 123456701 ResourceListExt extends "Resource List" {
    // CSD1.00 - 2018-03-15 - ML_Dev
    
    layout {
        modify(Type) {
            Visible = ShowType;
        }

        addafter(Type) {
            field("Resource Type"; "Resource Type") {}

            field("Maximum Participants"; "Maximum Participants") {
                Visible = ShowMaxField;
            }
        }
    }
    
    trigger OnOpenPage();
    begin
        FilterGroup(3);
        ShowType := (GetFilter(Type)='');
        ShowMaxField := (GetFilter(Type) = format(Type::Machine));
        FilterGroup(0);
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;

        [InDataSet]
        ShowType: Boolean;
}