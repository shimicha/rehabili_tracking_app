class CreateExerciseProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_progresses do |t|
      t.date :date, null: false
      t.text :progresse_keep, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
