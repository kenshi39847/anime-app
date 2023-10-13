class Anime < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :good_point
  belongs_to :recommendation

  validates :title, presence: true
  validates :synopsis, presence: true
  validates :text, presence: true

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :genre_id
    validates :good_point_id
    validates :recommendation_id
  end
end
