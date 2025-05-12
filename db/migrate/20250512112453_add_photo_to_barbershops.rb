class AddPhotoToBarbershops < ActiveRecord::Migration[7.1]
  def change
    add_column :barbershops, :photo, :string
  end
end
