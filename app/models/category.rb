class Category < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :slug, uniqueness: true

  has_many :projects

  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end
end
