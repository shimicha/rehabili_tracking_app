class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :age
      t.integer :gender
      t.string :icon
      t.text :history_of_present_illness
      t.text :contraindications
      t.text :medical_history
      t.text :surgery_history
      t.timestamps
    end
  end
end
