class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :location
      t.string :pricing
      t.text :answer_details

      t.timestamps
    end
  end
end
