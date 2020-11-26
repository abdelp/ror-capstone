module FeatureHelpers
  def logged_as(user)
    # Devise v4.x.x
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user))
  end
end