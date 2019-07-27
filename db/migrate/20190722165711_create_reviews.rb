class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :reviewer_name
      t.integer :rating
      t.string :title
      t.text :description
      t.belongs_to :book, index: true
      t.timestamps
    end
  end
end
