class User < ApplicationRecord
  has_secure_password
  
  has_attached_file :avatar
  
  validates_attachment_content_type :avatar, content_type: /\Aimage/
  # Validate filename
  validates_attachment_file_name :avatar, matches: [/png\z/, /jpe?g\z/]
  # Explicitly do not validate

  validates_confirmation_of :password

  validates :name, :email, :phone, presence: true
  validates :email, :phone, uniqueness: true
  validates :api_key, uniqueness: true

  has_many :pledges
  has_many :backed_projects, through: :pledges, source: :project

  has_many :user_projects
  has_many :projects, through: :user_projects

  has_many :user_roles
  has_many :roles, through: :user_roles

  has_many :comments
  has_many :commented_projects, through: :comments, source: :project

  def registered?
    roles.exists?(name: "registered")
  end

  def admin?
    roles.exists?(name: "admin")
  end

  def backer?
    roles.exists?(name: "backer")
  end

  before_validation :generate_api_key

  def generate_api_key
    self.api_key = SecureRandom.hex
  end
end
