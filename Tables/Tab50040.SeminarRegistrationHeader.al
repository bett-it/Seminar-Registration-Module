Table 50040 "Seminar Registration Header"
{
    DataCaptionFields = "No.";
    Caption = 'Seminar Registration Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            begin
                if xRec."No." <> '' then
                    Error(NoModifyError);
            end;
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';

            trigger OnValidate()
            begin
                if xRec."Starting Date" <> 0D then
                    if "Status" <> "Status"::"Planning" then
                        Error(StartingDateError);
            end;
        }
        field(3; "Seminar Code"; Code[20])
        {
            Caption = 'Seminar Code';
            TableRelation = "Seminar";

            trigger onValidate()
            var
                SR: Record "Seminar";
                SeminarRegLine: Record "Seminar Registration Line";
            begin
                SeminarRegLine.Reset();
                SeminarRegLine.SetRange(SeminarRegLine."Seminar Registration No.", "No.");
                if SeminarRegLine.FindSet() then begin
                    repeat
                        if SeminarRegLine.Registered then
                            Error(SeminarWithRegisteredLinesModifyErr);
                    until SeminarRegLine.Next() = 0;
                end;
                if Confirm(changeSeminarCodeAsk, false) then begin
                    if ((xRec."Seminar Code" <> Rec."Seminar Code") and (Rec."Seminar Code" <> '')) then begin
                        SR.Reset();
                        SR.SetFilter("Code", "Seminar Code");

                        if SR.FindFirst() then begin
                            "Seminar Name" := SR.Name;
                            "Seminar Duration" := SR."Seminar Duration";
                            "Seminar Price" := SR."Seminar Price";
                            Validate("Seminar Price");
                            "Minimum Participants" := SR."Minimum Participants";
                            "Maximum Participants" := SR."Maximum Participants";

                        end;

                    end
                    else begin
                        "Seminar Name" := '';
                        "Seminar Duration" := 0;
                        "Seminar Price" := 0;
                        Validate("Seminar Price");
                        "Minimum Participants" := 0;
                        "Maximum Participants" := 0;
                    end;
                end
                else begin
                    Rec."Seminar Code" := xRec."Seminar Code";
                end;

            end;
        }
        field(4; "Seminar Name"; Text[50])
        {
            Caption = 'Seminar Name';
        }
        field(5; "Instructor Code"; Code[20])
        {
            Caption = 'Instructor Code';
            TableRelation = "Instructor";

            trigger onValidate()
            var
                IR: Record Instructor;
            begin
                if xRec."Instructor Code" <> Rec."Instructor Code" then begin
                    IR.Reset();
                    IR.SetFilter("Code", "Instructor Code");

                    if IR.FindFirst() then begin
                        "Instructor Name" := IR.Name;
                    end;

                end;

            end;
        }
        field(6; "Instructor Name"; Text[100])
        {
            Caption = 'Instructor Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Instructor.Name where("Code" = field("Instructor Code")));
            Editable = false;
        }
        field(7; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Planning,Registration,Finished,Cancelled;
            OptionCaption = 'Planning,Registration,Finished,Cancelled';
        }
        field(8; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;
        }
        field(9; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
        }
        field(10; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
        }
        field(11; "Seminar Room Code"; Code[20])
        {
            Caption = 'Seminar Room Code';
            TableRelation = "Seminar Room";

            trigger onValidate()
            var
                SRR: Record "Seminar Room";
            begin
                if xRec."Seminar Room Code" <> Rec."Seminar Room Code" then begin
                    SRR.Reset();
                    SRR.SetFilter("Code", "Seminar Room Code");

                    if SRR.FindFirst() then begin
                        "Seminar Room Name" := SRR.Name;
                        "Seminar Room Address" := SRR.Address;
                        "Seminar Room Address 2" := SRR."Address 2";
                        "Seminar Room Post Code" := SRR."Post Code";
                        "Seminar Room City" := SRR."City";
                        "Seminar Room Phone No." := SRR."Phone No.";

                    end;

                end;

            end;
        }
        field(12; "Seminar Room Name"; Text[50])
        {
            Caption = 'Seminar Room Name';
        }
        field(13; "Seminar Room Address"; Text[50])
        {
            Caption = 'Seminar Room Address';
        }
        field(14; "Seminar Room Address 2"; Text[50])
        {
            Caption = 'Seminar Room Address 2';
        }
        field(15; "Seminar Room Post Code"; Code[20])
        {
            Caption = 'Seminar Room Post Code';
            TableRelation = "Post Code";
        }
        field(16; "Seminar Room City"; Text[30])
        {
            Caption = 'Seminar Room City';
        }
        field(17; "Seminar Room Phone No."; Text[30])
        {
            Caption = 'Seminar Room Phone No';
        }
        field(18; "Posting Date"; Date)
        {
            Caption = 'Posting Date';

        }
        field(19; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';

            trigger onValidate()
            var
                SRH: Record "Seminar Registration Header";
                SRL: Record "Seminar Registration Line";
                SRLG: Record "Seminar Registration Line";
                OK: Boolean;
            begin
                if Status <> SRH.Status::Cancelled then begin
                    // Message(FORMAT(SRH.Status));
                    // if xRec."Seminar Room Code" <> Rec."Seminar Room Code" then begin
                    if Confirm(changeSeminarPriceAsk, false) then begin
                        SRL.Reset();
                        SRL.SetRange(SRL."Seminar Registration No.", "No.");

                        if SRL.FindSet() then
                            repeat
                                if not SRL.Registered then begin
                                    SRLG.Get(SRL."Seminar Registration No.", SRL."Line No.");
                                    SRLG."Seminar Price" := "Seminar Price";
                                    SRLG."Line Discount Amount" := SRLG."Seminar Price" * (SRLG."Line Discount %" / 100);
                                    ;
                                    SRLG."Amount" := SRLG."Seminar Price" - SRLG."Line Discount Amount";
                                    SRLG.Modify();
                                end;
                            until SRL.Next() = 0;

                    end
                    else
                        "Seminar Price" := xRec."Seminar Price";

                    CalcFields(Amount);
                    // end;
                end else begin
                    // Message('Hello3');
                    Error(Pricecannotbemodify);
                end;



            end;
        }
        field(20; Amount; Decimal)
        {
            Caption = 'Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Seminar Registration Line".Amount where("Seminar Registration No." = field("No.")));
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }


    trigger OnDelete()
    begin
        if "Status" <> "Status"::"Planning" then
            Error(SeminarCantBeDeletedErr);
    end;

    trigger OnInsert()
    begin
        "Posting Date" := WorkDate();
    end;


    var
        SeminarCantBeDeletedErr: label 'Only Planned seminars can be deleted';
        StartingDateError: label 'Starting date can not be modified';
        SeminarWithRegisteredLinesModifyErr: label 'Seminars with registered lines cannot be modified';
        NoModifyError: label 'No. cannot be modify.';
        Pricecannotbemodify: label 'Seminar Price cannot be modify.';

        changeSeminarPriceAsk: label 'Are you sure you want to change that field?';
        changeSeminarCodeAsk: label 'Are you sure you want to change that field?';

}