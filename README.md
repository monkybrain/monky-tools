# monky-tools
Voice debugging and other devtools

* [General](#general)
* [Voice](#voice)
* [Console](#console)

<a name="general"></a>
# General

Install
```
npm install monky-tools
```

Import
```
tools = require "monky-tools"
```

<a name="voice"></a>
# Voice
Thin wrapper around OS X's 'say' command.
I primarly use it for voice debugging, i.e. getting audio feedback when running code I'm working on so that I don't have to switch focus to the console.

## Usage
Import
```
Voice = tools.Voice
```

Initialize
```
# Use default voice
# (set in OS X's 'Dictation & Speech' settings)

voice = new Voice()

# Or select another voice. I usually go with Fiona because her voice is nice and clear
# (plus I think she likes me...)

fiona = new Voice 'fiona'

# If you don't know which voices you have installed, you can list them
# (takes grep pattern as optional parameter, e.g. "en_" for all English voices)

Voice.list()

Voice.list("en_")
```

Run
```
# Default voice
voice.say "Voice debugging! What will they think of next?"

# Fiona
fiona.say "Rangers are shit. Celtic rule!"					# Sorry, she's Scottish...
```

<a name="console"></a>
# Console
Thin wrapper around good 'ol `console.log` and `console.error`. Adds green and red color to output.

Import
```
log = tools.console.log
error = tools.console.error
```
Run
```
# Output green message to console
log "Server up and running"

# Output red error message to console
error "Error: file not found!"
```