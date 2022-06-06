xmlport 50040 SeminarRegistrationExport
{
    Direction = Export;
    // Format = FixedText;
    // TextEncoding = UTF8;
    Caption = 'Seminar Registration Export';

    schema
    {
        textelement(Seminar_Registration_Participant_List)
        {
            tableelement(Seminar; "Seminar Registration Header")
            {
                fieldelement(Registration_No; Seminar."No.")
                {
                }
                fieldelement(Seminar_Code; seminar."Seminar Code")
                {
                }
                fieldelement(Seminar_Name; seminar."Seminar Name")
                {
                }
                fieldelement(Starting_Date; seminar."Starting Date")
                {
                }
                fieldelement(Seminar_Duration; seminar."Seminar Duration")
                {
                }
                fieldelement(Instructor_Name; seminar."Instructor Name")
                {
                }
                fieldelement(Room_Name; seminar."Seminar Room Name")
                {
                }

                tableelement(Participant; "Seminar Registration Line")
                {
                    LinkTable = Seminar;
                    LinkFields = "Seminar Registration No." = field("No.");

                    MinOccurs = Zero;

                    fieldelement(Customer_No; Participant."Bill-to Customer No.")
                    {
                    }
                    textelement(Customer_Name)
                    {
                        trigger OnBeforePassVariable()
                        var
                            Cus: Record Customer;
                        begin
                            Cus.Reset();
                            Cus.SetRange("No.", Participant."Bill-to Customer No.");
                            if Cus.FindFirst() then begin
                                Customer_Name := Cus.Name;
                            end;
                        end;
                    }
                    fieldelement(Contact_No; Participant."Participant Contact No.")
                    {
                    }
                    fieldelement(Participant_Name; Participant."Participant Name")
                    {
                    }
                }

            }

        }
    }

    // requestpage
    // {
    //     layout
    //     {
    //         area(content)
    //         {
    //             group(GroupName)
    //             {
    //                 field(Name; SourceExpression)
    //                 {

    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(ActionName)
    //             {

    //             }
    //         }
    //     }
    // }

    // var
    //     myInt: Integer;
}