class CommentSerializer < ActiveModel::Serializer
  attributes :comment_body, :user, :created_at

  belongs_to :user
end
