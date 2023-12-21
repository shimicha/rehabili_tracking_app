class CreateExerciseProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_progresses do |t|
      t.date :date
      t.datetime :today_at
      t.text :progresse_keep
      t.references :user, foreign_key: true
      t.timestamps

      t.timestamps
    end
  end
end
