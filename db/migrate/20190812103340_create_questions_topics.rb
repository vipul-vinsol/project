class CreateQuestionsTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :questions_topics, id: false do |t|
      t.references :question, foreign_key: true
      t.references :topic, foreign_key: true
    end
  end
end
