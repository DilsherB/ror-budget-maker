class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  has_many :transactions, dependent: :nullify, foreign_key: 'user_id', class_name: 'Transaction'

  validates :name, presence: true

  # after_create :self.total_amt_for_user

  # def self.total_amt_for_user
  #   where(user_id:).sum(:amount)
  # end
end
