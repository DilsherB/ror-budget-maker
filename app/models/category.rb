class Category < ApplicationRecord
  has_many :transactions, dependent: :nullify, foreign_key: 'transaction_id'

  validates :name, presence: true

  after_create :self.total_amt_for_category,
               :self.total_amt_for_user,
               :self.total_amt_for_category_and_user

  def self.total_amt_for_category
    where(category_id:).sum(:amount)
  end

  def self.total_amt_for_user
    where(user_id:).sum(:amount)
  end

  def self.total_amt_for_category_and_user
    where(category_id:, user_id:).sum(:amount)
  end
end
