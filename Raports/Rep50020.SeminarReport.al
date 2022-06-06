report 50020 "Seminar Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/SeminarReport.rdl';

    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Seminar Report';

    dataset
    {

        dataitem("Seminar Registration Header"; "Seminar Registration Header")
        {
            CalcFields = "Instructor Name";
            DataItemTableView = sorting("No.");
            //PrintOnlyIfDetail = true;
            RequestFilterFields = "Starting Date", "Seminar Code", Status;

            column(No_SeminarRegistrationHeader; "No.")
            {
                IncludeCaption = true;
            }

            column(StartingDate_SeminarRegistrationHeader; "Starting Date")
            {
                IncludeCaption = true;
            }
            column(SeminarCode_SeminarRegistrationHeader; "Seminar Code")
            {
                IncludeCaption = true;
            }
            column(SeminarName_SeminarRegistrationHeader; "Seminar Name")
            {
                IncludeCaption = true;
            }
            column(Amount_SeminarRegistrationHeader; "Amount")
            {
                IncludeCaption = true;
            }
            column(CompanyName; CompanyName())
            {
            }

            dataitem("Seminar Registration Line"; "Seminar Registration Line")
            {
                DataItemLink = "Seminar Registration No." = field("No.");

                column(ParticipantName_SeminarRegistrationLine; "Participant Name")
                {
                    IncludeCaption = true;
                }
                column(ParticipantContactNo_SeminarRegistrationLine; "Participant Contact No.")
                {
                    IncludeCaption = true;
                }

                column(ToInvoice_SeminarRegistrationLine; "To Invoice")
                {
                    IncludeCaption = true;
                }
                column(Participated_SeminarRegistrationLine; "Participated")
                {
                    IncludeCaption = true;
                }
                column(SeminarPrice_SeminarRegistrationLine; "Seminar Price")
                {
                    IncludeCaption = true;
                }
                column(LineDiscount_SeminarRegistrationLine; "Line Discount %")
                {
                    IncludeCaption = true;
                }
                column(Amount_SeminarRegistrationLine; "Amount")
                {
                    IncludeCaption = true;
                }
            }
            column(ShowDetails; ShowDetails)
            {

            }
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                field("Show Details"; ShowDetails)
                {
                    Caption = 'Show Details';
                    ApplicationArea = all;

                }
            }
        }
    }

    labels
    {
        TitleLbl2 = 'Seminar Report';
        PageLbl = 'Page';
        ParticipantsPerRegistrationLbl = 'Participants per registration';
        AmountLbl = 'Amount';
        YesLbl = 'Yes';
        NoLbl = 'No';
    }

    var
        ShowDetails: Boolean;

}