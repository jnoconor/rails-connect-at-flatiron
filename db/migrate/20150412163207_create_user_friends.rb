class CreateUserFriends < ActiveRecord::Migration
  def change
    create_table :user_friends do |t|
      t.references :user, index: true
      t.references :friend, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_friends, :users
    add_foreign_key :user_friends, :friends
  end
end
