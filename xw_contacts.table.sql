create table xw_contacts
(
id bigint primary key identity(1,1),
name varchar(200),
email varchar(100),
subject varchar(100),
message varchar(2000)
)