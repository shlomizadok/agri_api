class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :address
      t.string :settlement
      t.text :about
      t.references :user, foreign_key: true
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
