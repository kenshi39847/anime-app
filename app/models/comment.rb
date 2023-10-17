class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :anime

  belongs_to :parent,  class_name: "Comment", optional: true
  has_many   :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy

  validates :content, presence: true, length: { in: 1..1000 }
end
