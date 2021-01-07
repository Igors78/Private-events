module UsersHelper
  def check_user
    #     if current_user == @event.creator
    #       content_tag(:div,
    #                   link_to('Invite People', attendances_path(event_id: @event.id),
    #                           class: 'btn btn-primary text-uppercase'))
    #     elsif @is_attendy
    #       content_tag(:div,
    #                   link_to('Withdraw', attendances_path(event_id: @event.id), method: :patch,
    #                                                                              class: 'btn btn-primary text-uppercase'))
    #     else
    #       content_tag(:div,
    #                   link_to('Join Event', attendances_path(event_id: @event.id), method: :patch,
    #                                                                                class: 'btn btn-primary text-uppercase'))
    #     end

    if current_user?(@user)
      content_tag(:a,
                  link_to("Delete #{@user.name}", @user, method: :delete,
                                                         data: { confirm: 'You sure?' },
                                                         class: 'badge bg-secondary'))
    end
  end
end
