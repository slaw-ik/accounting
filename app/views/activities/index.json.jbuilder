json.array!(@activities) do |activity|
  json.extract! activity, :id, :action_type
  json.created_at I18n.l(activity.created_at, :format => :short)
end
