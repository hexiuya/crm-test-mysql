CREATE DATABASE IF NOT EXISTS crm DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT all privileges on crm.* to 'crm-test';
flush privileges;

CREATE DATABASE IF NOT EXISTS pns DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT all privileges on pns.* to 'crm-test';
flush privileges;
