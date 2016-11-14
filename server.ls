# express = require('express')
# cors = require('cors')
# bodyParser = require('body-parser')
require! {
  'express'
  'http'
  'socket.io': socketServer
  'cors'
  'body-parser': bp
}

app = express!
httpServer = http.Server(app)
io = socketServer(httpServer)

module.exports = (port) ->
  io.on "connection", (socket) ->

    socket.on "sayHello", (data, response) ->
      console.info "a user said hello", socket.handshake.headers.origin

    socket.on "disconnect", ->
      console.info "a user disconnected"

  httpServer.listen port, -> 
    console.log "listening on port: #{port}"



