Create table 'xw_roles'
(
`id` bigint(20) NOT NULL AUTO_INCREMENT,
`rolename` varchar(200) NOT NULL,
`createdby` bigint(20) NOT NULL,
 `createddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updatedby` bigint(20) NOT NULL,
 `updateddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`),
 KEY `FK_Roles_CreatedBy_Users_id` (`createdby`),
 KEY `FK_Role_UpdatedBy_Users_id` (`updatedby`),
 CONSTRAINT `FK_Roles_CreatedBy_Users_id` FOREIGN KEY (`createdby`) REFERENCES `xw_users` (`id`),
 CONSTRAINT `FK_Role_UpdatedBy_Users_id` FOREIGN KEY (`updatedby`) REFERENCES `xw_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1
