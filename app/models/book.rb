class Book < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_and_belongs_to_many :authors
    
    include PgSearch::Model
    multisearchable against: [:name, :short_description, :long_description, :chapter_index, :genre]

    enum genre_list: ["Science fiction","Satire","Drama","Action and Adventure","Romance","Mystery","Horror","Self help","Fantasy"]
end
