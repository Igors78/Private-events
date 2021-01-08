module UsersHelper
  def check_user
    if current_user?(@user)
      content_tag(:a,
                  link_to("Delete #{@user.name}", @user, method: :delete,
                                                         data: { confirm: 'You sure?' },
                                                         class: 'badge bg-secondary'))
    end
  end

  def check_access
    render inline:'
    <div class="card" style="width: 18rem;">
    <% @user.invited_to_events.each do |event| %>
    <div class="card-body">
        <h5 class="card-title"><%= event.location %></h5>
        <h6 class="card-subtitle mb-2 text-muted"><%= event.date %></h6>
        <p class="card-text"><%= event.description %></p>
        <a href="#" class="card-link"><%= link_to "Show", event %></a>
        <% if current_user?(@user) %>
        <%= link_to "Accept Invite",
                        { controller: "users", action: "accept_invite",
                        event_id: event.id },
                        class:"badge bg-secondary" %>
        <% end %>

    </div>
    <% end %>
    </div>'
  end

  def user_attend
    render inline:'
    <% @user.attended_events.each do |event| %>
      <div class="card-body">
          <h5 class="card-title"><%= event.location %></h5>
          <h6 class="card-subtitle mb-2 text-muted"><%= event.date %></h6>
          <p class="card-text"><%= event.description %></p>
          <a href="#" class="card-link"><%= link_to "Show", event %></a>
          <% if current_user?(@user) %>
          <%= link_to "Decline Invite",
                          { controller: "users", action: "decline_invite",
                          event_id: event.id },
                          class:"badge bg-secondary" %>
          <% end %>
      </div>
      <% end %>
    '
  end
end
