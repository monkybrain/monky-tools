// Generated by CoffeeScript 1.10.0
(function() {
  var error, log, request, say, tools;

  request = require("request");

  tools = require("./tools");

  say = new tools.Voice('fiona').say;

  log = tools.log;

  error = tools.error;

  error("not available");

  say("error");

}).call(this);
