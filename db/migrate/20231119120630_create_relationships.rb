class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :patient, foreign_key: { to_table: :users }
      t.references :therapist, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
