class AddUrlToCohort < ActiveRecord::Migration
  def change
    add_column :cohorts, :url, :text
  end
end
