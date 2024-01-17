create or replace package text_test is
    -- %suite(text_test)
    -- %suitepath(gilded_rose_tests)
    -- %rollback(manual)

    -- %beforeall
    procedure setup;

    -- %test(main test)
    procedure main_test;

end text_test;
/
