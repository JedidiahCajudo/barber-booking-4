class AddNameToBarbers < ActiveRecord::Migration[7.1]
  def change
    add_column :barbers, :name, :string
  end
end
