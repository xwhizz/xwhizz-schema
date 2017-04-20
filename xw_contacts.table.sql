CREATE TABLE `xwhizz`.`xw_contacts` 
(
`id` BIGINT NOT NULL AUTO_INCREMENT , 
`name` VARCHAR(200) NOT NULL , 
`email` VARCHAR(100) NOT NULL , 
`subject` VARCHAR(100) NOT NULL , 
`message` VARCHAR(2000) NOT NULL , 
PRIMARY KEY (`id`)) ENGINE = InnoDB;