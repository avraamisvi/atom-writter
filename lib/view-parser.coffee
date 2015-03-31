Mustache = require './mustache'
fs = require 'fs-plus'
path = require 'path'

module.exports =
class ViewParser

  constructor: (target, viewname) ->
    @fileName = path.join __dirname, viewname
    @element = null
    @target = target

  getElement: ->
    @element

  generateView: (data) ->
    stats = fs.statSync @fileName
    fd = fs.openSync @fileName, "r"
    buffer = new Buffer stats.size

    fs.readSync fd, buffer, 0, buffer.length, null
    viewstr = buffer.toString "utf8", 0, buffer.length

    Mustache.parse(viewstr);
    @element = @target
    @element.innerHTML = Mustache.render(viewstr, data)
    fs.closeSync(fd);
