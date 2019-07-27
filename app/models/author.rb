class Author < ApplicationRecord
    has_one_attached :profile_image
    has_and_belongs_to_many :books
    
    include PgSearch::Model
    multisearchable against: [:name, :author_bio, :academics, :awards]

end
