class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions

  default_scope { order(created_at: :desc) }

end
