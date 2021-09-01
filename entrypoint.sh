#!/bin/sh -l

echo "Info  : Querying Eiffel REMReM Generate Service for list of Eiffel Events for Message Protocol $mp"
REMREM_COMMAND="curl -X GET --header \"Accept: application/json\" \"http://89.46.83.162:8081/event_types/$mp\""
echo "Info  : Command to run is"
echo "        $REMREM_COMMAND"
event_list=$($REMREM_COMMAND)
echo "::set-output name=event_list::$event_list"
