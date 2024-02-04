#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$((1 + RANDOM % 1000))
ATTEMPTS=0

GUESS_NUMBER() {
  ATTEMPTS=$(( ATTEMPTS + 1 ))
  read INPUT
  #if guess was bigger
  if [[ $INPUT -gt $SECRET_NUMBER ]] && [[ $INPUT =~ ^[0-9]*$ ]]
  then
    echo "It's lower than that, guess again:"
    GUESS_NUMBER $1
  #if guess was smaller
  elif [[ $INPUT -lt $SECRET_NUMBER ]]  && [[ $INPUT =~ ^[0-9]*$ ]]
  then
    echo "It's higher than that, guess again:"
    GUESS_NUMBER $1
  #if guess was correct
  elif [[ $INPUT -eq $SECRET_NUMBER ]]  && [[ $INPUT =~ ^[0-9]*$ ]]
  then
    echo "You guessed it in $ATTEMPTS tries. The secret number was $SECRET_NUMBER. Nice job!"
    #Inserting data into database
    USER=$($PSQL "SELECT * from users WHERE username='$1'")
    echo "$USER" | while IFS="|" read USER_ID USERNAME GAMES_PLAYED BEST_GAME
    do
      GAMES=$(( GAMES_PLAYED + 1 ))
      if [[ $BEST_GAME -gt $ATTEMPTS ]] || [[ -z $BEST_GAME ]]
      then 
        INSERT_GAME_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES, best_game=$ATTEMPTS WHERE username='$1'")
      else
        INSERT_GAME_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES WHERE username='$1'")
      fi
    done
  #If guess was not an integer
  else
    echo "That is not an integer, guess again:"
    GUESS_NUMBER $1
  fi
}

echo -e "\nEnter your username:"
read USERNAME
USER=$($PSQL "SELECT * from users WHERE username='$USERNAME'")

if [[ -z $USER ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo "Guess the secret number between 1 and 1000:"
  GUESS_NUMBER $USERNAME
else
  echo "$USER" | while IFS="|" read USER_ID USERNAME GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    echo "Guess the secret number between 1 and 1000:"
  done
  GUESS_NUMBER $USERNAME
fi
