class Restaurant < ApplicationRecord
  CATEGORIES = ["🇨🇳", "🇮🇹", "🇯🇵", "🇫🇷", "🇧🇪"]
  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: {
      in: CATEGORIES,
      message: "%{value} is not a valid category"
    }

  has_many :reviews, dependent: :destroy
end
