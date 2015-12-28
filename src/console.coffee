colors = require "colors"

module.exports =

  log: (data) ->
    if typeof data is 'object'
      data = JSON.stringify(data)
    console.log data.green

  error: (error) ->
    if typeof data is 'object'
      data = JSON.stringify(data)
    console.log error.red
