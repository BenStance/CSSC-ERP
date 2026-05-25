page 50100 "Employee API"
{
    PageType = API;
    APIPublisher = 'act';
    APIGroup = 'hr';
    APIVersion = 'v1.0';
    EntityName = 'employee';
    EntitySetName = 'employees';
    SourceTable = Customer;
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
                field(employeeNo; Rec."No.")
                {
                }
                field(employeeName; Rec.Name)
                {
                }
                field(address; Rec.Address)
                {
                }
                field(phoneNo; Rec."Phone No.")
                {
                }
                field(email; Rec."E-Mail")
                {
                }
                field(postingGroup; Rec."Customer Posting Group")
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
        ValidateEmployee();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        ValidateEmployee();
    end;

    local procedure ValidateEmployee()
    begin
        Rec.TestField(Name);
        Rec.TestField("Customer Posting Group");
    end;
}
