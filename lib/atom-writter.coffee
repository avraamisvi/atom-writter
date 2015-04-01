AtomWritterView = require './atom-writter-view'
{CompositeDisposable} = require 'atom'
ProjectGenerator = require './project-generator'

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
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-writter:create-project': => @generate()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomWritterView.destroy()

  serialize: ->
    atomWritterViewState: @atomWritterView.serialize()

  toggle: ->
    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()

  generate: ->
    element = @modalPanel.getItem()
    name = element.querySelector("#projectNameField").textContent
    #console.log name
    generator = new ProjectGenerator name, name, name
    generator.generate()
    @modalPanel.hide()
