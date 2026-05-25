page 50103 "Budget API"
{
    PageType = API;
    APIPublisher = 'act';
    APIGroup = 'finance';
    APIVersion = 'v1.0';
    EntityName = 'budget';
    EntitySetName = 'budgets';
    SourceTable = "G/L Budget Entry";
    ODataKeyFields = SystemId;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(systemId; Rec.SystemId)
                {
                    Editable = false;
                }
                field(budgetName; Rec."Budget Name")
                {
                }
                field(glAccountNo; Rec."G/L Account No.")
                {
                }
                
                field(date; Rec.Date)
                {
                }
                field(amount; Rec.Amount)
                {
                }
                field(dimension1; Rec."Global Dimension 1 Code")
                {
                }
                field(dimension2; Rec."Global Dimension 2 Code")
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        ValidateBudgetEntry();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        ValidateBudgetEntry();
    end;

    local procedure ValidateBudgetEntry()
    begin
        Rec.TestField("Budget Name");
        Rec.TestField("G/L Account No.");
        Rec.TestField(Date);
    end;
}
