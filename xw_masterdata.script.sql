USE [xwhizz]
GO
--INSERT USER TABLE----
ALTER TABLE xw_users NOCHECK CONSTRAINT ALL
GO
INSERT INTO xw_users (username,password,isadmin,issuperuser,createdby,createddate,updatedby,updateddate)
VALUES ('superadmin@xwhizz.com','admin@xwhizz2017',1,1,NULL,GETDATE(),NULL,GETDATE())
GO
ALTER TABLE xw_users WITH CHECK CHECK CONSTRAINT ALL
GO
INSERT INTO xw_users (username,password,isadmin,issuperuser,createdby,createddate,updatedby,updateddate)
VALUES ('admin@xwhizz.com','admin@xwhizz2017',1,0,1,GETDATE(),1,GETDATE())
GO
--INSERT ROLE TABLE----
INSERT INTO xw_roles (rolename,createdby,createddate,updatedby,updateddate) VALUES ('superuser',1,CURRENT_TIMESTAMP,1,CURRENT_TIMESTAMP);
INSERT INTO xw_roles (rolename,createdby,createddate,updatedby,updateddate) VALUES ('admin',1,CURRENT_TIMESTAMP,1,CURRENT_TIMESTAMP);

INSERT INTO xw_userroles (userid,roleid,createdby,createddate,updatedby,updateddate) VALUES (1,1,1,CURRENT_TIMESTAMP,1,CURRENT_TIMESTAMP);

INSERT INTO xw_userroles (userid,roleid,createdby,createddate,updatedby,updateddate) VALUES (2,2,1,CURRENT_TIMESTAMP,1,CURRENT_TIMESTAMP);
