json.extract! @account, :id, :name, :critical_sum, :notify
json.created_at I18n.l(@account.created_at, :format => :short)

