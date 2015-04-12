class ChangeFirstNameToNameOnStudent < ActiveRecord::Migration
  def change
    rename_column :students, :first_name, :full_name
    remove_column :students, :last_name
  end
end
