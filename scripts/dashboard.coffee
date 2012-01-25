# Gets the dashboard
#
# dash me

module.exports = (robot) ->
    robot.respond /dash me/i, (msg) ->
        dashUrl = "http://printhq2.com/production/dashboard.php"
        msg.send dashUrl