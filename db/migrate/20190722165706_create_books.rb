class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, index: true
      t.text :short_description
      t.text :long_description
      t.json :chapter_index, array: true, default: []
      t.datetime :published_at
      t.string :genre, array: true, default: []
      t.timestamps
    end
  end
end
