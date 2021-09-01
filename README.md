# Eiffel GitHub Action

This action is the initial version of Eiffel GitHub Action.
It currently fetches list of Eiffel Events from Eiffel REMReM Generate Service for given message protocol.

## Inputs

## `mp`

**Required** The message protocol to use. Default `"eiffelsemantics"`.

## Outputs

## `event_list`

List of Eiffel Events for given message protocol.

## Example usage

uses: actions/ega@v1
with:
  mp: 'eiffelsemantics'
