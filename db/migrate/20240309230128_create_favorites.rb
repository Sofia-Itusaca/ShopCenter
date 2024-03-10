class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true

      t.timestamps
    end

    #agregamos unas restricciones para que a un usuario no le guste el mismo producto varias veces
    add_index :favorites, [:user_id, :producto_id], unique: :true
  end
end
