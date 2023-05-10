class StoresController < ApplicationController
def index  
render json: @user.stores
end

def create
 store = Store.new({name: params[:name], user_id: @user.id})
 store.save
 render json: store, status: :created
end

def show
    store = Store.find(params[:id])
    render json: store
end

def delete
    store = Store.where(user_id: @user.id).delete_all
    head :no_content
end


 private

 def permitted_attributes
    params.permit(:name, :user_id)
 end

end
