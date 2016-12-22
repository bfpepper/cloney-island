class UserSerializer < ActiveModel::Serializer
  attributes :name, :avatar_url

  def avatar_url
    if object.avatar_file_name.nil?
      no_image
    else
      image
    end
  end

  def image
    "https://s3-us-west-2.amazonaws.com/vicarious-cloney-bucket" + object.avatar.url(:comment)
  end

  def no_image
    "https://s3-us-west-2.amazonaws.com/vicarious-cloney-bucket/default/missing.png"
  end
end
