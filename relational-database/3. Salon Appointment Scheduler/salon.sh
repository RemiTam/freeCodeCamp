#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

#greet customer
echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can i help you?\n"

MAIN() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  #get services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  #display services
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do 
    echo "$SERVICE_ID) $NAME"
  done
  #read customers service
  read SERVICE_ID_SELECTED
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  #check if correct service is inputted
  if [[ -z $SERVICE ]]
  then
    #if wrong then redirect back
    MAIN "I could not find that service. What would you like today?"
  else
    #ask phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    #get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    #check if customer exists
    if [[ -z $CUSTOMER_ID ]]
    then
      #ask for customer name and add new customer
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')") 
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      #call make appointment function
      MAKE_APPOINTMENT $CUSTOMER_ID $SERVICE_ID_SELECTED
    else
      #if customer exists call make appointment right away
      MAKE_APPOINTMENT $CUSTOMER_ID $SERVICE_ID_SELECTED
    fi
  fi
}

MAKE_APPOINTMENT() {
  #get customer name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$1")
  #get service time
  echo -e "\nWhat time would you like your cut,$CUSTOMER_NAME?"
  read SERVICE_TIME
  #insert appointment
  APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($1, $2, '$SERVICE_TIME')")
  #if appointment is inserted
  if [[ $APPOINTMENT_RESULT = "INSERT 0 1" ]]
  then
    #get service and say bye to customer
    SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$2")
    echo -e "\nI have put you down for a$SERVICE at $SERVICE_TIME,$CUSTOMER_NAME."
  fi
}

#start a function
MAIN