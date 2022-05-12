page 50022 "Instructors"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Instructor;

    Caption = 'Instructors';

    layout
    {
        area(Content)
        {
            repeater(Repeater1)
            {
                field("Code"; "Code")
                {
                    ApplicationArea = All;

                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;

                }
                field("Worker/Subcontractor"; "Worker/Subcontractor")
                {
                    ApplicationArea = All;

                }
                field("Resource No."; "Resource No.")
                {
                    ApplicationArea = All;

                }
                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = All;

                }

            }
        }
    }



    var
        myInt: Integer;
}