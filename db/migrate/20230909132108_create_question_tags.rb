class CreateQuestionTags < ActiveRecord::Migration[7.0]
  def change
    create_table :question_tags do |t|
      t.belongs_to :tag, null: false, index: true
      t.belongs_to :question, null: false, index: true

      t.timestamps
    end
  end
end
