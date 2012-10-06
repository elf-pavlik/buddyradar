window.onload = ->

  #claim :rw access to public category
  remoteStorage.claimAccess 'buddyradar', 'rw'

  remoteStorage.displayWidget 'remotestorage-connect'
