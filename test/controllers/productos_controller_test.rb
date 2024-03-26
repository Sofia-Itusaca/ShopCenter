require "test_helper"

class ProductosControllerTest < ActionDispatch::IntegrationTest

  def setup
    login
  end
  test 'rederizar lista de productos' do
    get productos_path

    assert_response :success
    #lee la lista de productos y muestra la cantidad
    #en este caso 12, ya que por pagina muestra solo 12 a pesar de tener mas productos
    assert_select '.Producto', count: 12
  end

  test 'rederiza un formulario de nuevo producto' do
    get new_producto_path

    assert_response :success
    #que tenga una etiqueta html de tipo form
    assert_select 'form'
  end
  test 'rederizar detalles de una producto' do
    #solicitud get a la fixtures productos preguntado por el producto pantalones
    get producto_path(productos(:pantalones))
    #esperamos una repsuesta satisfacoria
    assert_response :success
    #detalles del producto
    assert_select '.title', productos(:pantalones).titulo
    assert_select '.description', "Detalles : #{productos(:pantalones).description}"
    assert_select '.price', "Precio : #{productos(:pantalones).price}"
    assert_select '.color', "Color : #{productos(:pantalones).color}"
    assert_select '.stock', "Stock : #{productos(:pantalones).stock}"
  end

  test 'renderizar el formulario de un producto' do
    get edit_producto_path(productos(:pantalones))

    assert_response :success
    assert_select 'form'
  end

  test 'actualizar producto' do
    patch producto_path(productos(:pantalones)), params: {
      producto: {
        price: 120
      }
    }

    assert_redirected_to producto_path
    assert_equal flash[:notice], 'El producto ha sido actualizado correctamente'
  end

  test 'eliminar un producto' do
    assert_difference('Producto.count', -1) do
      delete producto_path(productos(:pantalones))
    end

    assert_redirected_to productos_path
    assert_equal flash[:notice], 'Producto eliminado con èxito'
  end

end
