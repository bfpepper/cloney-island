class Project < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :goal, presence: true
  validates :name, uniqueness: true
  validates :slug, uniqueness: true
end
