class AddTallaToProductos < ActiveRecord::Migration[7.0]
  def change
    add_reference :productos, :talla, null: false, foreign_key: true
  end
end
