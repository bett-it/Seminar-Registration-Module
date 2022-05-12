page 50012 "Seminar List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Seminar;
    CardPageId = "Seminar Page";
    Editable = false;

    Caption = 'Seminar List';

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
                field("Seminar Duration"; "Seminar Duration")
                {
                    ApplicationArea = All;

                }
                field("Search Name"; "Search Name")
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
                field("Seminar Price"; "Seminar Price")
                {
                    ApplicationArea = All;

                }
                // field("Last Date Modified"; "Last Date Modified")
                // {
                //     ApplicationArea = All;

                // }

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