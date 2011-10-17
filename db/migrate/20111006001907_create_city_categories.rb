class CreateCityCategories < ActiveRecord::Migration
  def change
    create_table :city_categories do |t|
      t.integer :city_id
      t.integer :category_id

      t.timestamps
    end
  end
end
