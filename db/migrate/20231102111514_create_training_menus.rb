class CreateTrainingMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :training_menus do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
