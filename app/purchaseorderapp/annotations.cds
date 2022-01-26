using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(
    UI.SelectionFields : [
        PO_ID,
        GROSS_AMOUNT,
        Currency_code,
        OVERALL_STATUS
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : Currency_code,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : OVERALL_STATUS,
            Criticality : Criticality,
            CriticalityRepresentation : #WithIcon
            
        },
        {
            $Type: 'UI.DataFieldForAction',
            Label : 'Boost',
            Action : 'CatalogService.boost',
            Inline : true
        },
        {
            $Type : 'UI.DataField',
            Value :  PARTNER_GUID.ADDRESS_GUID.COUNTRY
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME
        },
   
        
    ],
    UI:{
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Purchase Order',
            TypeNamePlural : 'Purchase Orders',
            Title: { Label : 'Purchase Order Id', Value : PO_ID},
            Description : { Label : 'Vendor', Value: PARTNER_GUID.COMPANY_NAME},
            ImageUrl: 'data:image/png;base64,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'
        },
    }
);
annotate service.POs with @(
    UI.FieldGroup #BasicDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Currency_code,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Label : 'NOTE',
                Value : NOTE,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CREATEDAT',
                Value : CREATEDAT,
            },
            {
                $Type : 'UI.DataField',
                Label : 'MODIFIEDAT',
                Value : MODIFIEDAT,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#BasicDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'PO Line Items',
            Target : 'Items/@UI.LineItem',
        }
    ]
);
annotate CatalogService.POItems with @(
    UI:{
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ITEM_POS,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.PRODUCT_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : Currency.code,
            },
        ],
         HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'PO Item',
            TypeNamePlural : 'PO Items',
        }
    }
);

