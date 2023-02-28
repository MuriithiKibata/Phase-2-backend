class ItemsController < ApplicationController
    def index
        render json: Item.all
    end

    def create
        items = Items.create!(permitted_attributes)
        render json: items, status: :created
    end

    def destroy
        items = Items.find(params[:id])
        items.destroy
        head :no_content
    end

    def update
        items = Items.find(params[:id])
        items.update!(update_attributes)
        render json: items, status: :ok
    end

    private

    def update_attributes
        params.permit(:name, :quantity, :price)
    end

    def permitted_attributes
        params.permit(:name, :quantity, :price, :store_id)
    end

end
