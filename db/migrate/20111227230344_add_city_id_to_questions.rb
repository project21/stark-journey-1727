class AddCityIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :city_id, :integer
  end
end
