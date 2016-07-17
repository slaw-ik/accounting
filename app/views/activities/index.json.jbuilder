json.array!(@activities) do |activity|
  json.extract! activity, :id, :action_type, :user_id
  json.url activity_url(activity, format: :json)
end
