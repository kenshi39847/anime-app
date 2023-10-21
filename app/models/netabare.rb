class Netabare < ApplicationRecord
  belongs_to :user
  has_one :anime
end
