class Finish < ApplicationRecord
  belongs_to :user
  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :group_id
  end
end
