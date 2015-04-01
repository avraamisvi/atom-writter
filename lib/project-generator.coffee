fs = require 'fs-plus'
path = require 'path'

module.exports =
class ProjectGenerator

  constructor: (name, title, subtitle) ->
    @fileName = path.join atom.project.getPaths()[0], name + ".js"

    @project =
      name: name
      title: title
      subtitle: subtitle

  generate: ->
    #stats = fs.statSync @fileName
    fs.open @fileName, "r", (err, fd) =>
      proj = JSON.stringify @project
      fs.write fd, proj, (err, writ, str)=>
        fs.close fd
