using POService as service from '../../srv/po-service';
using from '../fiori/annotations';

annotate service.POHeaders with @(
    UI.SelectionFields : [
        supplier,
        poNumber,
        ID,
    ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : '{i18n>PurchaseOrderHeader}',
    },
    UI.HeaderInfo : {
        TypeName : '',
        TypeNamePlural : '',
        Title : {
            $Type : 'UI.DataField',
            Value : ID,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : poNumber,
        },
        TypeImageUrl : 'sap-icon://bbyd-active-sales',
    },
    UI.DeleteHidden : true,
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'i18nSubSection',
            Target : '@UI.FieldGroup#i18nSubSection',
        },
    ],
    UI.FieldGroup #i18nSubSection : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : poNumber,
            },
            {
                $Type : 'UI.DataField',
                Value : supplier,
            },
        ],
    },
);

annotate service.POHeaders with {
    supplier @(
        Common.Label : '{i18n>Supplier}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'POHeaders',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : supplier,
                    ValueListProperty : 'supplier',
                },
            ],
            Label : 'Supplier',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.POHeaders with {
    poNumber @(
        Common.Label : '{i18n>PurchaseNumber}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'POHeaders',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : poNumber,
                    ValueListProperty : 'poNumber',
                },
            ],
            Label : 'PON',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.POHeaders with {
    ID @(
        Common.Label : '{i18n>PurchaseOrderId}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'POHeaders',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                },
            ],
            Label : 'POID',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.POItems with @(
    UI.LineItem #tableView : [
        {
            $Type : 'UI.DataField',
            Value : poHeader.items.ID,
            Label : 'Purchase Order ID',
            Criticality : ID,
            CriticalityRepresentation : #WithIcon,
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : poHeader.items.itemNo,
            Label : '{i18n>PoItemNumber}',
        },
        {
            $Type : 'UI.DataField',
            Value : poHeader.items.material,
            Label : '{i18n>Materials}',
        },
        {
            $Type : 'UI.DataField',
            Value : poHeader.items.poHeader_ID,
            Label : '{i18n>PoHeaderId}',
        },
        {
            $Type : 'UI.DataField',
            Value : poHeader.items.price,
            Label : '{i18n>NetPrice}',
        },
        {
            $Type : 'UI.DataField',
            Value : poHeader.items.quantity,
            Label : '{i18n>NetQuantity}',
        },
    ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : '{i18n>PurchaseOrderItems}',
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>PurchaseOrderItemData}',
            ID : 'i18nPurchaseOrderItemData',
            Target : '@UI.FieldGroup#i18nPurchaseOrderItemData',
        },
    ],
    UI.FieldGroup #i18nPurchaseOrderItemData : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : itemNo,
                Label : 'itemNo',
            },
            {
                $Type : 'UI.DataField',
                Value : material,
                Label : 'material',
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : poHeader_ID,
                Label : 'poHeader_ID',
            },
            {
                $Type : 'UI.DataField',
                Value : price,
                Label : 'price',
            },
            {
                $Type : 'UI.DataField',
                Value : quantity,
                Label : 'quantity',
            },
        ],
    },
    UI.LineItem #tableMacro : [
        {
            $Type : 'UI.DataField',
            Value : poHeader.ID,
        },
        {
            $Type : 'UI.DataField',
            Value : poHeader.items.ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : poHeader.items.itemNo,
            Label : 'itemNo',
        },
        {
            $Type : 'UI.DataField',
            Value : poHeader.items.material,
            Label : 'material',
        },
        {
            $Type : 'UI.DataField',
            Value : poHeader.items.price,
            Label : 'price',
        },
        {
            $Type : 'UI.DataField',
            Value : poHeader.items.quantity,
            Label : 'quantity',
        },
    ],
);

