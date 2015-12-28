Voice = require "./voice"
console = require "./console"

module.exports =
  Voice: Voice
  log: console.log
  error: console.error
