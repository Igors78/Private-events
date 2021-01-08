module ApplicationHelper
  def logged_links
    render inline: '
    <% if logged_in? %>
        <li class="nav-item">
            <%= link_to "Users", users_path, class: "nav-link" %>
        </li>
        <li><%= link_to "New Event", new_event_path, class: "nav-link" %></li>
    <% end %>
'
  end

  def nav_links
    render inline: '
    <% if logged_in? %>

        <li><%= link_to current_user.name, user_path(current_user), class: "mx-2 text-white" %></li>
        <li><%= link_to "Log out", logout_path, class: "mx-2 text-white", method: :delete %></li>

    <% else %>

        <li><%= link_to "Log in", login_path, class: "mx-2 text-white" %></li>
        <li><%= link_to "Sign up", signup_path, class: "mx-2 text-white" %></li>

    <% end %>
    '
  end
end
