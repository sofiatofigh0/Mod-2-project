class User < ApplicationRecord
    has_many :restaurant_reviews
    has_many :restaurants, through: :restaurant_reviews
end
