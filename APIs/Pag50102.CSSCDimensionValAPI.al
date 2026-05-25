page 50102 "Dimension Value API"
{
    PageType = API;
    APIPublisher = 'act';
    APIGroup = 'finance';
    APIVersion = 'v1.0';
    EntityName = 'dimensionValue';
    EntitySetName = 'dimensionValues';
    SourceTable = "Dimension Value";
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
                field(dimensionCode; Rec."Dimension Code")
                {
                }
                field(code; Rec.Code)
                {
                }
                field(name; Rec.Name)
                {
                }
                field(blocked; Rec.Blocked)
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        ValidateDimensionValue();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        ValidateDimensionValue();
    end;

    local procedure ValidateDimensionValue()
    begin
        Rec.TestField("Dimension Code");
        Rec.TestField(Code);
        Rec.TestField(Name);
    end;
}
