CREATE TABLE xw_userroles
(
id bigint primary key identity(1,1),
userid bigint foreign key references xw_users(id),
roleid bigint foreign key references xw_roles(id),
createdby bigint foreign key references xw_users (id),
createddate datetime,
updatedby bigint foreign key references xw_users (id),
updateddate datetime
)