--View created to see what products customers are ordering
create or replace view Orders_View
as
select
    C.Last_Name as Customer
,   P.ProductName as Product_Name
,   R.Reference_Number as Order_Number
from Customers C
    join Orders R on C.id = R.CustomersID
    join Products P on P.id = R.ProductsID;

select * from Orders_View order by Customer asc;


--View created to see how many of each product is stored at each warehouse
CREATE OR REPLACE view INVENTORY_VIEW
AS 
select
    P.ProductName as ProductName
,   W.Warehouse_Name as Warehouse
,   I.Product_Quantity as Quantity
from Warehouse W
    join Inventory I on W.id = I.WarehouseID
    join Products P on P.id = I.ProductsID;

select * from Inventory_view order by ProductName asc;