json.array!(@activities) do |activity|
  json.extract! activity, :id
  json.created_at I18n.l(activity.created_at, :format => :short)
  json.action_type activity.read_attribute(:action_type)
end
