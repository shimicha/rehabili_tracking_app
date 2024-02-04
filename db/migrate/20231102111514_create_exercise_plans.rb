class CreateExercisePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_plans do |t|
      t.json :images
      t.text :movie_url
      t.string :training_menu, null: false
      t.text :description, null: false
      t.text :images_description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
