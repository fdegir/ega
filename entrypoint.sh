#!/bin/bash

echo "Info  : Querying Eiffel REMReM Generate Service for list of Eiffel Events for Message Protocol $mp"
event_list=$(curl -X GET --header "Accept: application/json" "http://89.46.83.162:8081/event_types/$mp")
echo "::set-output name=event_list::$event_list"