CREATE TABLE `xw_users` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `username` varchar(100) NOT NULL,
 `password` varchar(200) NOT NULL,
 `isadmin` tinyint(1) NOT NULL DEFAULT '0',
 `issuperuser` tinyint(1) NOT NULL DEFAULT '0',
 `createdby` bigint(20) NOT NULL,
 `createddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updatedby` bigint(20) NOT NULL,
 `updateddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`),
 KEY `FK_Users_CreatedBy_Users_id` (`createdby`),
 KEY `FK_Uses_UpdatedBy_Users_id` (`updatedby`),
 CONSTRAINT `FK_Users_CreatedBy_Users_id` FOREIGN KEY (`createdby`) REFERENCES `xw_users` (`id`),
 CONSTRAINT `FK_Uses_UpdatedBy_Users_id` FOREIGN KEY (`updatedby`) REFERENCES `xw_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1