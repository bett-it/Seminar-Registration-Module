Table 50040 "Seminar Registration Header"
{
    DataCaptionFields = "No.";
    Caption = 'Seminar Registration Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            editable = false;
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';

            trigger OnLookup()
            begin
                if "Status" <> "Status"::"Planning" then
                    Error('StartingDateError');


            end;
        }
        field(3; "Seminar Code"; Code[20])
        {
            Caption = 'Seminar Code';
            TableRelation = "Seminar";

            trigger onValidate()
            var
                SR: Record "Seminar";
            begin
                if xRec."Seminar Code" <> Rec."Seminar Code" then begin
                    SR.Reset();
                    SR.SetFilter("Code", "Seminar Code");

                    if SR.FindFirst() then begin
                        "Seminar Name" := SR.Name;
                        "Seminar Duration" := SR."Seminar Duration";
                        "Seminar Price" := SR."Seminar Price";
                        "Minimum Participants" := SR."Minimum Participants";
                        "Maximum Participants" := SR."Maximum Participants";
                        "Seminar Price" := SR."Seminar Price";

                    end;

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

    var
        SeminarCantBeDeletedErr: label 'Only Planned seminars can be deleted';
        StartingDateError: label 'Starting date can not be modified';
}