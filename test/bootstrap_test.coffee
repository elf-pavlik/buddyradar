vows = require 'vows'
zombie = require 'zombie'
assert = require 'assert'

vows
  .describe('bootstrap')
  .addBatch
    'common':
      topic: ->
        browser = new zombie.Browser({debug: true})
        browser.visit 'http://localhost:8080', @callback

      'widget container exists': (browser) ->
        assert.ok browser.query("#remotestorage-connect")

      'cube shows': (browser) ->
        assert.ok browser.query("#remotestorage-cube")

.export(module)
