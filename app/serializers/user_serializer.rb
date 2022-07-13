class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :role, :house_loc, :bio, :authentication_token

  def profile_picture_url
    return rails_blob_path(object.profile_picture, only_path: true) if object.profile_picture.attatched?
  end
end
