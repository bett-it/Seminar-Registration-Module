pageextension 50006 "Sales & Receivables Setupex" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter(Archiving)
        {
            group("Training Module")
            {
                Caption = 'Training Module';

                field("G/L Account No."; "G/L Account No.")
                {
                    Caption = 'G/L Account No.';
                    TableRelation = "G/L Account";
                }
            }

        }

    }
}