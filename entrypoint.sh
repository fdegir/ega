#!/bin/sh -l

EIFFEL_MP=$1
echo "Info  : Querying Eiffel REMReM Generate Service for list of Eiffel Events for Message Protocol $EIFFEL_MP"
#REMREM_COMMAND="curl -X GET --header 'Accept: application/json' \"http://89.46.83.162:8081/event_types/$EIFFEL_MP\""
REMREM_COMMAND="curl \"http://89.46.83.162:8081/event_types/$EIFFEL_MP\""
echo "Info  : Command to run is"
echo "        $REMREM_COMMAND"
event_list=$($REMREM_COMMAND)
echo "::set-output name=event_list::$event_list"
