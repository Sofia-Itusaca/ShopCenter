class AddCantidadToCarritos < ActiveRecord::Migration[7.0]
  def change
    add_column :carritos, :cantidad, :integer
  end
end
