{WorkspaceView} = require 'atom'
AtomLgtm = require '../lib/atom-lgtm'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AtomLgtm", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('atom-lgtm')

  describe "when the atom-lgtm:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.atom-lgtm')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch atom.workspaceView.element, 'atom-lgtm:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.atom-lgtm')).toExist()
        atom.commands.dispatch atom.workspaceView.element, 'atom-lgtm:toggle'
        expect(atom.workspaceView.find('.atom-lgtm')).not.toExist()
