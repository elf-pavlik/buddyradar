localNpmPath = './node_modules/.bin/'

watch = require 'nodewatch'
exec = require('child_process').exec
path = require 'path'


# watch files and precompile
watch.add './src', true

watch.onChange (file, prev, curr, action) ->

    basename = path.basename(file)
    extname = path.extname(file)
    console.log basename

    if basename == 'index.jade'
      exec localNpmPath + 'jade src/index.jade -O public'
      console.log 'index.jade compiled'

    if basename == 'screen.styl'
      exec localNpmPath + 'stylus src/screen.styl -o public'
      console.log 'screen.styl compiled'

    if basename == 'buddyradar.coffee'
      exec localNpmPath + 'coffee -c -o public src/buddyradar.coffee'
      console.log 'buddyradar.coffee compiled'

    if basename == 'main.coffee'
      exec localNpmPath + 'coffee -c -o public src/main.coffee'
      console.log 'main.coffee compiled'
