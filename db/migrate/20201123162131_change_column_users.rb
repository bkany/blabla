class ChangeColumnUsers < ActiveRecord::Migration[6.0]
  def change
  	remove_column :users, :password_digest
  	add_column :users, :encrypted_password, :string
  end
end
