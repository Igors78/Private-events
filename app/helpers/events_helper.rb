module EventsHelper
  def rsvp_user
    render inline:'
    <% if @event.invited_users.any? %>
        <strong>Users invited:</strong> <br>
        <% @event.invited_users.each do |user| %>
        <%= user.name %>
        <% end %>
    <% end %>
'
  end
end
