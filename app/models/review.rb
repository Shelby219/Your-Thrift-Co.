class Review < ApplicationRecord
    belongs_to :user
    belongs_to :item
    
    validates_presence_of :rating, :comment
    validates :rating, numericality: true, numericality: {less_than_or_equal_to: 5.00}
end
