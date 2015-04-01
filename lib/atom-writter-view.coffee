ViewParser = require './view-parser'

module.exports =
class AtomWritterView

  constructor: (serializeState) ->
    @testeview = ""
    @fileName = path.join __dirname, "teste.view"
    @element = null

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  generateView: ->
    view =  new ViewParser document.createElement('div'), "create-project-modal.view"
    view.generateView({})
    @element = view.getElement()

    @element.querySelector("#cancelButton").onclick = (eve)=>
      atom.commands.dispatch @element, "atom-writter:toggle"

    @element.querySelector("#createButton").onclick = (eve)=>
      atom.commands.dispatch @element, "atom-writter:create-project"
