class AddAddressToBarbershops < ActiveRecord::Migration[7.1]
  def change
    add_column :barbershops, :address, :string
    add_column :barbershops, :city, :string
    add_column :barbershops, :instagram, :string
  end
end
