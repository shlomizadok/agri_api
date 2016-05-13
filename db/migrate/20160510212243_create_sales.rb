class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.datetime :start_at
      t.boolean :organic
      t.boolean :active
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
