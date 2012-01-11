class AddItemToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :item, :string
  end
end
