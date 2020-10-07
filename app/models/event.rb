class Event < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :entries, dependent: :destroy

  def entried_by?(user)
    entries.where(user_id: user.id).exists?
  end

  validates :eventname, presence: true
  validates :reward, presence: true
  validates :genre, presence: true
  validates :datetime, presence: true
  validates :place, presence: true
  validates :applicants, presence: true
  validates :details, presence: true
  validates :images, presence: true

  validates_associated :images
end
