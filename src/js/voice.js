// Generated by CoffeeScript 1.10.0
(function() {
  var Voice, exec, spawn, tools,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  spawn = require("child_process").spawn;

  exec = require("child_process").exec;

  tools = require("./tools");

  Voice = (function() {
    Voice.list = function(pattern) {
      var command, grep;
      grep = pattern != null ? " | grep " + pattern : "";
      command = "say -v ?" + grep;
      console.log(command);
      return exec(command, function(err, stdout, stderr) {
        return console.log(stdout);
      });
    };

    function Voice(voice) {
      this.exec = bind(this.exec, this);
      this.say = bind(this.say, this);
      this.voice = voice;
      this.queue = [];
      this.running = false;
      this.keys = false;
    }

    Voice.prototype.object2phrase = function(object) {
      var key, output, value;
      output = [];
      for (key in object) {
        value = object[key];
        if (this.keys) {
          output.push(key + ": ");
        }
        output.push(value + ", ");
      }
      return output.join("");
    };

    Voice.prototype.array2phrase = function(phrase) {
      var i, item, len, output;
      output = [];
      for (i = 0, len = phrase.length; i < len; i++) {
        item = phrase[i];
        if (typeof item === 'object') {
          output.push(this.object2phrase(item));
        } else {
          output.push(item);
        }
      }
      return output.join(", ");
    };

    Voice.prototype.say = function(phrase, voice) {
      if (voice != null) {
        this.voice = voice;
      }
      if (typeof phrase === 'object') {
        if (phrase instanceof Array) {
          phrase = this.array2phrase(phrase);
        } else {
          phrase = this.object2phrase(phrase);
        }
      }
      this.queue.push(phrase);
      if (!this.running) {
        return this.exec();
      }
    };

    Voice.prototype.exec = function() {
      var c, phrase;
      this.running = true;
      if (this.queue.length > 0) {
        phrase = this.queue[0];
        this.queue = this.queue.slice(1);
        c = spawn("say", ["-v", this.voice, phrase]);
        console.log(this.voice + ": " + phrase);
        return c.on('close', (function(_this) {
          return function(code) {
            return _this.exec();
          };
        })(this));
      } else {
        return this.running = false;
      }
    };

    return Voice;

  })();

  module.exports = Voice;

}).call(this);