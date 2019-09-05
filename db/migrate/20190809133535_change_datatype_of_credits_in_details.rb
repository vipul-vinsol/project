class ChangeDatatypeOfCreditsInDetails < ActiveRecord::Migration[5.2]
  def change
    change_column :details, :credits, :integer, null: false
  end
end
