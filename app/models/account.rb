class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, dependent: :destroy

  default_scope { order(created_at: :desc) }

  scope :filter_conditions, -> (name) { where('name LIKE ?', "%#{name}%") }

  def recalculate_total
    if notify?
      t = Thread.new do
        count = transactions.sum(:sum)
        if count<= critical_sum
          AlertMailer.critical_count(user, self, count).deliver
        end
      end
      at_exit { t.join }
    end
  end
end
