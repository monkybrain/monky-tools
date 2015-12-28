ws = require "webspeech"

console.log ws

listener = new ws.SpeechRecognizer language: 'en'

listener.on 'bestResult', (text) ->
  console.log "Recognized text: " + text

listener.on 'listen', (event) ->
  console.log "Listening..."

listener.on 'error', (event) ->
  console.error event

listener.on 'soundEnd', (event) ->
  console.log "Listen finished"

listener.listen()