class Transaction < ActiveRecord::Base
  belongs_to :category
  belongs_to :account

  default_scope { order(created_at: :desc) }
end
