class AddPublicToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :public, :boolean, default: false
  end
end
