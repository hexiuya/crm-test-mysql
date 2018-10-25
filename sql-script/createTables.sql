use crm;

drop table if exists customer;

CREATE TABLE `customer` (
	`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Ö÷¼ü',
	`USERNAME` VARCHAR(50) NOT NULL COMMENT 'ÓÃ»§Ãû',
	`PASSWORD` VARCHAR(200) NOT NULL COMMENT 'ÃÜÂë',
	`MOBILE` VARCHAR(15) NULL DEFAULT NULL COMMENT 'ÁªÏµÊÖ»úºÅ',
	`IDENTIFICATION` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Éí·ÝÖ¤ºÅ',
	`EMAIL` VARCHAR(50) NOT NULL COMMENT 'ÓÊÏä',
	`IS_EMAIL_VERIFY` VARCHAR(1) NULL DEFAULT NULL COMMENT 'ÊÇ·ñÓÊÏäÑéÖ¤(0£º·ñ£¬1£ºÊÇ)',
	`IS_FROZEN` VARCHAR(1) NULL DEFAULT NULL COMMENT 'ÊÇ·ñ¶³½á£¨0£º·ñ£¬1£ºÊÇ£©',
	`IS_ENABLE` VARCHAR(1) NULL DEFAULT NULL COMMENT 'ÊÇ·ñÊ§Ð§£¨0£º·ñ£¬1£ºÊÇ£©',
	`CREATE_TIME` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '´´½¨Ê±¼ä',
	`UPDATE_TIME` DATETIME NULL DEFAULT NULL COMMENT 'ÐÞ¸ÄÊ±¼ä',
	PRIMARY KEY (`ID`),
	INDEX `AK_unique_username` (`USERNAME`),
	INDEX `AK_unique_email` (`EMAIL`)
)
COMMENT='¿Í»§±í'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;use crm;


ALTER TABLE customer ADD WECHAT_ID VARCHAR(50) NULL DEFAULT NULL COMMENT 'Î¢ÐÅid';
ALTER TABLE customer ADD ALIPAY VARCHAR(50) NULL DEFAULT NULL COMMENT 'Ö§¸¶±¦ÕËºÅ';
ALTER TABLE customer ADD BANK_CARD VARCHAR(50) NULL DEFAULT NULL COMMENT 'ÒøÐÐ¿¨ÕË»§';
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
	`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Ö÷¼üid',
	`USER_ID` INT(11) NOT NULL COMMENT 'ÓÃ»§id',
	`PERMISSION_CODE` BIGINT(20) NOT NULL COMMENT 'ÓÃ»§È¨ÏÞÂë',
	`SCAN_ALL_CUSTOMERS` INT(1) NOT NULL DEFAULT '0' COMMENT '²é¿´ËùÓÐÓÃ»§',
	`SCAN_CUSTOMER_POSITION` INT(1) NOT NULL DEFAULT '0' COMMENT '²é¿´¿Í»§²ÖÎ»',
	`CREATE_CUSTOMER` INT(1) NOT NULL DEFAULT '0' COMMENT 'Ôö¼Ó¿Í»§',
	`UPDATE_CUSTOMER` INT(1) NOT NULL DEFAULT '0' COMMENT 'ÐÞ¸Ä¿Í»§ÐÅÏ¢',
	`LIMIT_CUSTOMER_TRADE` INT(1) NOT NULL DEFAULT '0' COMMENT 'ÏÞÖÆÓÃ»§½»Ò×   ',
	`LIMIT_CUSTOMER_DEPOSIT_WITHDRAW` INT(1) NOT NULL DEFAULT '0' COMMENT 'ÏÞÖÆÓÃ»§³öÈë½ð ',
	`UPDATE_CUSTOMER_ORDERS` INT(1) NOT NULL DEFAULT '0' COMMENT 'ÐÞ¸Ä¿Í»§¶©µ¥',
	`CREATE_ORDER` INT(1) NOT NULL DEFAULT '0' COMMENT 'ÐÂÔö¶©µ¥',
	`DELETE_ORDER` INT(1) NOT NULL DEFAULT '0' COMMENT 'ɾ������',
	`SCAN_OPRATOR_LOG` INT(1) NOT NULL DEFAULT '0' COMMENT '�鿴������־  ',
	`MANAGE_USER` INT(1) NOT NULL DEFAULT '0' COMMENT '�����¼�û�',
	PRIMARY KEY (`ID`),
	UNIQUE INDEX `AK_userId` (`USER_ID`)
)
COMMENT='Ȩ�ޱ�'
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
   ID                   bigint not null auto_increment comment '����id',
   ORDER_ID             varchar(36) comment '����id',
   OPERATE_TYPE         int(1) not null comment '�������ͣ�1:���� withdraw  ; 2:��� deposit',
   CUSTOMER_ID          int comment '�ͻ�id����customer�����',
   TRANSACTION_ID       varchar(64) comment 'transactionId',
   RECEIVE_ADDRESS      varchar(40) comment '���յ����رҵ�address',
   RECEIVE_AMOUNT       bigint comment '���ս��(��λ:satoshi)',
   CHANGE_ADDRESS       varchar(40) comment '�����ַ',
   SEND_ADDRESS         varchar(200) comment '���ͱ��رҵ�address,��address1,address2,....��',
   FEE                  bigint comment '����������(��λ��satoshi)',
   CONFIRMATIONS        int comment '�������ɵ�block���
            ��¼�����ݿ����ֻ��0,1,�Զ����ȷ�����',
   PLATFORM_FEE         bigint comment 'ƽ̨������(��λ:satoshi)',
   CREATE_TIME          datetime comment '���ʱ��',
   NOTIFY_STATUS        varchar(1) comment '֪ͨ״̬��
            0���ռ�¼���ݿ�
            1��confirmations=6������֪ͨ
            2��confirmations=6������֪ͨ���
            ',
   TRADE_STATUS         varchar(64) comment '����״̬',
   UPDATE_TIME          datetime comment '����ʱ��',
   PNSID                int comment 'pnsid',
   PNSGID               int comment 'pnsgid',
   primary key (ID),
   unique key AK_Key_2 (ORDER_ID)
);

alter table balance_log comment '�ͻ�����/����¼��־��';
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
   ID                   int not null auto_increment comment 'Ö÷¼üID',
   CUSTOMER_ID          int comment '¿Í»§ID',
   RECEIVE_ADDRESS      varchar(40) comment 'ÊÕ¿îµØÖ·',
   primary key (ID),
   unique key AK_Key_2 (CUSTOMER_ID, RECEIVE_ADDRESS)
);

alter table customer_address_map comment '±ÈÌØ±ÒÓÃ»§-ÊÕ¿îµØÖ·±í';


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
