class Board < ApplicationRecord
  validates :content, presence: true, length: { in: 1..140 }

  belongs_to :user
  has_many :favorite_users, through: :favorites, source: :user
end
