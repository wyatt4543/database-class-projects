#! /bin/bash

# get the salon database
PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

# print the introduction to the console
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo "Welcome to My Salon, how can I help you?"

# get the service the user wants to use at the salon
request_service() {
  # if an error message is given, print it
  echo -e $1

  # print the available services
  echo "$($PSQL "SELECT CONCAT(service_id, ') ', name) FROM services ORDER BY service_id;")"

  # get the user's input for what services they want
  read SERVICE_ID_SELECTED

  # get service_id
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
}

# call the service function
request_service

# while not found
while [ -z "$SERVICE_ID" ]
do
  # print error message
  request_service "\nI could not find that service. What would you like today?"
done

# get the service name
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")

# get the user's phone number
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

# get phone_number
PHONE_NUMBER=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'")

# if not found
if [[ -z $PHONE_NUMBER ]]
then
  # get the user's phone number
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME

  # insert the user's name & phone number
  echo "$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")"
else
  # get the user's name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
fi

# get customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

# get the time the customer will be in the salon
echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

# create the appointment
echo "$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID,$SERVICE_ID,'$SERVICE_TIME')")"

# tell the user what they have been put down for
echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
