class CommentSerializer < ActiveModel::Serializer
  attributes :comment_body, :user

  belongs_to :user
end
