class EventImage < ApplicationRecord
  belongs_to :event, optional: true
  mount_uploader :image_url, ImageUploader
end
