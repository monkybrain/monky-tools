spawn = require("child_process").spawn
exec = require("child_process").exec
tools = require "./tools"
error = tools.error

class Voice

  @list: (pattern) ->
    grep = if pattern? then " | grep " + pattern else ""
    command = "say -v ?" + grep
    console.log command
    exec command, (err, stdout, stderr) ->
      console.log stdout

  constructor: (voice) ->
    @voice = voice
    @queue = []
    @running = false
    @keys = false

  object2phrase: (object) ->
    output = []
    for key, value of object
      if @keys
        output.push "#{key}: "
      output.push "#{value}, "
    output.join ""

  array2phrase: (phrase) ->
    output = []
    for item in phrase
      if typeof item is 'object'
        output.push @object2phrase item
      else
        output.push item
    output.join ", "

  say: (phrase, voice) =>
    if voice? then @voice = voice

    # Process input
    if typeof phrase is 'object'
      if phrase instanceof Array
        phrase = @array2phrase phrase
      else
        phrase = @object2phrase phrase

    @queue.push phrase
    if not @running
      @exec()

  exec: () =>
    @running = true
    if @queue.length > 0
      phrase = @queue[0]
      @queue = @queue[1..]
      c = spawn "say", ["-v", @voice, phrase]
      console.log "#{@voice}: #{phrase}"
      c.on 'close', (code) =>
        @exec()
    else
      @running = false

module.exports = Voice