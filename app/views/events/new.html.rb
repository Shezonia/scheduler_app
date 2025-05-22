<h1>New Event</h1>

<%= form_with model: @event do |f| %>
  <p>
    <%= f.label :title %><br>
    <%= f.text_field :title %>
  </p>

  <p>
    <%= f.label :scheduled_at, "When should we remind you?" %><br>
    <%= f.datetime_select :scheduled_at %>
  </p>

  <p>
    <%= f.label :user_email %><br>
    <%= f.email_field :user_email %>
  </p>

  <%= f.submit "Create Event" %>
<% end %>
