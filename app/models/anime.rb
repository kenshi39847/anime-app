class Anime < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :synopsis, presence: true
  validates :genre_id, presence: true
  validates :good_point_id, presence: true
  validates :recommendation_id, presence: true
  validates :text, presence: true
end
