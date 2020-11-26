class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to  :user
      t.integer     :status
      t.decimal     :total_price

      t.timestamps
    end
  end
end
