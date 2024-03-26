require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_user
    @pantalones = productos(:pantalones)
    @camiseta = productos(:camiseta)
  end

  test "mostrar mis favoritos" do
    get favorites_url

    assert_response :success
  end

  test "crear un favorito" do
    assert_difference('Favorite.count', 1) do
      post favorites_url(producto_id: @pantalones.id)
    end

    assert_redirected_to producto_path(@pantalones)
  end

  test "eliminar un favorite" do
    assert_difference('Favorite.count', -1) do
      delete favorite_url(@camiseta.id)
    end

    assert_redirected_to producto_path(@camiseta)
  end
end
