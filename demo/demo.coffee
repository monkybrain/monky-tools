# Import
tools = require "../src/js/tools"

# Setup
log = tools.console.log
error = tools.console.error
fiona = new tools.Voice 'fiona'

# Simulated debugging (50 % success, 50 % error)
if Math.random() > 0.5
  log "Success"
  fiona.say "Success"
else
  error "Error!"
  fiona.say "Error!"