class UserSerializer < ActiveModel::Serializer
  attributes :name, :avatar_url

  def avatar_url
    object.avatar.url(:comment)
  end
end
