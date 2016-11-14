# express = require('express')
# cors = require('cors')
# bodyParser = require('body-parser')
require! {
  'express'
  'cors'
  'body-parser': bp
}

app = express!

module.exports = (port) ->
  # express middlewares
  app.use(cors!)

  app.get '/api', (req, res) ->
    func = req.query.fn
    # realFunc = require("./apiFunctions/" + func + ".js")
    realFunc = require("./apiFunctions/#{func}.js")

    realFunc(req.body.params)
    .then (result) ->
      res.end JSON.stringify(result)
    .catch (err) ->
      console.error("Interanl Server Error...", err)

  app.listen port, ->
    console.log("listening on port: #{port}")



