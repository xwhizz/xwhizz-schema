CREATE TABLE xw_userroles
(
id bigint(20) NOT NULL AUTO_INCREMENT,
userid bigint(20) NOT NULL,
roleid bigint(20) NOT NULL,
createdby bigint(20) NOT NULL,
createddate datetime,
updatedby bigint(20) NOT NULL,
updateddate datetime,
PRIMARY KEY (`id`),
KEY FK_UserRoles_UserId_Users_id (userid),
KEY FK_UserRoles_RoleId_Roles_id (roleid),
KEY FK_UserRoles_CreatedBy_Users_id (createdby),
KEY FK_UserRoles_UpdatedBy_Users_id (updatedby),
CONSTRAINT FK_UserRole_UserId_Users_id FOREIGN KEY (userid) REFERENCES xw_users (id),
CONSTRAINT FK_UserRole_RoleId_Users_id FOREIGN KEY (`roleid`) REFERENCES `xw_roles` (`id`),
CONSTRAINT FK_UserRole_CreatedBy_Users_id FOREIGN KEY (`createdby`) REFERENCES `xw_users` (`id`),
CONSTRAINT FK_UserRole_UpdatedBy_Users_id FOREIGN KEY (`updatedby`) REFERENCES `xw_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1