# Import
tools = require "../../src/js/tools"
log = tools.console.log
error = tools.console.error

# Setup
Voice = tools.Voice
fiona = new Voice 'fiona'

# List all English voices
Voice.list("en_")

# Run
error "Error! No particular error, just testing..."
log "Green looks better than white, right?"
fiona.say "You english bastard"
