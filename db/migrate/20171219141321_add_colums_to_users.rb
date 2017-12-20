class AddColumsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :intro, :string
    add_column :users, :avatar, :string
  end
end