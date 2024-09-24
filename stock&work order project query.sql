SELECT * FROM project.order_status;
-- task 1
select order_id, count(order_id) as total_work_order from order_status where order_type="work_order" group by order_id ;
select order_id,count(order_id) as total_stock from order_status where order_type="stock"group by order_id;
-- another method(task 1)
create table project2 select order_id,count(if(order_type="work_order","yes",null))as work_order_count,count(if(order_type="stock","no",null))as stock_count from order_status group by order_id;
select * from project2;
-- task 2 order_type
create table project4 select order_id,work_order_count,stock_count,sum(stock_count-work_order_count) as work_order_pending_status from project2 
group by order_id,work_order_count,stock_count;
 select * from project4;
-- task 3(1)
alter table project4 add work_order_closed_or_not varchar(56);
select * from project4;
-- task3(2)
select order_id,stock_count,work_order_count,work_order_pending_status,if(work_order_pending_status<0,"order closed","order pending")as work_order_closed_or_not from project4;
--  task 4
create table order_pending_status5 select order_id,stock_count,work_order_count,work_order_pending_status,
if(work_order_pending_status<0,"order closed","order pending")as work_order_closed_or_not from project4;
select * from order_pending_status5;
-- task 5
create table order_supplier_report1 select O.Trans,O.Negative,O.Order_Type,O.Assembly_Supplier,O.Ref,O.Order_id,O.Description,O.Sale_id,
d.Qty,d.Job_Status,d.Planner,d.Buyer_Name,d.Preferred_Supplier
,d.Safety,d.Pre_PLT,d.Post_PLT,d.LT,d.Run_Total,d.Late,d.Safety_RT,d.PO_Note,d.Net_Neg,d.Last_Neg,d.Item_Category,d.Created_On_Date,
d.item_type,d.sale_date from order_status as O inner join date_wise_report as d 
on O.Sale_id=d.Sale_id;
select * from order_supplier_report1;
--  task 6
select sale_date,count(qty)as total_qty,count(order_id)as total_order_id from order_supplier_report group by sale_date;

-- task 7 (stored procedure)

delimiter $$
create procedure order_details1()
begin
-- task 1
select order_id,count(if(order_type="work_order","yes",null))as work_order_count,count(if(order_type="stock","no",null))as stock_count from order_status group by order_id;
-- task 2
select order_id,work_order_count,stock_count,sum(stock_count-work_order_count) as work_order_pending_status from project2 
group by order_id,work_order_count,stock_count;
-- task 4
select order_id,stock_count,work_order_count,work_order_pending_status,
if(work_order_pending_status<0,"order closed","order pending")as work_order_closed_or_not from project4;
-- task 5
select O.Trans,O.Negative,O.Order_Type,O.Assembly_Supplier,O.Ref,O.Order_id,O.Description,O.Sale_id,
d.Qty,d.Job_Status,d.Planner,d.Buyer_Name,d.Preferred_Supplier
,d.Safety,d.Pre_PLT,d.Post_PLT,d.LT,d.Run_Total,d.Late,d.Safety_RT,d.PO_Note,d.Net_Neg,d.Last_Neg,d.Item_Category,d.Created_On_Date,
d.item_type,d.sale_date from order_status as O inner join date_wise_report as d 
on O.Sale_id=d.Sale_id;
-- task 6
select sale_date,count(qty)as total_qty,count(order_id)as total_order_id from order_supplier_report group by sale_date;
end $$
delimiter ;

drop procedure order_details1;
call order_details1();
-- task 8( Export the All reports for our reference)