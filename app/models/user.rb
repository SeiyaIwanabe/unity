class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader
  
  #イベント関連
  has_many :events, dependent: :destroy
  has_many :recruiting_events, class_name: 'Event', foreign_key: "recruiter_id"
  has_many :applicant_events, class_name: 'Event', foreign_key: "applicant_id"

  #エントリー関連
  has_many :entries, dependent: :destroy
  has_many :entry_events, through: :entries, source: :event

  
  has_many :comments, dependent: :destroy
  
end
