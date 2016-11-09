var express = require('express');
var cors = require('cors')
var bodyParser = require('body-parser');
var app = express();


module.exports = function (port) {

    // express middlewares
    app.use(cors());

    app.get('/api', function(req, res) {
      let func = req.query.fn;
      realFunc = require("./apiFunctions/" + func + ".js")
      realFunc(req.query.params)
      .then( (result) => res.send(result) )
      .catch( (err) => console.error("salam") )
      // newProm= realFunc(req.body.params)
      // .then(function (result) {
      //   res.end(JSON.stringify(result));
      // })
      // .catch(function (err) {
      //  console.error("Interanl Server Error...", err)
      // });
    })

    app.listen(port, function () {
      console.log("listening on port: " + port);
    })
}


