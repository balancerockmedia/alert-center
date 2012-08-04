Templates = require 'templates'

class AlertCenter
  states = ['COLLAPSED', 'ALERT', 'EXPANDED']
  current_state = states[0]
  templates = Templates
  
  constructor: ->
    self = @
    
    # set the shell HTML
    html = $(templates.container_template)
    
    # append the shell HTML to the body
    $('body').append(html)
    
    # set initial state
    toCollapsed()
    
    # grabber event
    $('.grabber').on 'click', (e) ->
      switch current_state
        when states[0] then toExpanded()
        when states[1] then toExpanded()
        when states[2] then toCollapsed()
      
      return false
  
  addNotification: (json) ->
    $('.notifications').prepend(_.template(templates.notification_template, json))
    
    # close notification event
    $('.notification .close').on 'click', (e) ->
      $(e.target).parents('.notification').remove()
      
      # if we are in alert mode then redo the method to get the next new notification
      # if there aren't any new notifications it will just be collapsed
      if current_state is states[1]
        toAlert()
      
      return false
    
    toAlert()
    
  upsertApplication: (json) ->
    # if an application with this id already exists, replace it
    if $('.application[data-id="'+json.id+'"]').length > 0
      $('.application[data-id="'+json.id+'"]').replaceWith(_.template(templates.application_template, json))
    else
      $('.applications').append(_.template(templates.application_template, json))
    
    # update application count
    total_apps = $('.application').length
    $('.num_apps').text("Applications 1 to #{total_apps} of #{total_apps}")
    
  toCollapsed = ->
    current_state = states[0]
    $('.application_header_container, .application_container, .notification').hide()
    
  toAlert = ->
    current_state = states[1]
    $('.application_header_container, .application_container, .notification').hide()
    
    $('.notification:first').show()
    $('.notification:first .alert_count').text($('.notification.new').length).show()
    
  toExpanded = ->
    if $('.notification, .application').length is 0
      alert("Do something nice when there's no notifications or applications")
    else
      current_state = states[2]
      if $('.application').length is 0
        $('.notification').show()
      else
        $('.application_header_container, .application_container, .notification').show()
      $('.notification .alert_count').hide()
  
module.exports = AlertCenter