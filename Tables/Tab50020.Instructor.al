Table 50020 "Instructor"
{
    LookUpPageID = Instructors;
    Caption = 'Instructor';


    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';

        }
        field(3; "Worker/Subcontractor"; Option)
        {
            Caption = 'Type';
            OptionMembers = Resource,Vendor;
            OptionCaption = 'Worker,Subontractor';

            trigger OnValidate()
            begin
                if "Worker/Subcontractor" <> xRec."Worker/Subcontractor" then begin
                    Name := '';
                    "Resource No." := '';
                    "Vendor No." := '';
                end;
            end;
        }
        field(4; "Resource No."; Code[20])
        {
            Caption = 'Resource No.';
            TableRelation = if ("Worker/Subcontractor" = const(Resource)) Resource where("Type" = const("Person"));

            trigger onValidate()
            var
                ResourceRecord: Record Resource;
            begin
                if xRec."Resource No." <> Rec."Resource No." then begin
                    ResourceRecord.Reset();

                    if ResourceRecord.get("Resource No.") then begin
                        "Name" := ResourceRecord.Name
                    end;

                end;

            end;



        }
        field(5; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = if ("Worker/Subcontractor" = const(Vendor)) Vendor;

            trigger onValidate()
            var
                VendorRecord: Record Vendor;
            begin
                if xRec."Vendor No." <> Rec."Vendor No." then begin
                    VendorRecord.Reset();

                    if VendorRecord.get("Vendor No.") then begin
                        "Name" := VendorRecord.Name
                    end;

                end;


            end;

        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }



}

