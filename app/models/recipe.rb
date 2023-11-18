class Recipe < ApplicationRecord
  belongs_to :user
  has_many :foods_recipes
  has_many :foods, through: :foods_recipes

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true
end
