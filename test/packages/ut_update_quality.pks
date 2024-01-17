create or replace package ut_update_quality
is
    -- %suite(ut_regression_test)
    -- %suitepath(gilded_rose_tests)
    -- %rollback(manual)

    -- %beforeeach
    procedure cleanup_before_each;

    -- %test(foo test)
    procedure ut_foo;

end ut_update_quality;
/
