class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show update destroy ]

def index
  render json: @user.carts
end


  def update
    cart.find(params[:id])
    cart.update(cart_params)
    render json: cart
  end

  def destroy
    cart.find(params[:id])
    cart.destroy
    head :no_content
  end

  def newCart
  cartItem = @user.items.find(params[:id])
  @newItem =  Cart.new({name: cartItem.name, price: cartItem.price, quantity: params[:amount], user_id: @user.id}) 
  @newItem.save
  render json: @newItem
  end

def clearCart
 Cart.where(user_id: @user.id).delete_all
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.permit(:quantity)
    end
end
