# monky-tools
Voice debugging, node shebanging and other devtools

* [Install](#install)
* [Voice](#voice)
* [Console](#console)
* [Shebang](#shebang)

<a name="install"></a>
## Install

### Local (voice, console)

Install
```
npm install monky-tools
```

Import
```
tools = require "monky-tools"
```

### Global (shebang)
Install
```
npm install -g monky-tools
```


<a name="voice"></a>
## Voice
Thin wrapper around OS X's 'say' command.
I primarly use it for voice debugging, i.e. getting audio feedback when running code I'm working on so that I don't have to switch focus to the console.

### Usage
Initialize
```
# Use default voice
# (set in OS X's 'Dictation & Speech' settings)

voice = new tools.Voice()

# Or select another voice. I usually go with Fiona because her voice is nice and clear
# (plus I think she likes me...)

fiona = new tools.Voice 'fiona'

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
## Console
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

<a name="shebang"></a>
## Shebang

Adds the shebang `#! /usr/bin/env node` to a file. I use this command with a filewatcher when developing nodejs apps in CoffeeScript.

```
shebang <file>
```

For use with WebStorm (or other JetBrains IDEs), add a FileWatcher with the following settings (run `which shebang` in terminal to get path to executable)

Program: e.g. `/usr/local/bin/shebang`

Arguments: `$FileName$`

Working directory: `$FileDir$`