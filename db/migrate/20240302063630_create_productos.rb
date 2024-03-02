class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :titulo
      t.text :description
      t.float :price
      t.string :color
      t.integer :stock

      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: true  # Permitir valores nulos en updated_at
    end
  end
end
