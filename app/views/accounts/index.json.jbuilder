json.array!(@accounts) do |account|
  json.extract! account, :id, :name, :critical_sum, :notify, :summ, :critical
  json.created_at I18n.l(account.created_at, :format => :short)
end
