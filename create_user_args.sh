#!/bin/bash

# This script creates an account on the local system.
# You will be prompted for the account name and password.

# create_user_args.sh
# usage: create_user_args.sh USERNAME [COMMENT]



#check for root login
if [[ ${EUID} -ne 0 ]]
  then echo 'Error: script must be run as superuser'
  exit 1
else
  echo 'Initializing'
  sleep 3
fi

# Check for minimum of 1 argument provided to be set as username
if [[ "${#}" -lt 1 ]]
  then echo "Error: no argument for username provided"
  exit 1
else
  echo "You supplied ${1} for a username"
fi

# This is used to concatenate all argument after the first into a single string.
echo "this should be the total number of arguments supplied: ${#}"
TOTAL_ARG="${#}"
STRING_ARG=''

ARG_TO_ARR=("${@}")

# --> Attempt to concatenate arguments using for loop. Not Working.
for (( i=1;i<"${TOTAL_ARG}";i++ ))
do
  STRING+="${ARG_TO_ARR[i]} "
done


USER_NAME=${1}
COMMENT=${STRING}

# Create the user.
useradd -c "${COMMENT}" -m "${USER_NAME}"
echo "New User: ${USER_NAME} created successfully."
sleep .1
echo "Comment: ${COMMENT} comment added successfully."



# Generate psuedo random password
THREE_RANDS="${RANDOM}${RANDOM}${RANDOM}"
echo "this the value of variable THREE_RANDS: ${THREE_RANDS}"
sleep 1

FINAL_RAND=$(echo ${THREE_RANDS} | sha256sum | head -c8) 


PASSWORD=${FINAL_RAND}

# Set the password for the user.
echo ${PASSWORD}
echo "${USER_NAME}:${PASSWORD}" | chpasswd


# Force password change on first login.
#passwd -e ${USER_NAME}

