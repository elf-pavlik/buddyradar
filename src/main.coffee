window.onload = ->

  #claim :rw access to public category
  remoteStorage.claimAccess 'buddyradar', 'rw'

  remoteStorage.displayWidget 'remotestorage-connect'

  btn = Zepto('#my-current-location input[type=button]')[0]
  Zepto(btn).on 'click', (e) ->
    remoteStorage.buddyradar.setMyCurrentLocation()
    return false
