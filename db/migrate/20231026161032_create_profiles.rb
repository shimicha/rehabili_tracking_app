class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.integer :age, null: false
      t.integer :gender, null: false
      t.string :icon, null: false
      t.text :history_of_present_illness, null: false
      t.text :contraindications, null: false
      t.text :medical_history, null: false
      t.text :surgery_history, null: false
      t.timestamps
    end
  end
end
