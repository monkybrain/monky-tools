// Generated by CoffeeScript 1.10.0
(function() {
  var Voice, daniel, error, fiona, log, tools;

  tools = require("../../src/js/tools");

  log = tools.console.log;

  error = tools.console.error;

  Voice = tools.Voice;

  fiona = new Voice('fiona');

  return;

  daniel = new tools.Voice('daniel');

  error("Error! No particular error, just testing...");

  log("Green looks better than white, right?");

  fiona.say("Daniel, are you alright?");

  daniel.say("I suppose");

}).call(this);