class CreateExercisePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_plans do |t|
      t.string :image
      t.text :movie_url
      t.string :training_menu
      t.text :description
      t.references :therapist_user, foreign_key: true


      t.timestamps
    end
  end
end
