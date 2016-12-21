class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :amount_given, presence: true
  validates :user, presence: true
  validates :project, presence: true
end
