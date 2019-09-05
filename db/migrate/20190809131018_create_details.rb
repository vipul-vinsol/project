class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.decimal :credits

      t.timestamps
    end
  end
end
