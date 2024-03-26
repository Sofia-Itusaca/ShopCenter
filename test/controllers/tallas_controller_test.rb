require "test_helper"

class TallasControllerTest < ActionDispatch::IntegrationTest
  setup do
    login # Suponiendo que tienes un método llamado login para iniciar sesión en tus pruebas
    @talla = tallas(:None) 
  end

  test "debería obtener el índice" do
    get tallas_url
    assert_response :success
  end

  test "debería obtener nuevo" do
    get new_talla_url
    assert_response :success
  end

  test "debería crear una talla" do
    assert_difference("Talla.count") do
      post tallas_url, params: { talla: { name: @talla.name } }
    end

    assert_redirected_to tallas_url
  end

  test "editar talla" do
    get edit_talla_url(@talla)
    assert_response :success
  end

  test "actualizar talla" do
    patch talla_url(@talla), params: { talla: { name: @talla.name } }
    assert_redirected_to tallas_url
  end

  test "eliminar talla" do
    assert_difference("Talla.count", -1) do
      delete talla_url(@talla)
    end

    assert_redirected_to tallas_url
  end


end
