module ApplicationHelper
  def user_image
    current_user.gravatar_url ? current_user.gravatar_url : 'default-profile.png'
  end
end
