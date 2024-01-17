exec dbms_session.reset_package;
set serveroutput on;
exec dbms_output.enable(1000000);

exec ut.run(user || ':gilded_rose_tests' || '');
