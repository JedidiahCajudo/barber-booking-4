class CreateBarbershops < ActiveRecord::Migration[7.1]
  def change
    create_table :barbershops do |t|
      t.string :name
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
