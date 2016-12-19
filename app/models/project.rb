class Project < ApplicationRecord
  validates :title,
            :description,
            :goal,
            :category_id, presence: true

  validates :title,
             :slug, uniqueness: true

  has_many :pledges
  has_many :backers, through: :pledges, source: :user

  has_many :user_projects
  has_many :users, through: :user_projects

  has_many :comments
  has_many :commenters, through: :comments, source: :user

  belongs_to :category

  def funding_received
    pledges.empty? ? 0 : ((pledges.sum(:amount_given) / goal.to_f) * 100).round
  end
end
