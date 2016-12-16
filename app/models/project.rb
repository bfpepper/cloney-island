class Project < ApplicationRecord
  validates :title,
            :description,
            :goal,
            :category_id, presence: true

  validates :title,
             :slug, uniqueness: true

  belongs_to :category
end
