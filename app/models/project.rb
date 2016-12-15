class Project < ApplicationRecord
  validates :name, uniqueness: true
  validates :slug, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true
  validates :goal, presence: true

  belongs_to :category

  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end
end
