page 50011 "Seminar Page"
{
    Caption = 'Seminar Page';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Seminar;

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
                field("Search Name"; "Search Name")
                {
                    ApplicationArea = All;

                }

                field("Seminar Duration"; "Seminar Duration")
                {
                    ApplicationArea = All;

                }
                field("Seminar Price"; "Seminar Price")
                {
                    ApplicationArea = All;

                }

                field("Minimum Participants"; "Minimum Participants")
                {
                    ApplicationArea = All;

                }
                field("Maximum Participants"; "Maximum Participants")
                {
                    ApplicationArea = All;

                }

                field("Blocked"; "Blocked")
                {
                    ApplicationArea = All;

                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    ApplicationArea = All;

                }

            }
        }

    }

    // actions
    // {
    //     area(Processing)
    //     {
    //         action(ActionName)
    //         {
    //             ApplicationArea = All;

    //             trigger OnAction()
    //             begin

    //             end;
    //         }
    //     }
    // }

    var
        myInt: Integer;
}