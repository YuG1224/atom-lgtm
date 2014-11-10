AtomLgtmView = require './atom-lgtm-view'

module.exports =
  atomLgtmView: null

  activate: (state) ->
    @atomLgtmView = new AtomLgtmView(state.atomLgtmViewState)

  deactivate: ->
    @atomLgtmView.destroy()

  serialize: ->
    atomLgtmViewState: @atomLgtmView.serialize()
