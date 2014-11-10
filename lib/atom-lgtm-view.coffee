{View} = require 'atom'
request = require 'request'

module.exports =
class AtomLgtmView extends View
  constructor: (serializeState) ->
    atom.workspaceView.command 'atom-lgtm:lgtm', => @lgtm()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  lgtm: ->
    option =
      url: "http://www.lgtm.in/g"
      json: true

    request.get option, (err, res, body) ->
      editor = atom.workspace.getActiveEditor()

      text = """
        #{editor.getText()}

        #{body.markdown.split("\n")[0]}
      """

      editor.setText text
      return
