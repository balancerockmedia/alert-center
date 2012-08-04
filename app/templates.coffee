Templates =
  container_template: """
  <div id="alert_center">
    <div class="application_header_container">
      <div class="application_header">
          <p class="num_apps"></p>
      </div>
    </div>
        
    <div class="application_container">
      <div class="applications">
            
      </div>
    </div>
        
    <div class="notifications">
          
    </div>
        
    <img class="grabber" src="images/grabber.png" alt="" />
  </div>
  """
    
  application_template: """
    <div class="application" data-id="<%= id %>">
      <h3><strong><%= name %></strong> <%= version %></h3>
                
      <p class="bundle_identifier"><%= bundle_identifier %></p>
                
      <p class="counters"><strong class="count"><%= issue_count %></strong> Total Issues <strong class="count users_affected"><%= users_count %></strong> Users Affected</p>
    </div>
  """
    
  notification_template: """
    <div class="notification new">
      <div class="notification_inner <%= type %> clearfix">
        <p class="message"><strong><%= title %>:</strong> <%= message %></p>
        
        <ul class="actions">
          <li class="date"><strong><%= timestamp %></strong></li>
          <li class="alert_count">1</li>
          <li class="close"><a href="#">close</a></li>
        </ul>
      </div>
    </div>
  """

module.exports = Templates