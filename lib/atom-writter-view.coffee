Mustache = require './mustache'
fs = require 'fs-plus'

module.exports =
class AtomWritterView

  constructor: (serializeState) ->
    @atomWritterView = "
    <atom-panel class='top'>
        <div class='padded'>
            <div class='inset-panel'>
                <div class='panel-heading'>An inset-panel heading</div>
                <div class='panel-body padded'>
                  aslkdjaskldj]sad
                  sasadsada asdadsadsa
                  aslkdjaskldj]sad
                  sasadsada asdadsadsa
                  aslkdjaskldj]sad
                  sasadsada asdadsadsa
                  aslkdjaskldj]sad
                  sasadsada asdadsadsa
                </div>
            </div>
        </div>
    </atom-panel>
    "
    @testeview = ""
    @fileName = "./teste.view"

    console.log("path")
    console.log(fs.absolute(@fileName))

    fs.exists @fileName, (exists)=>
      if (exists)
        fs.stat @fileName, (error, stats) =>
          fs.open @fileName, "r", (error, fd) =>
            @buffer = new Buffer stats.size

            fs.read @fd, @buffer, 0, @buffer.length, null, (error, bytesRead, buffer) =>
              @data = buffer.toString "utf8", 0, buffer.length

              console.log(data);
              fs.close(fd);
      else
        console.log("nao encontrou")


    #@testeview = new File('teste.view');

    # Create root element

    @element = document.createElement('div')
    #@element = Mustache.parse(@atomWritterView);
    #@element.classList.add('atom-writter')

    # Create message element
    #message = document.createElement('div')
    #message.textContent = "Abacaxi eh dificil de cortar."
    #message.classList.add('message')
    #@element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
