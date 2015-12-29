#! /usr/bin/env node

// Generated by CoffeeScript 1.10.0

/* monky-tools: shebang */

(function() {
  var SHEBANG, args, error, file, filename, log, match, output, shell;

  shell = require("shelljs");

  args = require("yargs").argv;

  error = require("./console").error;

  log = require("./console").log;

  SHEBANG = "#! /usr/bin/env node";

  output = [];

  if (args._[0] != null) {
    filename = args._[0];
  } else {
    error("Error: no input file!");
    return;
  }

  file = shell.cat(filename);

  match = file.match(SHEBANG);

  if (match == null) {
    output.push(SHEBANG + "\n");
    output.push(file);
    output = output.join("\n");
    output.to(filename);
    log("Shebang added to " + filename);
  } else {
    log("Did nothing. Shebang already added.");
  }

}).call(this);