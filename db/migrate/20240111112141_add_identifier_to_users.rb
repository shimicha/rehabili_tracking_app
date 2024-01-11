class AddIdentifierToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :identifier, :string
  end
end
