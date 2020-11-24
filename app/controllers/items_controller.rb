class ItemsController < ApplicationController
    def show
        @item = Item.find(params[:id])
        @category = Category.find(@item.category_id).name
    end
end
