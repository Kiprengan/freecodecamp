#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read USERNAME
DUSERNAME=$($PSQL "select username from players where username='$USERNAME'")

if [[ -z $DUSERNAME ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT_RESULT=$($PSQL "INSERT INTO players(username) VALUES('$USERNAME')")
  echo -e "\nGuess the secret number between 1 and 1000:"
  RANDOM_NUMBER=$((RANDOM % 1000 + 1))
  echo $RANDOM_NUMBER
  
  while true
  do
    read NUMBER
    if ! [[ $NUMBER =~ ^[0-9]+$ ]]
    then
      echo -e "That is not an integer, guess again:"
      continue
    fi
    
    NGUESS=$((NGUESS + 1))

    if [[ $RANDOM_NUMBER != $NUMBER ]]
    then
    
      if [[ $RANDOM_NUMBER -gt $NUMBER ]]
      then
        echo -e "It's lower than that, guess again:"
      else
        echo -e "It's higher than that, guess again:"
      fi
    else
      echo -e "You guessed it in $NGUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"  
      PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE username = '$USERNAME'")
      INSERT_NUMBERS=$($PSQL "INSERT INTO games(player_id, guesses) VALUES($PLAYER_ID, $NGUESS)")
      break
    fi
  done

else
  GAMES_PLAYED=$($PSQL "SELECT SUM(games_played) FROM players LEFT JOIN games ON players.player_id = games.player_id WHERE username = '$USERNAME';")
  GUESSES=$($PSQL "SELECT MIN(guesses) FROM players LEFT JOIN games ON players.player_id = games.player_id WHERE username = '$USERNAME';")
  
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $GUESSES guesses."
  echo -e "\nGuess the secret number between 1 and 1000:"
  RANDOM_NUMBER=$((RANDOM % 1000 + 1))
  echo $RANDOM_NUMBER
  
  while true
  do
    read NUMBER
    if ! [[ $NUMBER =~ ^[0-9]+$ ]]
    then
      echo -e "That is not an integer, guess again:"
      continue
    fi
    
   NGUESS=$((NGUESS + 1))

    if [[ $RANDOM_NUMBER != $NUMBER ]]
    then
    
      if [[ $RANDOM_NUMBER -gt $NUMBER ]]
      then
        echo -e "It's lower than that, guess again:"
      else
        echo -e "It's higher than that, guess again:"
      fi
    else
      echo -e "You guessed it in $NGUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"  
      PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE name = '$USERNAME'")
      INSERT_NUMBERS=$($PSQL "INSERT INTO games(player_id, guesses) VALUES($PLAYER_ID, $NGUESS)")
      break
    fi
  done
fi
