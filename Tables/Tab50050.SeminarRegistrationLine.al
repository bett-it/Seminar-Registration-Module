Table 50050 "Seminar Registration Line"
{
    Caption = 'Seminar Registration Line';

    fields
    {
        field(1; "Seminar Registration No."; Code[20])
        {
            Caption = 'Seminar Registration No.';
            TableRelation = "Seminar Registration Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            TableRelation = "Customer";
            trigger OnValidate()
            begin
                if xRec."Bill-to Customer No." <> '' then
                    if "Registered" then
                        Error(BillToCustomerModifyError);
                if xRec."Bill-to Customer No." <> "Bill-to Customer No." then begin
                    "Participant Contact No." := '';
                    "Participant Name" := '';
                end;
            end;
        }
        field(4; "Participant Contact No."; Code[20])
        {
            Caption = 'Participant Contact No.';
            TableRelation = Contact;

            trigger OnLookup()
            var
                CBR: Record "Contact Business Relation";
                C: Record "Contact";
                SRH: Record "Seminar Registration Header";

            begin
                CBR.Reset();
                CBR.SetRange("Link to Table", CBR."Link to Table"::Customer);
                CBR.SetRange("No.", "Bill-to Customer No.");
                if CBR.FindFirst() then begin
                    C.SetRange("Company No.", CBR."Contact No.");
                    if Page.RunModal(5052, C) = ACTION::LookupOK then
                        "Participant Contact No." := C."No.";
                end;
                CalcFields("Participant Name");

                if ("Participant Contact No." <> '') then begin
                    SRH.Reset();
                    SRH.SetRange(SRH."No.", "Seminar Registration No.");
                    if SRH.FindFirst() then begin
                        "Seminar Price" := SRH."Seminar Price";
                        "Line Discount Amount" := "Seminar Price" * ("Line Discount %" / 100);
                        "Amount" := "Seminar Price" - "Line Discount Amount";

                    end;
                end;


            end;

        }
        field(5; "Participant Name"; Text[100])
        {
            Caption = 'Participant Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Contact.Name where("No." = field("Participant Contact No.")));
        }

        field(6; "Register Date"; Date)
        {
            Caption = 'Register Date';
            Editable = false;
        }
        field(7; "To Invoice"; Boolean)
        {
            Caption = 'To Invoice';
            InitValue = false;
        }
        field(8; Participated; Boolean)
        {
            Caption = 'Participated';
        }
        field(9; "Confirmation Date"; Date)
        {
            Caption = 'Confirmation Date';
        }
        field(10; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 2;
            // FieldClass = FlowField;
            // CalcFormula = Lookup("Seminar Registration Header"."Seminar Price" where("No." = field("Seminar Registration No.")));
            Editable = false;

            trigger OnValidate()
            begin
                validate("Line Discount %");
            end;
        }
        field(11; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
            MaxValue = 100;

            trigger OnValidate()
            begin
                "Line Discount Amount" := "Seminar Price" * ("Line Discount %" / 100);
                Amount := "Seminar Price" - "Line Discount Amount";
            end;
        }
        field(12; "Line Discount Amount"; Decimal)
        {
            Caption = 'Line Discount Amount';
            AutoFormatType = 1;

            trigger OnValidate()
            begin
                "Line Discount %" := 100 * "Line Discount Amount" / "Seminar Price";
                Amount := "Seminar Price" - "Line Discount Amount";
            end;
        }
        field(13; Amount; Decimal)
        {
            Caption = 'Amount';
            AutoFormatType = 1;

            trigger OnValidate()
            begin
                "Line Discount Amount" := "Seminar Price" - Amount;
                "Line Discount %" := 100 * "Line Discount Amount" / "Seminar Price";
            end;

        }
        field(14; Registered; Boolean)
        {
            Caption = 'Registered';
            trigger OnValidate()
            begin
                if (xRec."Registered" <> "Registered") then
                    if ("Register Date" = 0D) then
                        "Register Date" := WorkDate();
            end;
        }

        field(15; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
            TableRelation = "Sales Header" where("Document Type" = const("Invoice"));
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Seminar Registration No.", "Line No.")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    trigger OnDelete()
    begin
        if "Registered" = true then
            Error(RecordCantBeDeletedErr);
    end;

    var
        RecordCantBeDeletedErr: label 'Record cannot be deleted.';
        BillToCustomerModifyError: label 'Record cannot me modify.';
}



