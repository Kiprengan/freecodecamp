#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
SERVICE_MENU() {
  if [[ $1 ]]
  then echo -e "\n$1"
  echo -e "1) cut\n2) color\n3) perm\n4) style\n5) trim"
  else
  echo "Welcome to My Salon, how can I help you?"
  echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim"
  fi

read SERVICE_ID_SELECTED

case $SERVICE_ID_SELECTED in 
1) CUT ;;
2) COLOR ;;
3) PERM ;;
4) STYLE ;;
5) TRIM ;;
*) SERVICE_MENU "I could not find that service. What would you like today?" ;;
esac
}

CUSTOMER() {
  echo -e "\nWhat's your phone number?"
  SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  CUSTOMER_INSERTED=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -E 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
  APPOINTMENT=$($PSQL "insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."
  
}

CUT() {
  CUSTOMER
}
COLOR() {
  CUSTOMER
}
PERM() {
  CUSTOMER
}
STYLE() {
  CUSTOMER
}
TRIM() {
  CUSTOMER
}

SERVICE_MENU