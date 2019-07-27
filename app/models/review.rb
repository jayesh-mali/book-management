class Review < ApplicationRecord
    belongs_to :book

    include PgSearch::Model
    multisearchable against: [:reviewer_name, :title, :description]

end
