class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  #devise :database_authenticatable, :authentication_keys => [:username]
  #validates :email, uniqueness: true
  #validates :username, uniqueness: true
  has_one_attached :avatar
end
