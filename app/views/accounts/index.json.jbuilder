json.array!(@accounts) do |account|
  json.extract! account, :id, :name, :critical_sum, :notify
  json.url account_url(account, format: :json)
end
