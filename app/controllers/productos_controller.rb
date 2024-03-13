class ProductosController < ApplicationController
  skip_before_action :protect_pages_admin, only: [:index, :show]

  def index
    @categories = Category.order(name: :asc).load_async
    @pagy, @productos = pagy_countless(FindProductos.new.call(producto_prams_index), items: 12)
    #@pagy, @productos = pagy(FindProductos.new.call(producto_prams_index), items: 12)

  end

  def new
    authorize!
    @producto = Producto.new
    @tallas = Talla.all.order(name: :asc)
  end

  def create
    authorize!
    @producto = Producto.new(producto_params)

    if @producto.save
      redirect_to productos_path, notice: "El producto ha sido creado correctamente"
    else
      render :new, status: :unprocessable_entity, alert: "El producto no ha sido creado correctamente"
    end
  end

  def show
    producto
  end

  def edit
    authorize!
    @producto = Producto.find(params[:id])
  end

  def update
    @producto = Producto.find(params[:id])
    if @producto.update(producto_params)
      redirect_to producto_path(@producto), notice: "El producto ha sido actualizado correctamente"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @producto = Producto.find(params[:id])
    if @producto
      @producto.destroy
      redirect_to productos_path, notice: "Producto eliminado con èxito", status: :see_other
    else
      redirect_to productos_path, alert: "El producto no existe"
    end
  end

  def add_to_cart
    if current_user
      product = Producto.find(params[:id])
      current_user.cart_items.create(producto: producto, quantity: 1)
      redirect_to productos_path, notice: 'Producto añadido al carrito'
    else
      redirect_to login_path, alert: 'Debes iniciar sesión para añadir productos al carrito'
    end
  end


  private

  def producto_params
    params.require(:producto).permit(:titulo, :description, :price, :color, :stock, :category_id, :talla_id, :photo)
  end

  def producto_prams_index
    params.permit(:category_id, :min_price, :max_price, :query_text, :order_by, :page, :favorites)
  end

  def producto
    @producto =  Producto.find(params[:id])
    #return @product
  end
end
