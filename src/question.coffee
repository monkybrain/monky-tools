say = require("./say")
exec = require("child_process").exec

log = (data) ->
  console.log data

class Question

  constructor: (voice) ->
    @voice = if voice? then voice else 'daniel'
    @question = ""

  ask: (phrase) ->
    if phrase? then @phrase = phrase
    index = phrase.indexOf "?"
    if index is -1
      phrase += "?"
    @question = phrase

  answer: (phrase) ->
    say @question, @voice
    say phrase, @voice

  yes: (phrase) ->
    @answer "yes, " + phrase

  no: (phrase) ->
    @answer "no, " + phrase

module.exports = Question