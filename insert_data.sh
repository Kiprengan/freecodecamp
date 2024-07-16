#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $"$($PSQL "truncate table games, teams")"
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WG OG
do 
# Check in the table first if winner exists

if [[ $YEAR != 'year' ]]
then
# Select winner and loses in teams table
WINNER_IN_TABLE=$($PSQL "select name from teams where name='$WINNER'")
WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
OPPONENT_IN_TABLE=$($PSQL "select name from teams where name='$OPPONENT'")
OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
# If not in table insert them and get their ids
if [[ -z $WINNER_IN_TABLE ]]
then
#Insert Winner and get winner id
WINNER_INTO_TABLE=$($PSQL "insert into teams(name) values('$WINNER')")
WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
fi
if [[ -z $OPPONENT_IN_TABLE ]]
then
#insert opponent and get id
OPPONENT_INTO_TABLE=$($PSQL "insert into teams(name) values('$OPPONENT')")
OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
fi
GAME_DATA_INSERTED=$($PSQL "insert into games(year, round, winner_id, opponent_id,winner_goals,opponent_goals) values($YEAR , '$ROUND',$WINNER_ID,$OPPONENT_ID,$WG,$OG)")
fi
done