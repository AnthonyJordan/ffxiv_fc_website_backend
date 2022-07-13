class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    acts_as_token_authenticatable

    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
    validates :email, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    has_one_attached :profile_picture
    has_many_attached :images
    has_many :comments
end
