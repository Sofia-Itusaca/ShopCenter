require "application_system_test_case"

class TallasTest < ApplicationSystemTestCase
  setup do
    @talla = tallas(:one)
  end

  test "visiting the index" do
    visit tallas_url
    assert_selector "h1", text: "Tallas"
  end

  test "should create talla" do
    visit tallas_url
    click_on "New talla"

    fill_in "Name", with: @talla.name
    click_on "Create Talla"

    assert_text "Talla was successfully created"
    click_on "Back"
  end

  test "should update Talla" do
    visit talla_url(@talla)
    click_on "Edit this talla", match: :first

    fill_in "Name", with: @talla.name
    click_on "Update Talla"

    assert_text "Talla was successfully updated"
    click_on "Back"
  end

  test "should destroy Talla" do
    visit talla_url(@talla)
    click_on "Destroy this talla", match: :first

    assert_text "Talla was successfully destroyed"
  end
end
