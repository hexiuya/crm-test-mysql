docker stop crm-test-mysql
docker rm crm-test-mysql
docker run -d -p 3306:3306 --name crm-test-mysql -v /home/test/mysql-data:/var/lib/mysql -v /home/test/uat/crm-test-mysql/sql-script:/sql-script -e MYSQL_ROOT_PASSWORD="19880902Ho" -e MYSQL_USER=crm-test -e MYSQL_PASSWORD=Crm-test --network crm-network --network-alias alias-crm-mysql mysql_customised:5.7
