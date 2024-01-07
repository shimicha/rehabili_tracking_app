class ExerciseProgressComments < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_progress_Comments do |t|
      t.text :comment
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end