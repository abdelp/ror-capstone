module TimeEntriesHelper
  def time_entry_group_img(time_entry)
    time_entry.group.icon ? time_entry.group.icon : 'default.png'
  end

  def formatted_duration(total_seconds)
    Time.at(total_seconds).utc.strftime("%H:%M:%S")
  end
end
