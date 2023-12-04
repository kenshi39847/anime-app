class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :animes
  has_many :comments
  has_many :netabares
  has_one :profile
  has_many :finishes

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  validates :name, presence: true

  def followed_by?(user)
    follower =  passive_relationships.find_by(following_id: user.id)
    return follower.present?
  end
end
