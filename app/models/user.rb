class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader
  
  has_many :events, dependent: :destroy
  has_many :entries
  has_many :entry_events, through: :entries, source: :event
  
  has_many :comments, dependent: :destroy
  
end
