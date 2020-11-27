module ApplicationHelper
  def user_image
    current_user.avatar.attached? || 'default-profile.png'
  end

  def group_icon(group)
    group.icon || 'default.png'
  rescue StandardError
    'default.png'
  end

  def format_datetime(datetime)
    datetime.strftime('%d %b %Y - %H:%M:%S')
  end
end
