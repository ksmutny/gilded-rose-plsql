create or replace procedure update_quality is
    cursor c_items is
        select name, sell_in, quality
        from item for update;

    l_item    c_items%rowtype;
    l_name    item.name%type;
    l_sell_in item.sell_in%type;
    l_quality item.quality%type;
begin
    for l_item in c_items loop
        l_name := l_item.name;
        l_sell_in := l_item.sell_in;
        l_quality := l_item.quality;
        if l_name <> 'Aged Brie' and l_name <> 'Backstage passes to a TAFKAL80ETC concert' then
            if l_quality > 0 then
                if l_name <> 'Sulfuras, Hand of Ragnaros' then
                    l_quality := l_quality - 1;
                end if;
            end if;
        else
            if (l_quality < 50) then
                l_quality := l_quality + 1;
                if l_name = 'Backstage passes to a TAFKAL80ETC concert' then
                    if l_sell_in < 11 then
                        if l_quality < 50 then
                            l_quality := l_quality + 1;
                        end if;
                    end if;

                    if l_sell_in < 6 then
                        if l_quality < 50 then
                            l_quality := l_quality + 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;

        if l_name <> 'Sulfuras, Hand of Ragnaros' then
            l_sell_in := l_sell_in - 1;
        end if;

        if l_sell_in < 0 then
            if l_name <> 'Aged Brie' then
                if l_name <> 'Backstage passes to a TAFKAL80ETC concert' then
                    if l_quality > 0 then
                        if l_name <> 'Sulfuras, Hand of Ragnaros' then
                            l_quality := l_quality - 1;
                        end if;
                    end if;
                else
                    l_quality := l_quality - l_quality;
                end if;
            else
                if l_quality < 50 then
                    l_quality := l_quality + 1;
                end if;
            end if;
        end if;

        update item
        set
            name = l_name,
            sell_in = l_sell_in,
            quality = l_quality
        where
            current of c_items;
    end loop;
end update_quality;
/
