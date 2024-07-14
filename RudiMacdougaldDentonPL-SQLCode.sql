-- PL/SQL Function Created to see if the correct number of rows populated to Customers Table from the external CSV file
create or replace function getrowcount
    return number
is
    r_count number;
begin
    select count(*)
    into r_count
    from Customers;
    return r_count;
end getrowcount;

select getrowcount from dual;