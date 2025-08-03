class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.decimal :price
      t.string :color
      t.text :description
      t.boolean :available

      t.timestamps
    end
  end
end
