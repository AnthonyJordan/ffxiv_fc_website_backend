class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :role, :house_loc, :bio, :authentication_token
end
