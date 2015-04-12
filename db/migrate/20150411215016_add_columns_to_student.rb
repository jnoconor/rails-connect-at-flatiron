class AddColumnsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :work_title, :string
    add_column :students, :personal_project, :string
    add_column :students, :profile_image, :string
    add_column :students, :quote, :string
    add_column :students, :bio, :text
    add_column :students, :education, :string
  end
end
