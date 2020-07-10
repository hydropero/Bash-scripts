#!/bin/bash

###################################################################################
# Help
###################################################################################
help()
{
   # Display help
   echo ''
   echo ''
   echo 'This utility will create many possible email permutations of a given name'
   echo 'and domain to be used to contact someone whose exact email is unknown.'
   echo ''
   echo 'Input can be given as arguments for faster use as shown below.'
   echo ''
   echo 'SYNTAX - emailgen [first_name] [last_name] [domain]'
   echo 'this information can be provided either as initial arguments or user will'
   echo 'prompted to input the information when the application is called.'
   echo ''
}

if [[ $1 == "-h" ]]
 then help
fi
echo ''
echo 'Welcome to the emailgen utility'
echo ''
echo 'This utility was built to help contact a person whose exact email address'
echo 'is unknown. You will need a First Name, Last Name and Email Domain.'
echo ''
echo 'Please input the following information to generate the email list'
echo ''
echo ''
echo ''
# Reading in all relevant user input necessary.
echo 'Example - First Name: John'
read -p 'First Name: ' FIRST_NAME
echo ''
echo 'Example - Last Name: Hancock'
read -p 'Last Name: ' LAST_NAME
echo ''
echo 'Example - Domain name: gmail.com'
read -p 'Domain Name: ' DOMAIN
echo ''
echo 'Generating email list now!'

#Performing all possible email conventions
DOMAIN='@'${DOMAIN}
EMAIL_PERM1=${FIRST_NAME}'.'${LAST_NAME}${DOMAIN}
EMAIL_PERM2=${FIRST_NAME:0:1}'.'${LAST_NAME}${DOMAIN}
EMAIL_PERM3=${FIRST_NAME:0:1}'.'${LAST_NAME:0:1}${DOMAIN}
EMAIL_PERM4=${FIRST_NAME}'.'{LAST_NAME:0:1}${DOMAIN}

EMAIL_PERM5=${FIRST_NAME:0:1}${LAST_NAME}${DOMAIN}
EMAIL_PERM6=${FIRST_NAME}${LAST_NAME}${DOMAIN}
EMAIL_PERM7=${FIRST_NAME}${LAST_NAME:0:1}${DOMAIN}
EMAIL_PERM8=${FIRST_NAME:0:1}${LAST_NAME:0:1}${DOMAIN}


EMAIL_PERM9=${FIRST_NAME}'_'${LAST_NAME}${DOMAIN}
EMAIL_PERM10=${FIRST_NAME:0:1}'_'${LAST_NAME}${DOMAIN}
EMAIL_PERM11=${FIRST_NAME:0:1}'_'${LAST_NAME:0:1}${DOMAIN}
EMAIL_PERM12=${FIRST_NAME}'_'${LAST_NAME:0:1}${DOMAIN}

EMAIL_PERM13=${FIRST_NAME}'-'${LAST_NAME}${DOMAIN}
EMAIL_PERM14=${FIRST_NAME:0:1}'-'${LAST_NAME}${DOMAIN}
EMAIL_PERM15=${FIRST_NAME:0:1}'-'${LAST_NAME:0:1}$DOMAIN
EMAIL_PERM16=${FIRST_NAME}'-'${LAST_NAME:0:1}${DOMAIN}


EMAIL_PERM17=${LAST_NAME}${DOMAIN}
EMAIL_PERM18=${FIRST_NAME}${DOMAIN}

EMAIL_PERM19=${LAST_NAME}'.'${FIRST_NAME}${DOMAIN}
EMAIL_PERM20=${LAST_NAME:0:1}'.'${FIRST_NAME}${DOMAIN}
EMAIL_PERM21=${LAST_NAME:0:1}','${FIRST_NAME:0:1}${DOMAIN}
EMAIL_PERM22=${LAST_NAME}'.'${FIRST_NAME:0:1}${DOMAIN}

EMAIL_PERM23=${LAST_NAME:0:1}${FIRST_NAME}${DOMAIN}
EMAIL_PERM24=${LAST_NAME}${FIRST_NAME}${DOMAIN}
EMAIL_PERM25=${LAST_NAME}${FIRST_NAME:0:1}${DOMAIN}
EMAIL_PERM26=${LAST_NAME:0:1}${FIRST_NAME:0:1}${DOMAIN}

EMAIL_PERM27=${LAST_NAME}'_'${FIRST_NAME}${DOMAIN}
EMAIL_PERM28=${LAST_NAME:0:1}'_'${FIRST_NAME}${DOMAIN}
EMAIL_PERM29=${LAST_NAME}'_'${FIRST_NAME:0:1}${DOMAIN}
EMAIL_PERM30=${LAST_NAME:0:1}'_'${FIRST_NAME:0:1}${DOMAIN}

EMAIL_PERM31=${LAST_NAME}'-'${FIRST_NAME}${DOMAIN}
EMAIL_PERM32=${LAST_NAME}'-'${FIRST_NAME:0:1}${DOMAIN}
EMAIL_PERM33=${LAST_NAME:0:1}'-'${FIRST_NAME}${DOMAIN}
EMAIL_PERM33=${LAST_NAME:0:1}'-'${FIRST_NAME:0:1}${DOMAIN}


for count in {1..33}
do
   EMAIL='EMAIL_PERM'
   TEST=${EMAIL}${count}
   sleep .1
   echo ${!TEST}
   if [[ ${count} -eq 33 ]]
     then echo ${!TEST} >> email.txt
   else
     echo ${!TEST}';' >> email.txt
   fi
done

cat email.txt | tr -d '\n' > emails.txt
rm email.txt
