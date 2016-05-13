class AddPhoneToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :phone, :string
  end
end
