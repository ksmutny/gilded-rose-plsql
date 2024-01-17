create or replace package body ut_update_quality is

    procedure cleanup_before_each is
    begin
        delete from item;
    end;

    procedure ut_foo is
        l_name item.name%type;
    begin
        new_item('foo', 0, 0);

        update_quality();

        select name into l_name from item;

        ut.expect(l_name, a_message => 'name did change').to_equal('fixme');
    end ut_foo;

end ut_update_quality;
/
