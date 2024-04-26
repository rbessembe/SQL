# Create role
create role $role_name with login password 'role_name_password';
alter role $role_name createdb login createrole;
grant all privileges on database $db_name to $role_name;

# SQL Dump
pg_dump -U $role_name -h $hostname -p 5432 -W -F p -b -v -f $db_name.sql $db_name

# SQL Dump restore
psql -U $role_name -h $hostname -p 5432 -W -d $db_name -a -f $db_name.sql

# Simple commands
create database "$db_name" with owner $role_name;
drop database "$db_name";

