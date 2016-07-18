json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :name, :sum, :category_id, :account_id
  json.url account_transaction_url(@account, transaction, format: :json)
  json.created_at I18n.l(transaction.created_at, :format => :short)
end
