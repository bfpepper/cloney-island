class Project < ApplicationRecord
  validates :title,
            :description,
            :goal,
            :category_id, presence: true

  validates :title,
             :slug, uniqueness: true

  belongs_to :category

  before_validation :generate_slug

  def generate_slug
    self.slug = title.parameterize
  end

end
