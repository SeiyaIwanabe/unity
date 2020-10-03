class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  #バリデーション
  validates :content, presence: true
end
