class CreateJoinTableAuthorBook < ActiveRecord::Migration[5.2]
  def change
    create_join_table :authors, :books, id: false do |t|
      t.index [:author_id, :book_id]
    end
  end
end
