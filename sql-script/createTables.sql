use crm;

drop table if exists customer;

CREATE TABLE `customer` (
	`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '脰梅录眉',
	`USERNAME` VARCHAR(50) NOT NULL COMMENT '脫脙禄搂脙没',
	`PASSWORD` VARCHAR(200) NOT NULL COMMENT '脙脺脗毛',
	`MOBILE` VARCHAR(15) NULL DEFAULT NULL COMMENT '脕陋脧碌脢脰禄煤潞脜',
	`IDENTIFICATION` VARCHAR(20) NULL DEFAULT NULL COMMENT '脡铆路脻脰陇潞脜',
	`EMAIL` VARCHAR(50) NOT NULL COMMENT '脫脢脧盲',
	`IS_EMAIL_VERIFY` VARCHAR(1) NULL DEFAULT NULL COMMENT '脢脟路帽脫脢脧盲脩茅脰陇(0拢潞路帽拢卢1拢潞脢脟)',
	`IS_FROZEN` VARCHAR(1) NULL DEFAULT NULL COMMENT '脢脟路帽露鲁陆谩拢篓0拢潞路帽拢卢1拢潞脢脟拢漏',
	`IS_ENABLE` VARCHAR(1) NULL DEFAULT NULL COMMENT '脢脟路帽脢搂脨搂拢篓0拢潞路帽拢卢1拢潞脢脟拢漏',
	`CREATE_TIME` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '麓麓陆篓脢卤录盲',
	`UPDATE_TIME` DATETIME NULL DEFAULT NULL COMMENT '脨脼赂脛脢卤录盲',
	PRIMARY KEY (`ID`),
	INDEX `AK_unique_username` (`USERNAME`),
	INDEX `AK_unique_email` (`EMAIL`)
)
COMMENT='驴脥禄搂卤铆'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;use crm;


ALTER TABLE customer ADD WECHAT_ID VARCHAR(50) NULL DEFAULT NULL COMMENT '脦垄脨脜id';
ALTER TABLE customer ADD ALIPAY VARCHAR(50) NULL DEFAULT NULL COMMENT '脰搂赂露卤娄脮脣潞脜';
ALTER TABLE customer ADD BANK_CARD VARCHAR(50) NULL DEFAULT NULL COMMENT '脪酶脨脨驴篓脮脣禄搂';
ALTER TABLE customer ADD ACTUAL_AMOUNT BIGINT(20) NULL DEFAULT NULL COMMENT 'actual amount= receive amount-transction fees';


drop table if exists cacc;

CREATE TABLE `cacc` (
	`CID` BIGINT(20) NOT NULL,
	`CGID` BIGINT(20) NOT NULL,
	`PNSGID` BIGINT(20) NOT NULL,
	`PNSID` BIGINT(20) NOT NULL,
	`BALANCE` BIGINT(20) NULL DEFAULT '0',
	`MARGIN` BIGINT(20) NULL DEFAULT '0',
	`FREEMARGIN` BIGINT(20) NULL DEFAULT '0',
	`PREBALAN` BIGINT(20) NULL DEFAULT '0',
	`CHANGEBALAN` BIGINT(20) NULL DEFAULT '0',
	`PNL` BIGINT(20) NULL DEFAULT '0',
	PRIMARY KEY (`CID`, `PNSGID`, `PNSID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DEFAULT;

drop table if exists manager;

CREATE TABLE `manager` (
	`managerid` INT(11) NOT NULL AUTO_INCREMENT,
	`loginname` VARCHAR(45) NULL DEFAULT NULL,
	`password` VARCHAR(45) NULL DEFAULT NULL,
	`email` VARCHAR(45) NULL DEFAULT NULL,
	`privillege` VARCHAR(45) NULL DEFAULT NULL,
	PRIMARY KEY (`managerid`),
	UNIQUE INDEX `managerid_UNIQUE` (`managerid`),
	UNIQUE INDEX `loginname_UNIQUE` (`loginname`),
	UNIQUE INDEX `email_UNIQUE` (`email`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DEFAULT
AUTO_INCREMENT=3;
INSERT INTO `manager` (`managerid`, `loginname`, `password`, `email`, `privillege`) VALUES (1, 'derek', '123', 'hello@163.com', '0');
INSERT INTO `manager` (`managerid`, `loginname`, `password`, `email`, `privillege`) VALUES (2, 'jack', '1234', 'jack@163.com', '0');


drop table if exists permission;

CREATE TABLE `permission` (
	`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '脰梅录眉id',
	`USER_ID` INT(11) NOT NULL COMMENT '脫脙禄搂id',
	`PERMISSION_CODE` BIGINT(20) NOT NULL COMMENT '脫脙禄搂脠篓脧脼脗毛',
	`SCAN_ALL_CUSTOMERS` INT(1) NOT NULL DEFAULT '0' COMMENT '虏茅驴麓脣霉脫脨脫脙禄搂',
	`SCAN_CUSTOMER_POSITION` INT(1) NOT NULL DEFAULT '0' COMMENT '虏茅驴麓驴脥禄搂虏脰脦禄',
	`CREATE_CUSTOMER` INT(1) NOT NULL DEFAULT '0' COMMENT '脭枚录脫驴脥禄搂',
	`UPDATE_CUSTOMER` INT(1) NOT NULL DEFAULT '0' COMMENT '脨脼赂脛驴脥禄搂脨脜脧垄',
	`LIMIT_CUSTOMER_TRADE` INT(1) NOT NULL DEFAULT '0' COMMENT '脧脼脰脝脫脙禄搂陆禄脪脳   ',
	`LIMIT_CUSTOMER_DEPOSIT_WITHDRAW` INT(1) NOT NULL DEFAULT '0' COMMENT '脧脼脰脝脫脙禄搂鲁枚脠毛陆冒 ',
	`UPDATE_CUSTOMER_ORDERS` INT(1) NOT NULL DEFAULT '0' COMMENT '脨脼赂脛驴脥禄搂露漏碌楼',
	`CREATE_ORDER` INT(1) NOT NULL DEFAULT '0' COMMENT '脨脗脭枚露漏碌楼',
	`DELETE_ORDER` INT(1) NOT NULL DEFAULT '0' COMMENT '删除订单',
	`SCAN_OPRATOR_LOG` INT(1) NOT NULL DEFAULT '0' COMMENT '查看操作日志  ',
	`MANAGE_USER` INT(1) NOT NULL DEFAULT '0' COMMENT '管理登录用户',
	PRIMARY KEY (`ID`),
	UNIQUE INDEX `AK_userId` (`USER_ID`)
)
COMMENT='权限表'
COLLATE='utf8_bin'
ENGINE=InnoDB
ROW_FORMAT=DEFAULT
AUTO_INCREMENT=3;
INSERT INTO `permission` (`ID`, `USER_ID`, `PERMISSION_CODE`, `SCAN_ALL_CUSTOMERS`, `SCAN_CUSTOMER_POSITION`, `CREATE_CUSTOMER`, `UPDATE_CUSTOMER`, `LIMIT_CUSTOMER_TRADE`, `LIMIT_CUSTOMER_DEPOSIT_WITHDRAW`, `UPDATE_CUSTOMER_ORDERS`, `CREATE_ORDER`, `DELETE_ORDER`, `SCAN_OPRATOR_LOG`, `MANAGE_USER`) VALUES (1, 1, 2047, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `permission` (`ID`, `USER_ID`, `PERMISSION_CODE`, `SCAN_ALL_CUSTOMERS`, `SCAN_CUSTOMER_POSITION`, `CREATE_CUSTOMER`, `UPDATE_CUSTOMER`, `LIMIT_CUSTOMER_TRADE`, `LIMIT_CUSTOMER_DEPOSIT_WITHDRAW`, `UPDATE_CUSTOMER_ORDERS`, `CREATE_ORDER`, `DELETE_ORDER`, `SCAN_OPRATOR_LOG`, `MANAGE_USER`) VALUES (2, 2, 1022, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0);
use crm;

drop table if exists balance_log;

/*==============================================================*/
/* Table: balance_log                                           */
/*==============================================================*/
create table balance_log
(
   ID                   bigint not null auto_increment comment '自增id',
   ORDER_ID             varchar(36) comment '订单id',
   OPERATE_TYPE         int(1) not null comment '操作类型：1:出金 withdraw  ; 2:入金 deposit',
   CUSTOMER_ID          int comment '客户id，与customer表关联',
   TRANSACTION_ID       varchar(64) comment 'transactionId',
   RECEIVE_ADDRESS      varchar(40) comment '接收到比特币的address',
   RECEIVE_AMOUNT       bigint comment '接收金额(单位:satoshi)',
   CHANGE_ADDRESS       varchar(40) comment '找零地址',
   SEND_ADDRESS         varchar(200) comment '发送比特币的address,（address1,address2,....）',
   FEE                  bigint comment '交易手续费(单位：satoshi)',
   CONFIRMATIONS        int comment '交易生成的block深度
            记录在数据库里的只有0,1,自定义的确认深度',
   PLATFORM_FEE         bigint comment '平台手续费(单位:satoshi)',
   CREATE_TIME          datetime comment '入库时间',
   NOTIFY_STATUS        varchar(1) comment '通知状态：
            0：刚记录数据库
            1：confirmations=6，发送通知
            2：confirmations=6，发送通知完毕
            ',
   TRADE_STATUS         varchar(64) comment '交易状态',
   UPDATE_TIME          datetime comment '更新时间',
   PNSID                int comment 'pnsid',
   PNSGID               int comment 'pnsgid',
   primary key (ID),
   unique key AK_Key_2 (ORDER_ID)
);

alter table balance_log comment '客户出金/入金记录日志表';
alter table balance_log ADD ACTUAL_AMOUNT BIGINT(20) NULL DEFAULT NULL COMMENT 'actual amount=receive amount- transaction fee';

drop table if exists dword;

CREATE TABLE `dword` (
        `TIMESTAMP` BIGINT(20) NOT NULL,
        `OID` VARCHAR(45) NOT NULL,
        `CID` VARCHAR(45) NOT NULL,
        `SIDE` VARCHAR(45) NULL DEFAULT NULL,
        `PNSGID` BIGINT(20) NOT NULL,
        `PNSID` BIGINT(20) NOT NULL,
        `QUANT` BIGINT(20) NULL DEFAULT NULL,
        `FEES` BIGINT(20) NULL DEFAULT NULL,
        `NETQUANT` BIGINT(20) NULL DEFAULT NULL,
        `TRANID` VARCHAR(64) NULL DEFAULT NULL,
        `TOADDRESS` VARCHAR(45) NULL DEFAULT NULL,
        `STATUS` VARCHAR(45) NULL DEFAULT NULL,
        PRIMARY KEY (`OID`, `CID`, `PNSGID`, `PNSID`),
        UNIQUE INDEX `OID_UNIQUE` (`OID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DEFAULT;

drop table if exists fees;

CREATE TABLE `fees` (
        `pnsgid` BIGINT(20) NOT NULL,
        `pnsid` BIGINT(20) NOT NULL,
        `SIDE` VARCHAR(45) NOT NULL,
        `TYPE` VARCHAR(45) NULL DEFAULT NULL,
        `FIXAMT` BIGINT(20) NULL DEFAULT NULL,
        `FIXRATE` FLOAT NULL DEFAULT NULL,
        PRIMARY KEY (`pnsgid`, `pnsid`, `SIDE`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DEFAULT;


INSERT INTO `fees` (`pnsgid`, `pnsid`, `SIDE`, `TYPE`, `FIXAMT`, `FIXRATE`) VALUES (8, 1, 'D', 'FIXED', 50000, 0.0005), (8, 1, 'W', 'FIXED', 50000, 0.0005);




drop table if exists customer_address_map;

/*==============================================================*/
/* Table: customer_address_map                                  */
/*==============================================================*/
create table customer_address_map
(
   ID                   int not null auto_increment comment '脰梅录眉ID',
   CUSTOMER_ID          int comment '驴脥禄搂ID',
   RECEIVE_ADDRESS      varchar(40) comment '脢脮驴卯碌脴脰路',
   primary key (ID),
   unique key AK_Key_2 (CUSTOMER_ID, RECEIVE_ADDRESS)
);

alter table customer_address_map comment '卤脠脤脴卤脪脫脙禄搂-脢脮驴卯碌脴脰路卤铆';


use pns;

drop table if exists orders;

CREATE TABLE `orders` (
	`TIMESTAMP` BIGINT(20) NOT NULL,
	`OID` VARCHAR(45) NULL DEFAULT NULL,
	`CID` BIGINT(20) NULL DEFAULT NULL,
	`TYPE` VARCHAR(45) NULL DEFAULT NULL,
	`SIDE` VARCHAR(45) NULL DEFAULT NULL,
	`PNSOID` VARCHAR(45) NULL DEFAULT NULL,
	`POID` VARCHAR(45) NULL DEFAULT NULL,
	`PNSID` BIGINT(20) NULL DEFAULT NULL,
	`PNSGID` BIGINT(20) NULL DEFAULT NULL,
	`PRICE` BIGINT(20) NULL DEFAULT NULL,
	`QUANT` BIGINT(20) NULL DEFAULT NULL,
	`FORM` VARCHAR(45) NULL DEFAULT NULL,
	`STATUS` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`TIMESTAMP`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DEFAULT;

drop table if exists pns;

CREATE TABLE `pns` (
	`ID` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`TIME` BIGINT(20) NULL DEFAULT NULL,
	`OID` VARCHAR(45) NULL DEFAULT NULL,
	`PNSID` BIGINT(20) NOT NULL,
	`PNSGID` BIGINT(20) NULL DEFAULT NULL,
	`POID` BIGINT(20) NOT NULL COMMENT 'product owner\'s id \\nnormally client',
	`SIDE` VARCHAR(45) NOT NULL,
	`PRICE` BIGINT(20) NULL DEFAULT NULL,
	`QUANT` BIGINT(20) NOT NULL DEFAULT '0',
	`TOTAL` BIGINT(20) NULL DEFAULT NULL,
	`STATUS` VARCHAR(45) NULL DEFAULT NULL,
	`TRADED` BIGINT(20) NOT NULL DEFAULT '0',
	`MARGIN` BIGINT(20) NOT NULL DEFAULT '0',
	`NET` BIGINT(20) NOT NULL DEFAULT '0',
	`MAX` BIGINT(20) NOT NULL DEFAULT '0',
	`MIN` BIGINT(20) NOT NULL DEFAULT '0',
	`CAN` BIGINT(20) NOT NULL DEFAULT '0',
	PRIMARY KEY (`ID`),
	UNIQUE INDEX `OID_UNIQUE` (`OID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DEFAULT
AUTO_INCREMENT=31;

drop table if exists requests;

CREATE TABLE `requests` (
	`RID` VARCHAR(45) NOT NULL COLLATE 'latin1_swedish_ci',
	`timestamp` VARCHAR(45) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`CID` VARCHAR(45) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`TTYPE` VARCHAR(45) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`RBODY` VARCHAR(45) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`RID`),
	UNIQUE INDEX `RID_UNIQUE` (`RID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DEFAULT;

drop table if exists `inout`;

CREATE TABLE `inout` (
	`TIMESTAMP` BIGINT(20) NOT NULL,
	`OID` VARCHAR(45) NULL DEFAULT NULL,
	`CID` BIGINT(20) NOT NULL,
	`SIDE` VARCHAR(45) NULL DEFAULT NULL,
	`PNSGID` BIGINT(20) NULL DEFAULT NULL,
	`PNSID` BIGINT(20) NULL DEFAULT NULL,
	`QUANT` BIGINT(20) NULL DEFAULT NULL,
	`TRANID` VARCHAR(64) NULL DEFAULT NULL,
	`STATUS` VARCHAR(45) NULL DEFAULT NULL,
	PRIMARY KEY (`TIMESTAMP`, `CID`),
	UNIQUE INDEX `OID_UNIQUE` (`OID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DEFAULT;
