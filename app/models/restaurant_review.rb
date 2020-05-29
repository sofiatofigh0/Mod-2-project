class RestaurantReview < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant

    validates :title, presence: true
    validates :title, length: { in: 10..70 }
end
