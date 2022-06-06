page 50099 "Role Center"
{
    PageType = RoleCenter;


    layout
    {
    }

    actions
    {
        area(Sections)
        {
            group(Lists)
            {
                Caption = 'Lists';

                action(Seminars)
                {
                    Caption = 'Seminars';
                    ApplicationArea = All;
                    RunObject = page "Seminar List";
                }

                action(Instructors)
                {
                    Caption = 'Instructors';
                    ApplicationArea = All;
                    RunObject = page "Instructors";
                }

                action(SeminarRoom)
                {
                    Caption = 'Seminar Rooms';
                    ApplicationArea = All;
                    RunObject = page "Seminar Room List";
                }

                action(SeminarRegistration)
                {
                    Caption = 'Seminar Registration';
                    ApplicationArea = All;
                    RunObject = page "Seminar Registration List";
                }
            }

            group(Quests)
            {
                Caption = 'Quests';

                action("Export XML")
                {
                    ApplicationArea = All;
                    Caption = 'Export XML';
                    Image = XMLFile;
                    RunObject = xmlport SeminarRegistrationExport;
                }
            }

            group(Raports)
            {
                Caption = 'Raports';

                action("Seminar Participant List")
                {
                    Caption = 'Seminar Participant List';
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "Seminar Participant List";
                }

                action("Seminar Report")
                {
                    Caption = 'Seminar Report';
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "Seminar Report";
                }

            }
        }
    }

}

profile "Seminar Manager"
{
    Caption = 'Seminar Manager';
    RoleCenter = "Role Center";
}