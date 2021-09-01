#!/bin/sh

remrem_generate_service_url=$1
remrem_publish_service_url=$2
#REMREM_COMMAND="curl -X GET --header 'Accept: application/json' \"http://89.46.83.162:8081/event_types/$EIFFEL_MP\""
#REMREM_COMMAND="curl http://89.46.83.162:8081/event_types/$EIFFEL_MP"
#echo "Info  : Command to run is"
#echo "        $REMREM_COMMAND"
#event_list=$($REMREM_COMMAND)
echo "Info  : GitHub event.json content"
echo "-------------------------------------------------"
cat $GITHUB_EVENT_PATH
echo "-------------------------------------------------"
echo "Info  : Generating and publishing Eiffel Event"
echo "        Eiffel Message Protocol:  $EIFFEL_MP"
echo "        Eiffel Message Type: $EIFFEL_MSG_TYPE"
echo "        Eiffel REMReM Generate Service URL: $remrem_generate_service_url"
echo "        Eiffel REMReM Publish Service URL: $remrem_publish_service_url"
event_body=$EIFFEL_MSG_TYPE
echo "::set-output name=event_body::$event_body"
echo "Info  : Done!"
exit 0

echo "Info  : Environment variables"
echo "-------------------------------------------------"
env
#echo HOME -e GITHUB_JOB -e GITHUB_REF -e GITHUB_SHA -e GITHUB_REPOSITORY -e GITHUB_REPOSITORY_OWNER -e GITHUB_RUN_ID -e GITHUB_RUN_NUMBER -e GITHUB_RETENTION_DAYS -e GITHUB_ACTOR -e GITHUB_WORKFLOW -e GITHUB_HEAD_REF -e GITHUB_BASE_REF -e GITHUB_EVENT_NAME -e GITHUB_SERVER_URL -e GITHUB_API_URL -e GITHUB_GRAPHQL_URL -e GITHUB_WORKSPACE -e GITHUB_ACTION -e GITHUB_EVENT_PATH -e GITHUB_ACTION_REPOSITORY -e GITHUB_ACTION_REF -e GITHUB_PATH -e GITHUB_ENV -e RUNNER_OS -e RUNNER_TOOL_CACHE -e RUNNER_TEMP -e RUNNER_WORKSPACE -e ACTIONS_RUNTIME_URL -e ACTIONS_RUNTIME_TOKEN -e ACTIONS_CACHE_URL
echo "-------------------------------------------------"
