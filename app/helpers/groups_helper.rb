module GroupsHelper
  def group_img(group)
    group.icon ? group.icon : 'default.png'
  end
end
