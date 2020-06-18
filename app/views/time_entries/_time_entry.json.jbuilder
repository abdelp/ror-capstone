json.extract! time_entry, :id, :author_id, :name, :amount, :group_id, :created_at, :updated_at
json.url time_entry_url(time_entry, format: :json)
