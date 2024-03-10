class FindProductos
attr_reader :productos
def initialize(productos = initial_scope)
    @productos = productos
  end
  def call(params = {})
    # Inicializa una variable `scoped` con todos los productos
    scoped = productos
    # Aplica el filtrado por categoría
    scoped = filter_by_category_id(scoped, params[:category_id])
    # Aplica el filtrado por precio mínimo
    scoped = filter_by_min_price(scoped, params[:min_price])
    # Aplica el filtrado por precio máximo
    scoped = filter_by_max_price(scoped, params[:max_price])
    # Aplica el filtrado por texto de búsqueda
    scoped = filter_by_query_text(scoped, params[:query_text])
    # Aplica el filtrado por favoritos
    scoped = filter_by_favorites(scoped, params[:favorites])
    # Aplica el ordenamiento
    sort(scoped, params[:order_by])
  end

  private

  def initial_scope
    Producto.with_attached_photo
  end
  def filter_by_category_id(scoped, category_id)
    return scoped unless category_id.present?
    scoped.where(category_id: category_id)
  end
  def filter_by_min_price(scoped, min_price)
    return scoped unless min_price.present?
    scoped.where("price >= ?", min_price)
  end

  def filter_by_max_price(scoped, max_price)
    return scoped unless max_price.present?
    scoped.where("price <= ?", max_price)
  end

  def filter_by_query_text(scoped, query_text)
    return scoped unless query_text.present?
    scoped.search_full_text(query_text)
  end

  def filter_by_favorites(scoped, favorites)
    return scoped unless favorites.present?
  
    if Current.user
      scoped.joins(:favorites).where({favorites: { user_id: Current.user.id }})
    else
      scoped.none
    end
  end

  def sort(scoped, order_by)
    order_by_query = Producto::ORDER_BY.fetch(order_by&.to_sym, Producto::ORDER_BY[:newest])
    scoped.order(order_by_query)
  end
end  