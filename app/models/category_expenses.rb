class CategoryExpense < ApplicationRecord
  # Validation
  validates :expense, uniqueness: { scope: :category, message: 'already exists in this category' }

  # Associations
  belongs_to :expense
  belongs_to :category
end
