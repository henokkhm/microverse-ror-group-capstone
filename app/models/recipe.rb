class Recipe < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :foods

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true
end
