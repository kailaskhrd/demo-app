class Category < ApplicationRecord
  has_ancestry
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :rank, numericality: { message: "%{value} seems wrong" }
end
