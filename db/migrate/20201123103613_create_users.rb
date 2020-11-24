class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string   :first_name
      t.string   :last_name
      t.string 	 :email, null: false, default: ""
      t.string 	 :encrypted_password, null: false, default: ""
      t.boolean  :is_admin
      t.string   :avatar
      t.string   :remember_digest

      t.timestamps
    end
  end
end
