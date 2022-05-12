page 50032 "Seminar Room List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Seminar Room";
    CardPageId = "Seminar Room Page";
    Editable = false;

    Caption = 'Seminar Room List';

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
                field("Address"; "Address")
                {
                    ApplicationArea = All;

                }
                // field("Address 2"; "Address 2")
                // {
                //     ApplicationArea = All;

                // }

                field("City"; "City")
                {
                    ApplicationArea = All;

                }

                field("Post Code"; "Post Code")
                {
                    ApplicationArea = All;

                }

                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = All;

                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = All;

                }
                field("Fax No."; "Fax No.")
                {
                    ApplicationArea = All;

                }
                field("Maximum Participants"; "Maximum Participants")
                {
                    ApplicationArea = All;

                }

                field("Internal/External"; "Internal/External")
                {
                    ApplicationArea = All;

                }

            }


        }
    }

    var
        myInt: Integer;
}