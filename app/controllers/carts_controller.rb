class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show update destroy ]

  # GET /carts
  def index

    @carts = Cart.create(cart_params)
    @user.items << @carts
    render json: @carts
  end

  # GET /carts/1
  def show
    render json: @cart
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      render json: @cart, status: :created, location: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy_all
  end

  def newCart
  #  cartItems =  @user.items.map  {|item| 
  #     Cart.new({name: item.name, price: item.price, quantity: item.quantity, store_id: item.id})
  # }
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
      params.require(:cart).permit(:name, :price, :quantity, :store_id)
    end
end
