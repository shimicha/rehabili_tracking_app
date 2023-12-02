class CreateExercisePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_plans do |t|
      t.json :images
      t.text :movie_url
      t.string :training_menu
      t.text :description
      t.text :images_description
      t.references :relationship, foreign_key: true

      t.timestamps
    end
  end
end
