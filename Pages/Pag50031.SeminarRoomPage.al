page 50031 "Seminar Room Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Seminar Room";

    Caption = 'Semianr Room Page';

    layout
    {
        area(Content)
        {
            group("General")
            {
                Caption = 'General';
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
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = All;

                }

                field("Post Code"; "Post Code")
                {
                    ApplicationArea = All;

                }
                field("City"; "City")
                {
                    ApplicationArea = All;

                }

                field("Country/Region Code"; "Country/Region Code")
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
            group(Communication)
            {
                Caption = 'Communication';

                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = All;

                }
                field("Fax No."; "Fax No.")
                {
                    ApplicationArea = All;

                }
            }
        }

    }


    var
        myInt: Integer;
}