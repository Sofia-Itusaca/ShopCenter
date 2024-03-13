class Carrito::CartsController<ApplicationController
    skip_before_action :protect_pages_admin, only: [:index, :show] 

    def index
        
    end

    def show
        
    end
    def add_to_cart
        @cart = current_user.cart
        producto = Producto.find(params[:producto_id])
    
        # Aquí podrías implementar lógica para incrementar la cantidad si el producto ya está en el carrito.
        @cart.cart_items.create(producto: producto, quantity: 1)
    
        redirect_to cart_path(@cart), notice: 'Producto añadido al carrito'
    end

    def current_cart
        carts.find_by(active: true) || carts.create(active: true)
      end
end  