class RemoveAddressType < ActiveRecord::Migration[7.2]
  def change
    remove_column :addresses, :address_type
  end
end
