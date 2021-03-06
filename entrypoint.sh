#!/bin/sh

generate_escc() {
  EIFFEL_MSG_FILE="$1"
  cat <<EOF > "$EIFFEL_MSG_FILE"
{
  "msgParams": {
    "meta": {
      "type": "EiffelSourceChangeCreatedEvent",
      "version": "4.0.0"
    }
  },
  "eventParams": {
    "data": {
      "author": {
        "name": "$GITHUB_ACTOR",
        "email": "$GITHUB_ACTOR",
        "id": "$GITHUB_ACTOR",
        "group": "n/a"
      },
      "gitIdentifier": {
        "repoName": "$GITHUB_REPOSITORY",
        "repoUri": "$GITHUB_REPO_URI",
        "branch": "master",
        "commitId": "$GITHUB_SHA"
      },
      "customData": [
        {
          "key": "pr_no",
          "value": "n/a"
        }
      ]
    }
  }
}
EOF
}

generate_escs() {
  EIFFEL_MSG_FILE="$1"
  cat <<EOF > "$EIFFEL_MSG_FILE"
{
  "msgParams": {
    "meta": {
      "type": "EiffelSourceChangeSubmittedEvent",
      "version": "3.0.0"
    }
  },
  "eventParams": {
    "data": {
      "submitter": {
        "name": "$GITHUB_ACTOR",
        "email": "$GITHUB_ACTOR",
        "id": "$GITHUB_ACTOR",
        "group": "n/a"
      },
      "gitIdentifier": {
        "repoName": "$GITHUB_REPOSITORY",
        "repoUri": "$GITHUB_REPO_URI",
        "branch": "master",
        "commitId": "$GITHUB_SHA"
      },
      "customData": [
        {
          "key": "pr_no",
          "value": "n/a"
        }
      ]
    }
  }
}
EOF
}

# set some vars
remrem_publish_service_url=$1
GITHUB_REPO_URI="https://github.com/$GITHUB_REPOSITORY"
EIFFEL_MSG_FILE="$GITHUB_WORKSPACE/eiffel_event.json"

echo "Info  : Generating and publishing Eiffel Event"
echo "-------------------------------------------------"
echo "        Eiffel Message Protocol:  $eiffel_mp"
echo "        Eiffel Message Type: $eiffel_message_type"
echo "        Eiffel REMReM Publish Service URL: $remrem_publish_service_url"
echo "-------------------------------------------------"

# generate event or fail if unrecognized event
case ${eiffel_message_type} in
  EiffelSourceChangeCreatedEvent)
    generate_escc "$EIFFEL_MSG_FILE"
    ;;
  EiffelSourceChangeSubmittedEvent)
    generate_escs "$EIFFEL_MSG_FILE"
    ;;
  *)
    echo "Error : Invalid event type $eiffel_message_type"
    exit 1
    ;;
esac

# set some more vars
PUBLISH_URL="${remrem_publish_service_url}?mp=${eiffel_mp}&msgType=${eiffel_message_type}"
PUBLISH_CMD="curl -H Content-Type:application/json -X POST --data-binary @$EIFFEL_MSG_FILE $PUBLISH_URL"

# log info to console and publish event
echo "Info  : Generated event $eiffel_message_type"
echo "-------------------------------------------------"
cat "$EIFFEL_MSG_FILE"
echo "-------------------------------------------------"
echo "Info  : Publishing event using Eiffel REMReM Publish Service via command"
echo "-------------------------------------------------"
echo "$PUBLISH_CMD"
$PUBLISH_CMD
echo "-------------------------------------------------"
echo "Info  : GitHub event.json content"
echo "-------------------------------------------------"
cat $GITHUB_EVENT_PATH
echo "-------------------------------------------------"
echo "Info  : Done!"
exit 0
