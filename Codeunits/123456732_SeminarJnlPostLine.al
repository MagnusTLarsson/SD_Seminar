codeunit 123456732 "Seminar Jnl.-Post Line" {
//2018-03-16 TBM Created

    TableNo = "Seminar Journal Line";

    trigger OnRun();
    begin
        RunWithCheck(SeminarJnlLine);
    end;
    
    var
        SeminarJnlLine : Record "Seminar Journal Line";
        SeminarLedgerEntry : Record "Seminar Ledger Entry";
        SeminarRegister : Record "Seminar Register";
        SeminarJnlCheckLine : Codeunit "Seminar Jnl.-Check Line";
        NextEntryNo : Integer;

    procedure RunWithCheck(var SeminarJnlLine2: Record "Seminar Journal Line");
    begin
        with SeminarJnlLine2 do begin
            SeminarJnlLine := SeminarJnlLine2;
            Code();
            SeminarJnlLine2 := SeminarJnlLine;
        end;
    end;

    local procedure Code();
    begin
        with SeminarJnlLine do begin

        end;
    end;
}