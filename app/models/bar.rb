class Bar < ApplicationRecord
    has_many :bar_reviews
    has_many :users, through: :bar_reviews
end
