create table xw_users
(
id bigint primary key identity(1,1),
username varchar(100),
password varchar(200),
isadmin bit,
issuperuser bit,
createdby bigint foreign key references xw_users (id),
createddate datetime,
updatedby bigint foreign key references xw_users (id),
updateddate datetime,
)



