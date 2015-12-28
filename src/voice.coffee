spawn = require("child_process").spawn
shell = require "shelljs"
tools = require "./tools"

class Voice

  @installed: () ->
    result = shell.which "say"
    if not result?
      throw new Error "'say' binary not found..."

  @list: (pattern) ->
    Voice.installed()
    grep = if pattern? then " | grep " + pattern else ""
    command = "say -v ?" + grep
    result = shell.exec command, silent: true
    if result.code is 0
      console.log result.output
    # console.log result

  constructor: (voice) ->
    Voice.installed()
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