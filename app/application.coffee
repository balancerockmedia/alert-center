AlertCenter = require 'lib/alert_center'

Application =
  initialize: ->
    self = @
    
    @alert_center = new AlertCenter()
    
    try
      socket = io.connect('http://localhost:3000')
    
      socket.on 'addNotification', (data) ->
        self.alert_center.addNotification(data)
      
      socket.on 'upsertApplication', (data) ->
        self.alert_center.upsertApplication(data)
    catch error
      console.log "Socket Error: #{error}"
    
module.exports = Application