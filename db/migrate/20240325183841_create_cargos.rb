class CreateCargos < ActiveRecord::Migration[7.0]
  def change
    create_table :cargos do |t|
      t.string :uid, limit: 50
      t.integer :estado, default: 0
      t.integer :metodo_pago, default: 0
      t.decimal :monto, default: 0
      t.text :mensaje_error
      t.jsonb :datos_respuesta

      t.timestamps
    end
  end
end
