class AddDescriptionToCategories < ActiveRecord::Migration[7.2]
  def change
    add_column :categories, :description, :text
  end
end
