# BuddyRadar module definition
#
moduleName = "buddyradar"

remoteStorage.defineModule moduleName, (privateClient, publicClient) ->

  return {
    exports:
      setMyCurrentLocation: (localityName, lng, lat) ->

  }
