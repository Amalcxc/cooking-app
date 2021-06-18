class User < ApplicationRecord
  validates :username, :name, presence: true
  validates :username, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ideas
  has_many :followers, foreign_key: 'followed_id', class_name: 'Relationship'
  has_many :following, foreign_key: 'follower_id', class_name: 'Relationship'
end
