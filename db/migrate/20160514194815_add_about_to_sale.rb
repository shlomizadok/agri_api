class AddAboutToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :about, :string
  end
end
