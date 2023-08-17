class Bar < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }

  belongs_to :user

  has_many :images
  has_many :orders
  has_many :bar_categories
  has_many :categories, through: :bar_categories

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def delivered_total
    price + 50
  end
end
