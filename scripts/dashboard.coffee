# Gets the dashboard
#
# dash me

jsdom = require 'jsdom'

module.exports = (robot) ->
    robot.respond /dash me/i, (msg) ->
      query msg, (body, err) ->
        return msg.send err if err          
        received_today = body.getElementById("received_today").innerHTML
        shipped = body.getElementById("shipped").innerHTML
        backlog =body.getElementById("backlog").innerHTML
        older_than_48 = body.getElementById("older_than_48").innerHTML
        output =  "Received Today: #{received_today}\n"
        output += "Shipped:        #{shipped}\n"
        output += "Backlog:        #{backlog}\n"
        output += "Older than 48:  #{older_than_48}\n"
        msg.send output

getDom = (xml) ->
       body = jsdom.jsdom(xml)
       body

query = (msg, cb) ->
      msg.http("http://printhq2.com/production/dashboard.php")
        .get() (err, res, body) ->
          try
            body = getDom body
          catch err
            err = "could not fetch dashboard"
          cb(body, err)