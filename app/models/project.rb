class Project < ApplicationRecord
  
  has_attached_file :banner_image,
                    :styles => {
                                 card: '320x150>',
                                 small: '640x300>',
                                 hero: '1280x600>'
                                }

  validates_attachment_content_type :banner_image, :content_type => /\Aimage\/.*\Z/

  validates_attachment_content_type :banner_image, content_type: /\Aimage/

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
