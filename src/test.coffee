# Question = require "./question"
request = require "request"
tools = require "./tools"


say = new tools.Voice 'fiona'
return
log = tools.log
error = tools.error
error "not available"
say "error"