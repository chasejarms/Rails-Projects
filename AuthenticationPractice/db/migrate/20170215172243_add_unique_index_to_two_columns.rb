class AddUniqueIndexToTwoColumns < ActiveRecord::Migration
  def change
    remove_index :users, :username
    add_index :users, :session_token, unique: true
  end
end
