class Transaction < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category, class_name: 'Category', foreign_key: 'category_id'

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  # after_create :self.total_amt_for_category,
  #              :self.total_amt_for_user,
  #              :self.total_amt_for_category_and_user,
  #              :self.total_amt_for_transaction_and_user

  def total_amt_for_category
    category.transactions.sum(:amount)
  end

  def total_amt_for_user
    user.transactions.sum(:amount)
  end

  def total_amt_for_category_and_user
    category.transactions.where(user_id: user_id).sum(:amount)
  end

  def total_amt_for_transaction_and_user
    user.transactions.where(id: id).sum(:amount)
  end
              
end
