class Entry < ApplicationRecord
  has_many :user_entries
  has_many :users, through: :user_entries
  has_many :events

  mount_uploader :video, VideoUploader

  validates :video, :presence => true
end
