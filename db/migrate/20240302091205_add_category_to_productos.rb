class AddCategoryToProductos < ActiveRecord::Migration[7.0]
  def change
    add_reference :productos, :category, null: false, foreign_key: true
  end
end
