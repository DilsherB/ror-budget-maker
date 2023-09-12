class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  has_many :transactions, dependent: :nullify, foreign_key: 'author_id'

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :confirm_password, presence: true, confirmation: true

  # after_create :self.total_amt_for_user

  def self.total_amt_for_user
    where(user_id:).sum(:amount)
  end
end
