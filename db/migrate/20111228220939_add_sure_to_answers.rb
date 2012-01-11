class AddSureToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :sure, :boolean,:default=>false
  end
end
