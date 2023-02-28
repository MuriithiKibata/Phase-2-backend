class StoresController < ApplicationController
def index  
render json: Store.all
end

def create
 store = Store.create!(permitted_attributes)
 render json: store, status: :created
end

def show
    store = Store.find(params[:id])
    render json: store
end

def destroy
    store = Store.find(params[:id])
    store.destroy
    head :no_content
end


 private

 def permitted_attributes
    params.permit(:name, :user_id)
 end

end
