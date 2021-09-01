# Eiffel GitHub Action

This action is created to demonstrate [Eiffel Community](https://github.com/eiffel-community) projects and should not be used for anything real.

For the purposes of the demo, the action publishes

* [EiffelSourceChangeCreatedEvent](https://github.com/eiffel-community/eiffel/blob/master/eiffel-vocabulary/EiffelSourceChangeCreatedEvent.md) when a new PR is opened or an existing PR is reopened
* [EiffelSourceChangeSubmittedEvent](https://github.com/eiffel-community/eiffel/blob/master/eiffel-vocabulary/EiffelSourceChangeSubmittedEvent.md) when a PR is merged or a commit is pused to repo directly

using [Eiffel REMReM Publish Service](https://github.com/eiffel-community/eiffel-remrem-publish).

# Inputs

## `remrem_publish_service_url`

**Required** URL to Eiffel REMReM Publish Service. Default `"http://89.46.83.162:8080/generateAndPublish"`.

# Example usage

```
uses: actions/ega@v24
with:
  remrem_publish_service_url: 'http://your/remrem/publis/service/generateAndPublish'
```
