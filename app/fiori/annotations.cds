using POService as service from '../../srv/po-service';
annotate service.POHeaders with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Purchase Order ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Purchase Order Number',
                Value : poNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PO Supplier',
                Value : supplier,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Currency Code',
                Value : currency,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Total Amount',
                Value : totalAmount,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Purchase Order Details',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Purchase Order ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Purchase Order Number',
            Value : poNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'PO Supplier',
            Value : supplier,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Currency Code',
            Value : currency,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Total Amount',
            Value : totalAmount,
        },
    ],
);

