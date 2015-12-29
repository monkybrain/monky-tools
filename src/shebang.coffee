### monky-tools: shebang ###

shell = require "shelljs"
args = require("yargs").argv
error = require("./console").error
log = require("./console").log

SHEBANG = "#! /usr/bin/env node"
output = []

# Get filename
if args._[0]?
  filename = args._[0]
else
  # If no filename -> error
  error "Error: no input file!"
  return

# Read file
file = shell.cat filename

# Check if shebang already exists
match = file.match SHEBANG

# If not -> add shebang
if not match?

  # Add shebang
  output.push SHEBANG + "\n"

  # Add rest of file
  output.push file

  # Join
  output = output.join "\n"

  # Write to file
  output.to filename
  log "Shebang added to #{filename}"

else
  log "Did nothing. Shebang already added."
