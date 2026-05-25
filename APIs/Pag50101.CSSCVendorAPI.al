page 50101 "Vendor API"
{
    PageType = API;
    APIPublisher = 'act';
    APIGroup = 'procurement';
    APIVersion = 'v1.0';
    EntityName = 'vendor';
    EntitySetName = 'vendors';
    SourceTable = Vendor;
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
                field(vendorNo; Rec."No.")
                {
                }
                field(name; Rec.Name)
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
                field(vendorPostingGroup; Rec."Vendor Posting Group")
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
        ValidateVendor();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        ValidateVendor();
    end;

    local procedure ValidateVendor()
    begin
        Rec.TestField(Name);
        Rec.TestField("Vendor Posting Group");
    end;
}
