#!/bin/bash


#Accessing database
mysql -u crm-test -p -e "show schemas" > schemaNames.txt

schemaCount="$(cat schemaNames.txt | wc -l)"
echo "schemaCount: ${schemaCount}"

IFS=$'\r\n' GLOBIGNORE='*' command eval  'schema=($(cat schemaNames.txt))'

if [ $schemaCount >2 ] 
then
	for (( i = 2; i <= $schemaCount-1; i++ )) 
	   do 
	       currentSchema=${schema[i]}	   
	       mysql -u crm-test -p -e "use $currentSchema; show tables;" > tableNames.txt
	      #truncateTable
	       IFS=$'\r\n' GLOBIGNORE='*' command eval  'table=($(cat tableNames.txt))'
	       tableCount="$(cat tableNames.txt | wc -l)"
	       for ((j=1; j<=$tableCount-1; j++ ))
		   do
		      echo "Truncating $currentSchema : ${table[j]}"
		      mysql -u crm-test -p -e " use $currentSchema; truncate table \`${table[j]}\`;"
	       done	       
	done


else
	echo "There is no self-defined schema."
	
fi	
	

#truncateTable () {}
