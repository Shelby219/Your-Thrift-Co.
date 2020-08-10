class Category < ApplicationRecord
    include PgSearch::Model
    multisearchable against: :name

    has_many :items
end
