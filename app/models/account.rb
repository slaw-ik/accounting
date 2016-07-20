class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, dependent: :destroy

  default_scope { order(created_at: :desc) }

  scope :filter_conditions, -> (name) { where('name LIKE ?', "%#{name}%") }

end
