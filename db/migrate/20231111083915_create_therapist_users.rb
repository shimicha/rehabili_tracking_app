class CreateTherapistUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :therapist_users do |t|
      t.string :name
      t.string :email,  null: false, index: { unique: true }
      t.string :password_digest
      t.string :salt

      t.timestamps      null: false
    end
  end
end
