io = require("socket.io").listen(3000)
io.set('log level', 3)

io.sockets.on "connection", (socket) ->
  console.log("#{socket.id} connected!")
  
  # add first notification
  setTimeout (->
    socket.emit('addNotification', {
      type: 'email'
      title: 'Email Confirmation'
      message: 'Your email address test@example.com has been added.'
      timestamp: '9:42 am'
    })
  ), 5000
  
  # add second notification
  setTimeout (->
    socket.emit('addNotification', {
      type: 'issue'
      title: 'Issue escalated'
      message: 'Issue #1234 changed from Level 1 to Level 5.'
      timestamp: '9:42 am'
    })
  ), 10000
  
  # add first application
  setTimeout (->
    socket.emit('upsertApplication', {
      id: '1'
      name: 'Software Application One'
      version: '1.0.4'
      bundle_identifier: 'com.company.application.one',
      issue_count: '23546',
      users_count: '00372'
    })
  ), 15000
  
  # add second application
  setTimeout (->
    socket.emit('upsertApplication', {
      id: '2'
      name: 'Software Application Two'
      version: '2.0.1'
      bundle_identifier: 'com.company.application.two',
      issue_count: '42781',
      users_count: '01975'
    })
  ), 20000
  
  # update the first application
  setTimeout (->
    socket.emit('upsertApplication', {
      id: '1'
      name: 'Software Application One'
      version: '1.0.4'
      bundle_identifier: 'com.company.application.one',
      issue_count: '30000',
      users_count: '00400'
    })
  ), 25000