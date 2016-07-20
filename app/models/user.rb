class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :session_limitable

  has_many :activities, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :accounts, dependent: :destroy

  after_create :populate_categories

  private

  def populate_categories
    Category.populate_for_user(self)
  end

end
