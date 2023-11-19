class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :patient_id
      t.integer :therapist_id

      t.timestamps
    end
  end
end
