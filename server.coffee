# start static server on port 8080
staticSrv = require 'node-static'
file = new(staticSrv.Server)('./public', {cache: false, headers: {'Cache-Control': 'no-cache'}})
require('http').createServer (request, response) ->
  request.addListener 'end', ->
    file.serve request, response
.listen 8080
