class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :name, presence: true
  validates :critical_sum, presence: true

  default_scope { order(created_at: :desc) }

  scope :filter_conditions, -> (name) { where('name LIKE ?', "%#{name}%") }

  def recalculate_total
    if notify?
      t = Thread.new do
        if summ<= critical_sum
          AlertMailer.critical_count(user, self, count).deliver
        end
      end
      at_exit { t.join }
    end
  end

  def summ
    transactions.sum(:sum)
  end

  def critical
    summ < critical_sum
  end
end
