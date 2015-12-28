# Import
tools = require "../../src/js/tools"
log = tools.console.log
error = tools.console.error

# Setup
Voice = tools.Voice
fiona = new Voice 'fiona'


return
daniel = new tools.Voice 'daniel'


# Run
error "Error! No particular error, just testing..."
log "Green looks better than white, right?"
fiona.say "Daniel, are you alright?"
daniel.say "I suppose"
