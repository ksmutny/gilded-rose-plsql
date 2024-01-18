create or replace package ut_update_quality
is
    -- %suite(ut_regression_test)
    -- %suitepath(gilded_rose_tests)
    -- %rollback(manual)

    -- %beforeeach
    procedure cleanup_before_each;

    -- %test(foo test)
    procedure ut_aged_brie_1_10;

end ut_update_quality;
/
