class AddAccessTokenToAdminUser < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :access_token, :string
  end
end
