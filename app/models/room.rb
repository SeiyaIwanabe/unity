class Room < ApplicationRecord
  has_many :messages
  has_many :deals
  has_many :users, through: :deals
end
