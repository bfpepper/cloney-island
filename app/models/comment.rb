class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :comment_body, presence: true
end
