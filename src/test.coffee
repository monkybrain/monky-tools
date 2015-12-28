# Question = require "./question"
request = require "request"
tools = require "./tools"

tools.Voice.list "tr_"
return
say = new tools.Voice('fiona').say
log = tools.log
error = tools.error
error "not available"
say "error"