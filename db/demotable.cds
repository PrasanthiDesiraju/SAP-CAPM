namespace demo.db;

entity orders
{
    key ID : Integer64;
    customername : String(120);
    contactperson : String(64);
    grossmount : Decimal(10,2);
    currency : String(4) not null;
}
