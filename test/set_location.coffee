zombie = require 'zombie'
assert = require 'assert'
sinon = require 'sinon'

describe 'Setting my current location', ->

  describe 'UI', ->
    before (done) ->
      @browser = new zombie.Browser({debug: true})
      @browser.visit 'http://localhost:8080', done

    it 'has form', ->
      assert.ok @browser.query("form#my-current-location")

    it 'has input for locality name', ->
      assert.ok @browser.query("#my-current-location input[name=locality]")

    it 'has inputs for lon/lng', ->
      assert.ok @browser.query("#my-current-location input[name=lng]")
      assert.ok @browser.query("#my-current-location input[name=lat]")

    it 'has save button to set location', ->
      assert.ok @browser.query("#my-current-location input[type=button]")
      assert.ok @browser.query("#my-current-location input[value=save]")

  describe 'Save', ->
    before (done) ->
      @browser = new zombie.Browser({debug: true})
      @browser.visit('http://localhost:8080')
        .then =>
          @stub = @browser.evaluate("sinon.stub(remoteStorage.buddyradar, 'setMyCurrentLocation')")
        .then =>
          @browser
            .fill('locality', 'Berlin')
            .fill('lng', '29')
            .fill('lat', '40')
            .pressButton 'save'
        .then(done, done)

    it 'should call setMyCurrentLocatoin from buddyradar module', ->
      sinon.assert.calledOnce @stub
