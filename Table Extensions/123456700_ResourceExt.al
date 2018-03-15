tableextension 123456700 ResourceExt extends Resource {
    // CSD1.00 - 2018-03-15 - ML_Dev

    fields {
        field(123456700; "Resource Type"; Option) {
            Caption = 'Resource Type';
            OptionMembers = "Internal", "External";
            OptionCaption = 'Internal,External';
            //DataClassification = ToBeClassified;
        }

        field(123456701; "Maximum Participants"; Integer) {
            Caption = 'Maximum Participants';
        }

        field(123456702; "Quantity Per Day"; Decimal) {
            Caption = 'Quantity Per Day';
        }
    }
}