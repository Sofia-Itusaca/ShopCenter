require "test_helper"

class TallasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @talla = tallas(:one)
  end

  test "should get index" do
    get tallas_url
    assert_response :success
  end

  test "should get new" do
    get new_talla_url
    assert_response :success
  end

  test "should create talla" do
    assert_difference("Talla.count") do
      post tallas_url, params: { talla: { name: @talla.name } }
    end

    assert_redirected_to talla_url(Talla.last)
  end

  test "should show talla" do
    get talla_url(@talla)
    assert_response :success
  end

  test "should get edit" do
    get edit_talla_url(@talla)
    assert_response :success
  end

  test "should update talla" do
    patch talla_url(@talla), params: { talla: { name: @talla.name } }
    assert_redirected_to talla_url(@talla)
  end

  test "should destroy talla" do
    assert_difference("Talla.count", -1) do
      delete talla_url(@talla)
    end

    assert_redirected_to tallas_url
  end
end
