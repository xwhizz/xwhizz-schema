Create table xw_roles
(
id bigint primary key identity(1,1),
rolename varchar(200),
createdby bigint foreign key references xw_users (id),
createddate datetime,
updatedby bigint foreign key references xw_users (id),
updateddate datetime, 
)