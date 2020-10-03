class EventImage < ApplicationRecord
  belongs_to :event, optional: true
  mount_uploader :src, ImageUploader

  validates :src, presence: true
end
