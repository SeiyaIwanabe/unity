class Event < ApplicationRecord
  has_many :event_images, dependent: :destroy
  accepts_nested_attributes_for :event_images, allow_destroy: true

  belongs_to :user

  validates :eventname, presence: true
  validates :reward, presence: true
  validates :genre, presence: true
  validates :datetime, presence: true
  validates :place, presence: true
  validates :applicants, presence: true
  validates :details, presence: true
end
