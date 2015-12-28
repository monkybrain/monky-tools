console.log "Running"

r = new window.webkitSpeechRecognition()

r.continuous = false

r.onresult = (event) ->
  alert 'result'

r.onerror = (error) ->
  console.error error

r.start()
setTimeout () ->
    r.stop()
  , 10000


