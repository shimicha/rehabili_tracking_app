class ExerciseProgressComments < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_progress_comments do |t|
      t.text :comment
      t.references :user, foreign_key: true
      t.references :exercise_progress, foreign_key: true
      t.timestamps
    end
  end
end