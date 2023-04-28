class ItemsController < ApplicationController
    def index
        render json: Item.all
    end

    def create
        items = Item.create!(permitted_attributes)
        render json: items, status: :created
    end

    def destroy
        items = Item.find(params[:id])
        items.destroy
        head :no_content
    end

    def update
        items = Item.find(params[:id])
        items.update!(update_attributes)
        render json: items, status: :ok
       
    end

    #Cart methods

    def decrement
        item = Item.find(params[:id])
        item.update!(quantity: item.quantity - params[:amount].to_i)
        render json: item
    end

    def increment 
        item = Item.find(params[:id])
        item.update!(quantity: item.quantity + params[:amount].to_i)
        render json: item
    end

    private

    def update_attributes
        params.permit(:name, :quantity, :price)
    end

    def permitted_attributes
        params.permit(:name, :quantity, :price, :store_id)
    end

end
