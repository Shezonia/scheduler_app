<h1><%= @event.title %></h1>

<p>
  <strong>Scheduled at:</strong> <%= @event.scheduled_at.strftime("%B %d, %Y %I:%M %p") %><br>
  <strong>Reminder will go to:</strong> <%= @event.user_email %>
</p>

<%= link_to "Create another event", new_event_path %>
