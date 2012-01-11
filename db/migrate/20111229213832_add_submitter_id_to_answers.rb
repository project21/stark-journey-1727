class AddSubmitterIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :submitter_id, :integer
  end
end
