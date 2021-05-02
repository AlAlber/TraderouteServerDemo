create table USERS (
  USERNAME varchar(50) not null,
  PASSWORD varchar(50) not null,
  ENABLED boolean not null,
  primary key (USERNAME)
);
create table AUTHORITIES (
  USERNAME varchar(50) not null,
  AUTHORITY varchar(50) not null,
  constraint FK_AUTHORITIES_USERS
    foreign key (USERNAME)
    references USERS (USERNAME)
);
create unique index IX_AUTH_USERNAME on AUTHORITIES(USERNAME, AUTHORITY);