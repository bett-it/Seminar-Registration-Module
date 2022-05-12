tableextension 50011 "Sales & Receivables Setupex" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account";
        }
    }
}