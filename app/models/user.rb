class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :session_limitable

  has_many :activities
  has_many :categories
  has_many :accounts

end
