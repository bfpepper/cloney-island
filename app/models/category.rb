class Category < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :projects
end
