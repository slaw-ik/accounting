class Transaction < ActiveRecord::Base
  belongs_to :category
  belongs_to :account

  after_save :recalculate_total

  validates :name, :sum, presence: true
  validates :sum, exclusion: {in: [0]}

  default_scope { order(created_at: :desc) }

  scope :filter_conditions, -> (name, category_id) { where('name LIKE ?', "%#{name}%").where(category_condition(category_id)) }

  private
  def self.category_condition(category_id)
    {category_id: category_id} if category_id != '0'
  end

  def recalculate_total
    account.recalculate_total
  end

end
