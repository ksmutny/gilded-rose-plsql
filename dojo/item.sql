prompt creating table 'item'

declare
    table_does_not_exist exception;
    pragma exception_init(table_does_not_exist, -942);
begin
    execute immediate 'drop table item';
exception
    when table_does_not_exist then dbms_output.put_line('Table item does not exist.');
end;
/

create table item (
    name    varchar2(100) not null,
    sell_in number(6) not null,
    quality number(6) not null
);
/
