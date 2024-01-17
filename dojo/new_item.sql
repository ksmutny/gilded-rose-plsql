create or replace procedure new_item (
    i_name item.name%type,
    i_sell_in item.sell_in%type,
    i_quality item.quality%type
) is
begin
  insert into item (name, sell_in, quality) values (i_name, i_sell_in, i_quality);
end new_item;
/
