class Restaurant < ApplicationRecord
    has_many :restaurant_reviews
    has_many :users, through: :restaurant_reviews
end
