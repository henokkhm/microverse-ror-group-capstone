class Food < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :recipes

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
