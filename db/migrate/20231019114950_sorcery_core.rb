class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email,            null: false, index: { unique: true }
      t.string :password_digest
      t.string :salt
      t.string :name
      t.timestamps                null: false
    end
  end
end
