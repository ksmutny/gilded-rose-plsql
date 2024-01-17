create or replace package body text_test is
    co_lf constant varchar2(1) := chr(10);

    procedure put_line(p_buffer in out nocopy varchar2, p_line varchar2) is
    begin
        p_buffer := p_buffer || p_line || co_lf;
    end put_line;

    procedure setup is
    begin
        delete from item;

        new_item('+5 Dexterity Vest', 10, 20);
        new_item('Aged Brie', 2, 0);
        new_item('Elixir of the Mongoose', 5, 7);
        new_item('Sulfuras, Hand of Ragnaros', 0, 80);
        new_item('Sulfuras, Hand of Ragnaros', -1, 80);
        new_item('Backstage passes to a TAFKAL80ETC concert', 15, 20);
        new_item('Backstage passes to a TAFKAL80ETC concert', 10, 49);
        new_item('Backstage passes to a TAFKAL80ETC concert', 5, 49);
        -- this conjured item does not work properly yet ;
        new_item('Conjured Mana Cake', 3, 6);
    end setup;

    procedure main_test is
        v_result varchar2(4000) := '';
        v_expected varchar2(4000) := '';
        l_days number(3);

        cursor c_items is select name, sell_in, quality from item;

        l_item       c_items%rowtype;
    begin
        put_line(v_expected, 'OMGHAI!');
        put_line(v_expected, '-------- day 0 --------');
        put_line(v_expected, 'name, sellin, quality');
        put_line(v_expected, '+5 Dexterity Vest, 10, 20');
        put_line(v_expected, 'Aged Brie, 2, 0');
        put_line(v_expected, 'Elixir of the Mongoose, 5, 7');
        put_line(v_expected, 'Sulfuras, Hand of Ragnaros, 0, 80');
        put_line(v_expected, 'Sulfuras, Hand of Ragnaros, -1, 80');
        put_line(v_expected, 'Backstage passes to a TAFKAL80ETC concert, 15, 20');
        put_line(v_expected, 'Backstage passes to a TAFKAL80ETC concert, 10, 49');
        put_line(v_expected, 'Backstage passes to a TAFKAL80ETC concert, 5, 49');
        put_line(v_expected, 'Conjured Mana Cake, 3, 6');
        put_line(v_expected, '-------- day 1 --------');
        put_line(v_expected, 'name, sellin, quality');
        put_line(v_expected, '+5 Dexterity Vest, 9, 19');
        put_line(v_expected, 'Aged Brie, 1, 1');
        put_line(v_expected, 'Elixir of the Mongoose, 4, 6');
        put_line(v_expected, 'Sulfuras, Hand of Ragnaros, 0, 80');
        put_line(v_expected, 'Sulfuras, Hand of Ragnaros, -1, 80');
        put_line(v_expected, 'Backstage passes to a TAFKAL80ETC concert, 14, 21');
        put_line(v_expected, 'Backstage passes to a TAFKAL80ETC concert, 9, 50');
        put_line(v_expected, 'Backstage passes to a TAFKAL80ETC concert, 4, 50');
        put_line(v_expected, 'Conjured Mana Cake, 2, 5');

        put_line(v_result, 'OMGHAI!');
        l_days := 2;

        for i in 0 .. l_days - 1
        loop
            put_line(v_result, '-------- day ' || to_char(i) || ' --------');
            put_line(v_result, 'name, sellin, quality');

            for l_item in c_items
            loop
                put_line(v_result, l_item.name || ', ' || l_item.sell_in || ', ' || l_item.quality);
            end loop;

            update_quality();
        end loop;

        dbms_output.put_line(v_result);

        ut.expect(v_result).to_equal(v_expected);
    end;
end text_test;
/
