class RemoveTotalPriceFromCarts < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :total_price, :decimal
  end
end
