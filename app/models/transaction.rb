class Expense < ApplicationRecord
  # Validations
  validates :name, presence: true, length: { minimum: 3 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Associations
  belongs_to :author, class_name: 'User'
  has_many :category_expenses, dependent: :destroy
  has_many :categories, through: :category_expenses, dependent: :destroy

  def format_date(time_with_zone)
    time_with_zone.strftime('%d %b %Y')
  end
end
