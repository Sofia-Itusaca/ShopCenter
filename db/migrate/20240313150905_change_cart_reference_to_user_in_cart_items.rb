class ChangeCartReferenceToUserInCartItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :cart_items, :cart_id, :user_id
    remove_foreign_key :cart_items, :carts
    add_foreign_key :cart_items, :users
  end
end
