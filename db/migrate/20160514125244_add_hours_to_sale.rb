class AddHoursToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :hours, :string
  end
end
