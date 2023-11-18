class Food < ApplicationRecord
  belongs_to :user
  has_many :foods_recipes
  has_many :recipes, through: :foods_recipes

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
