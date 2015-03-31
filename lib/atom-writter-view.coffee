Mustache = require './mustache'
fs = require 'fs-plus'
path = require 'path'

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
    stats = fs.statSync @fileName
    fd = fs.openSync @fileName, "r"
    buffer = new Buffer stats.size

    fs.readSync fd, buffer, 0, buffer.length, null
    data = buffer.toString "utf8", 0, buffer.length
    console.log(data);

    Mustache.parse(data);
    @element = document.createElement('div')
    @element.innerHTML = Mustache.render(data)

    console.log(@element)
    fs.closeSync(fd);
