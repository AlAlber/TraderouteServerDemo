insert into USERS (USERNAME, PASSWORD, ENABLED)
values (
  'user', 
  'pass', 
  true
);
insert into USERS (USERNAME, PASSWORD, ENABLED)
values (
  'admin', 
  'pass', 
  true
);
insert into AUTHORITIES (USERNAME, AUTHORITY)
values (
  'user', 
  'ROLE_USER'
);
insert into AUTHORITIES (USERNAME, AUTHORITY)
values (
  'admin', 
  'ROLE_ADMIN'
);