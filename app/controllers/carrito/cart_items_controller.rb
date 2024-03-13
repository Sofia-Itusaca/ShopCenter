class Carrito::CartItemsController < ApplicationController
    skip_before_action :protect_pages_admin
    before_action :protect_pages_login
    def index

    end
    def show

    end
    def create
        producto = Producto.find(params[:producto_id])
        current_cart.cart_items.create(producto: producto, quantity: 1)
        redirect_to cart_path(current_cart), notice: 'Producto añadido al carrito'
    end
    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to cart_path(current_cart), notice: 'Producto eliminado del carrito'
    end

    private

    def cart_item_params
        params.require(:cart_item).permit(:producto_id, :quantity)
    end

    def current_cart
        @current_cart ||= Cart.find_by(id: session[:cart_id]) || Cart.create
        session[:cart_id] = @current_cart.id
        @current_cart
      end
    
end