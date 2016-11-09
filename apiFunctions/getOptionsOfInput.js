var fs = require('fs');
var path = require('path');
var when = require('when');

module.exports = function(params) {
  return when.promise( (resolve, reject) => {
    fs.readFile(path.join(__dirname, "./desc.txt"), "utf-8", (err, file) => {
      resolve(file);
    });
  })
}