module EventsHelper
  def rsvp_user
    render inline: '
    <% if @event.invited_users.any? %>
        <strong>Users invited:</strong> <br>
        <% @event.invited_users.each do |user| %>
        <%= user.name %>
        <% end %>
        <br>
    <% end %>'
  end

  def rsvp_attendee
    render inline: '
    <% if @event.attendees.any? %>
        <strong>Will attend:</strong> <br>
        <% @event.attendees.each do |user| %>
        <%= user.name %>
        <% end %>
    <% end %>'
  end

  def handling_links
    render inline: '
    <% if current_user?(@event.creator) %>
      <%= link_to "Delete", @event, method: :delete,
                                data: { confirm: "You sure?" },
                                class: "badge bg-warning" %>
      <%= link_to "Edit", edit_event_path(@event), class: "badge bg-warning" %>
      <% end %>
      <%= link_to "Back", events_path, class: "badge bg-warning" %>
    '
  end

  def user_links
    render inline: '
    <%  @users.each do |user|%>
      <li><%= link_to user.name, user %>

          <% if current_user?(@event.creator) && user != current_user %>
          <%if @event.invited_users.include?(user) %>
          <%= link_to "Dismiss",
                          { controller: "events", action: "dismiss_user",
                          user_id: user.id },
                          class:"badge bg-danger" %>
          <% elsif @event.attendees.include?(user)%>
          <%= link_to "Dismiss invite",
                          { controller: "users", action: "dismiss_invite",
                          user_id: user.id },
                          class:"badge bg-danger" %>
          <%else%>
          <%= link_to "Invite",
                          { controller: "events", action: "invite_user",
                          user_id: user.id },
                          class:"badge bg-secondary" %>
          <%end%>
          <% end %></li>
      <% end %>
    '
  end
end
