create or replace package body ut_update_quality is

    procedure cleanup_before_each is
    begin
        delete from item;
    end;

    function updated_item(
        a_name item.name%type,
        a_sell_in item.sell_in%type,
        a_quality item.quality%type
    ) return item%rowtype is
        l_item item%rowtype;
    begin
        new_item(a_name, a_sell_in, a_quality);
        update_quality();
        select * into l_item from item;

        return l_item;
    end updated_item;

    procedure assert_item(
        a_item item%rowtype,
        a_sell_in item.sell_in%type,
        a_quality item.quality%type
    ) is
    begin
        ut.expect(a_item.sell_in, a_message => 'sell_in').to_equal(a_sell_in);
        ut.expect(a_item.quality, a_message => 'quality').to_equal(a_quality);
    end assert_item;


    procedure ut_aged_brie_1_10 is
        l_item item%rowtype;
    begin
        assert_item(updated_item('Aged Brie', 1, 10), 0, 11);
    end ut_aged_brie_1_10;

    procedure ut_aged_brie_5_25 is
        l_item item%rowtype;
    begin
        assert_item(updated_item('Aged Brie', 5, 25), 4, 26);
    end ut_aged_brie_5_25;

    procedure ut_aged_brie_0_10 is
        l_item item%rowtype;
    begin
        assert_item(updated_item('Aged Brie', 0, 10), -1, 12);
    end ut_aged_brie_0_10;

    procedure ut_aged_brie_minus_1_25 is
        l_item item%rowtype;
    begin
        assert_item(updated_item('Aged Brie', -1, 25), -2, 27);
    end ut_aged_brie_minus_1_25;

    procedure ut_aged_brie_1_50 is
        l_item item%rowtype;
    begin
        assert_item(updated_item('Aged Brie', 1, 50), 0, 50);
    end ut_aged_brie_1_50;

    procedure ut_aged_brie_minus_5_49 is
        l_item item%rowtype;
    begin
        assert_item(updated_item('Aged Brie', -5, 49), -6, 50);
    end ut_aged_brie_minus_5_49;

end ut_update_quality;
/
