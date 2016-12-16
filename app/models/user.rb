class User < ApplicationRecord
  has_secure_password

  validates_confirmation_of :password

  validates :name, :email, :phone, presence: true
  validates :email, :phone, uniqueness: true

  has_many :user_projects
  has_many :projects, through: :user_projects

  has_many :user_roles
  has_many :roles, through: :user_roles
end
