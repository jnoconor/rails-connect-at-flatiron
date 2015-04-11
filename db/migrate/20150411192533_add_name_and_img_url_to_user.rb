class AddNameAndImgUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :img_url, :text
  end
end
