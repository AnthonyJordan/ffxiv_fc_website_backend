class User < ApplicationRecord
    has_one_attached :profile_picture
    has_many_attached :images
    has_many :comments
end
