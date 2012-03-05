# Good morning!
#
# good <time>- say good morning, good afternoon, etc.

module.exports = (robot) ->
  robot.respond /good ([a-zA-Z]+)/i, (msg) ->
    msg.send "Good #{msg.match[1]}, #{msg.messages.user.name}"


