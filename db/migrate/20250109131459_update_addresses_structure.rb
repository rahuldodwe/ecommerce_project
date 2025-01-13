class UpdateAddressesStructure < ActiveRecord::Migration[7.2]
  def change
    # Add new address fields
    add_column :addresses, :line1, :string
    add_column :addresses, :line2, :string
    add_column :addresses, :city, :string
    add_column :addresses, :state, :string
    add_column :addresses, :postal_code, :string
    add_column :addresses, :country, :string

    # /remove new column for consolidated user address
    remove_column :addresses, :user_address, :string
  end
end
