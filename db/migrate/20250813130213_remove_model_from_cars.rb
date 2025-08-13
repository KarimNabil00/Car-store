class RemoveModelFromCars < ActiveRecord::Migration[7.1]
  def change
    remove_column :cars, :model, :string
  end
end
