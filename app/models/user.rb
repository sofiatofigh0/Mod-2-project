class User < ApplicationRecord
    has_many :restaurant_reviews
    has_many :restaurants, through: :restaurant_reviews
    has_many :bar_reviews
    has_many :bars, through: :bar_reviews

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :password_digest, presence: true
    validates :password_digest, length: { in: 20..60 }

    has_secure_password

end
