require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login # Inicia sesión antes de cada prueba
    @category = categories(:Clothes) # Establece una instancia de categoría para las pruebas, usando fixtures
  end

  test "debería obtener el índice" do
    get categories_url # Realiza una solicitud GET a la URL del índice de categorías
    assert_response :success # Verifica que la respuesta sea exitosa
  end

  test "debería obtener nuevo" do
    get new_category_url # Realiza una solicitud GET a la URL para crear una nueva categoría
    assert_response :success # Verifica que la página de nueva categoría se renderice correctamente
  end

  test "debería crear una categoría" do
    assert_difference("Category.count") do # Espera que la cantidad de categorías aumente en 1 después de la creación
      post categories_url, params: { category: { name: @category.name } } # Realiza una solicitud POST para crear una categoría
    end
    assert_redirected_to categories_url # Verifica que se redirija a la página de índice de categorías después de la creación
  end

  test "editar categoria" do
    get edit_category_url(@category) # Realiza una solicitud GET a la URL de edición de la categoría especificada
    assert_response :success # Verifica que la página de edición se renderice correctamente
  end

  test "actualizar categoria" do
    patch category_url(@category), params: { category: { name: @category.name } } # Realiza una solicitud PATCH para actualizar la categoría
    assert_redirected_to categories_url # Verifica que se redirija a la página de índice de categorías después de la actualización
  end

  test "eliminar categoria" do
    assert_difference("Category.count", -1) do # Espera que la cantidad de categorías disminuya en 1 después de la eliminación
      delete category_url(@category) # Realiza una solicitud DELETE para eliminar la categoría especificada
    end
    assert_redirected_to categories_url # Verifica que se redirija a la página de índice de categorías después de la eliminación
  end
end
