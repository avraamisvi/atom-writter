AtomWritterView = require './atom-writter-view'
{CompositeDisposable} = require 'atom'

module.exports = AtomWritter =
  atomWritterView: null
  modalPanel: null
  subscriptions: null
  modalGeneratorPanel: null

  activate: (state) ->

    @atomWritterView = new AtomWritterView(state.atomWritterViewState)
    @atomWritterView.generateView()

    @modalPanel = atom.workspace.addModalPanel(item: @atomWritterView.getElement(), visible: false)

      # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

      # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-writter:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomWritterView.destroy()

  serialize: ->
    atomWritterViewState: @atomWritterView.serialize()

  toggle: ->
    console.log 'AtomWritter was toggled!'
    console.log @modalPanel

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()

  generate: ->
    console.log 'AtomWritter was generating!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
