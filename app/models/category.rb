class Category < ActiveRecord::Base
  belongs_to :user

  DEFAULT_CATEGORIES = %w(Salary Food Transfer Health Utilities)

  validates :name, presence: true

  scope :filter_conditions, -> (name) { where('name LIKE ?', "%#{name}%") }

  def self.populate_for_user(user)
    if user.is_a? User
      create!(DEFAULT_CATEGORIES.map { |category| {name: category, user: user} })
    end
  end
end
