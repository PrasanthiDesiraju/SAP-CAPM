using { epm.db , CV_PURC, CV_PURCHASE_ORDER_TF } from '../db/datamodel';

service CatalogService@(path:'/CatalogService') {

    function sleep() returns Boolean;
    
    @readonly
    entity PurchaseOrderCalcView as projection on CV_PURC;

    entity PurchaseOrdersWithTF as projection on CV_PURCHASE_ORDER_TF;
    
    @Capabilities : { Insertable:false, Updatable, Deletable }
    entity EmployeeSet as projection on db.master.employees;

    entity AddressSet as projection on db.master.address;

    entity ProductSet as projection on db.master.product;

    entity BPSet as projection on db.master.businesspartner;

    entity POs @(
        title: '{i18n>poHeader}'
    ) as projection on db.transaction.purchaseorder{
        *,
        Items: redirected to POItems
    }actions{
        function largestOrder() returns array of POs;
        action boost();
    }

    entity POItems @( title : '{i18n>poIteSms}' )
    as projection on db.transaction.poitems{
        *,
        PARENT_KEY: redirected to POs,
        PRODUCT_GUID: redirected to ProductSet
    }

    entity POWorklist as projection on db.CDSViews.POWorklist;
    entity ProductOrders as projection on db.CDSViews.ProductViewSub;
    entity ProductAggregation1 as projection on db.CDSViews.CProductValuesView excluding {
        ProductId
    };
    
 
}