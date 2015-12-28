colors = require "colors"

module.exports =

  log: (data) ->
    console.log data.green

  error: (error) ->
    console.log error.red