class ChangeDefaultsInUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :type, :boolean, default: "normal", null: false
    change_column :users, :active, :boolean, default: false, null: false
  end
end
