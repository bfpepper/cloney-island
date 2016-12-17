class Project < ApplicationRecord
  validates :title,
            :description,
            :goal,
            :category_id, presence: true

  belongs_to :category

  has_many :user_projects
  has_many :users, through: :user_projects

  validates :title,
             :slug, uniqueness: true

  belongs_to :category

  has_many :pledges
  has_many :users, through: :pledges

  def funding_received

  end
end
