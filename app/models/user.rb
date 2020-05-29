class User < ApplicationRecord
    has_many :restaurant_reviews
    has_many :restaurants, through: :restaurant_reviews
    has_many :bar_reviews
    has_many :bars, through: :bar_reviews

    has_secure_password

end
