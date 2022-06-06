page 50042 "Seminar Registration List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Seminar Registration Header";
    CardPageId = "Seminar Registration Page";

    Editable = false;

    Caption = 'Seminar Registration List';

    layout
    {
        area(Content)
        {
            repeater(Repeater1)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;

                }
                field("Starting Date"; "Starting Date")
                {
                    ApplicationArea = All;

                }
                field("Seminar Code"; "Seminar Code")
                {
                    ApplicationArea = All;

                }
                field("Seminar Name"; "Seminar Name")
                {
                    ApplicationArea = All;

                }
                field("Instructor Code"; "Instructor Code")
                {
                    ApplicationArea = All;

                }
                field("Instructor Name"; "Instructor Name")
                {
                    ApplicationArea = All;

                }
                field("Status"; "Status")
                {
                    ApplicationArea = All;

                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = All;

                }

                field("Seminar Duration"; "Seminar Duration")
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
                field("Seminar Price"; "Seminar Price")
                {
                    ApplicationArea = All;
                }
                field("Amount"; "Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ExportXML)
            {
                ApplicationArea = All;
                Caption = 'Export XML';
                Image = XMLFile;

                trigger OnAction()
                begin
                    Xmlport.Run(Xmlport::SeminarRegistrationExport);

                end;
            }

        }
    }


    var
        myInt: Integer;
}