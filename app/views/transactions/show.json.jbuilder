json.extract! @transaction, :id, :name, :sum, :category_id, :account_id, :created_at, :updated_at
json.created_at I18n.l(@transaction.created_at, :format => :short)
