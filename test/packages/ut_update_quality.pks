create or replace package ut_update_quality
is
    -- %suite(ut_regression_test)
    -- %suitepath(gilded_rose_tests)
    -- %rollback(manual)

    -- %beforeeach
    procedure cleanup_before_each;

    -- %test(ut_aged_brie_1_10 test)
    procedure ut_aged_brie_1_10;

    -- %test(ut_aged_brie_5_25 test)
    procedure ut_aged_brie_5_25;

    -- %test(ut_aged_brie_0_10 test)
    procedure ut_aged_brie_0_10;

    -- %test(ut_aged_brie_minus_1_25 test)
    procedure ut_aged_brie_minus_1_25;

    -- %test(ut_aged_brie_1_50 test)
    procedure ut_aged_brie_1_50;

    -- %test(ut_aged_brie_minus_5_49 test)
    procedure ut_aged_brie_minus_5_49;

end ut_update_quality;
/
