prompt creating user 'dojo'

drop user dojo;

create user dojo identified by pass
    default tablespace users temporary tablespace temp;

grant resource to dojo;

grant connect to dojo;

alter user dojo quota 100m on users;
