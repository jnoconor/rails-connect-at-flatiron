class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :provider
      t.string :username

      t.timestamps null: false
    end
  end
end
