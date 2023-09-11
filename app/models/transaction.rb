class Transaction < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category, foreign_key: 'category_id'

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  after_create  :self.total_amt_for_category,
                :self.total_amt_for_user,
                :self.total_amt_for_category_and_user,
                :self.total_amt_for_transaction_and_user

  def self.total_amt_for_category
    where(category_id:).sum(:amount)
  end

  def self.total_amt_for_user
    where(user_id:).sum(:amount)
  end

  def self.total_amt_for_category_and_user
    where(category_id:, user_id:).sum(:amount)
  end

  def self.total_amt_for_transaction_and_user
    where(transaction_id:, user_id:).sum(:amount)
  end
end
