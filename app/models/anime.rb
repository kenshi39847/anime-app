class Anime < ApplicationRecord
  belongs_to :user
  has_many :comments
  belongs_to :netabare
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :good_point
  belongs_to :recommendation

  validates :title, presence: true
  validates :synopsis, presence: true
  validates :text, presence: true
  validates :image, presence: true

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :genre_id
    validates :good_point_id
    validates :recommendation_id
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title", "genre_id", "good_point_id", "recommendation_id"]
  end
end
