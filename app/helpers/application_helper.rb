module ApplicationHelper
  def user_image
    current_user.gravatar_url ? current_user.gravatar_url : 'default-profile.png'
  end

  def group_img(group)
    group.icon ? group.icon : 'default.png'
  end

  def formatted_duration(total_seconds)
    Time.at(total_seconds).utc.strftime("%H:%M:%S")
  end
end
