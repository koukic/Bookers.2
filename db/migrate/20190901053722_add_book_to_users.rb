class AddBookToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :book, index:true, foreign_key: true
  end
end
