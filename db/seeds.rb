# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def get_chapter_index
    page_index = []
    page_index_count = 10
    page_no_list = []
    page_index_count.times do
        page_no_list.push(Faker::Number.between(1, 500))
    end
    page_no_list.sort!
    page_index_count.times do|index|
        obj = {
            id: index,
            name: Faker::Lorem.word,
            page_no: page_no_list[index]
        }
        page_index.push(obj)
    end
    return page_index
end

def seed_data
    genre_list = Book::genre_lists.invert
    genre_list_length = genre_list.length



    10.times do
        ActiveRecord::Base.transaction do
            selected_genre_list = []
            rand(1..3).times do
                selected_genre_list.push(genre_list[rand(0..genre_list_length-1)]) 
            end
            book = Book.new(
                name: Faker::Book.title,
                chapter_index: get_chapter_index(),
                short_description: Faker::Lorem.paragraph(3),
                long_description: Faker::Lorem.paragraph(10),
                published_at: Faker::Date.between(Time.now-1.year, Time.now-1.month),
                genre: selected_genre_list
            )
            book.save!
            p "Book #{book.inspect}"
            # selected_genre_list = []
            rand(1..3).times do
                author = Author.new(
                    name:Faker::Book.author,
                    author_bio:Faker::Lorem.paragraph(3),
                    academics: Faker::Lorem.paragraph(3),
                    awards: Faker::Lorem.paragraph(3),
                    book_ids:[book.id]
                )
                # byebug
                p author
                author.save
            end

            rand(0..3).times do
                Review.create(
                    reviewer_name:Faker::Name.name,  
                    rating:Faker::Number.between(1, 5),
                    title: Faker::Lorem.words(4).join(" "),
                    description: Faker::Lorem.paragraph(3),
                    book_id:book.id
                )
            end
            # p book
        end
    end
end

seed_data
# p get_chapter_index
# p "----------------------"
# puts get_chapter_index
