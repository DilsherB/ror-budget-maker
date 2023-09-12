class Category < ApplicationRecord
  has_many :transactions, class_name: 'Transaction', dependent: :nullify, foreign_key: 'category_id'

  validates :name, presence: true

  after_create :self.total_amt_for_category,
               :self.total_amt_for_user,
               :self.total_amt_for_category_and_user

  def total_amt_for_category
    transactions.sum(:amount)
  end

  def total_amt_for_user(user)
    where(user_id:).sum(:amount)
  end

  def self.total_amt_for_all_categories
    all_categories = Category.includes(:transactions)
    all_categories.map { |category| [category.name, category.transactions.sum(:amount)] }.to_h
  end

  def total_amt_for_category_and_user(user, category)
    transactions.where(user_id:, category_id:).sum(:amount)
  end
end
