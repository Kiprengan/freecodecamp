#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align --tuples-only -c"

ARG=$1

if [[ $ARG ]]
then
if [[ $ARG =~ ^[0-9]+$ ]]; then
  ITEM=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$ARG")
else
  ITEM=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$ARG' OR name='$ARG'")
fi
  if [[ -z $ITEM ]]
  then 
  echo "I could not find that element in the database."
  else
  NAME=$($PSQL "select name from elements where atomic_number=$ITEM")
  SYMBOL=$($PSQL "select symbol from elements where atomic_number=$ITEM")
  MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ITEM")
  MP=$($PSQL "select melting_point_celsius from properties where atomic_number=$ITEM")
  BP=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ITEM")
  TYPE=$($PSQL "select type from types inner join properties on types.type_id = properties.type_id and atomic_number=$ITEM")
  echo -e "The element with atomic number $(echo $ITEM | sed -E 's/^ *| *$//g') is $(echo $NAME | sed -E 's/^ *| *$//g') ($(echo $SYMBOL | sed -E 's/^ *| *$//g')). It's a $(echo $TYPE | sed -E 's/^ *| *$//g'), with a mass of $(echo $MASS | sed -E 's/^ *| *$//g') amu. $(echo $NAME | sed -E 's/^ *| *$//g') has a melting point of $(echo $MP | sed -E 's/^ *| *$//g') celsius and a boiling point of $(echo $BP | sed -E 's/^ *| *$//g') celsius."
  fi
else
echo "Please provide an element as an argument."
fi
