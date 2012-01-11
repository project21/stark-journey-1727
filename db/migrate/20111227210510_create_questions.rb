class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.boolean :how_much
      t.boolean :where
      t.text :additional_details

      t.timestamps
    end
  end
end
