#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
SERVICE_MENU() {
  if [[ $1 ]]
  then echo -e "\n$1"
  else
  echo "Welcome to My Salon, how can I help you?"
  fi

echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim"
read SERVICE_SELECTION

case $SERVICE_SELECTION in 
1) CUT ;;
2) COLOR ;;
3) PERM ;;
4) STYLE ;;
5) TRIM ;;
*) SERVICE_MENU "I could not find that service. What would you like today?" ;;
esac
}

CUT() {
  echo -e "\n"
}
COLOR() {
  echo -e "\n"
}
PERM() {
  echo -e "\n"
}
STYLE() {
  echo -e "\n"
}
TRIM() {
  echo -e "\n"
}

SERVICE_MENU