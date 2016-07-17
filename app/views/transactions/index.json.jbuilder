json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :name, :sum, :category_id, :account_id
  json.url transaction_url(transaction, format: :json)
end
