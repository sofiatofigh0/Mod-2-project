class BarReview < ApplicationRecord
    belongs_to :user
    belongs_to :bar

    validates :title, presence: true
    validates :title, length: { in: 10..70 }
end
