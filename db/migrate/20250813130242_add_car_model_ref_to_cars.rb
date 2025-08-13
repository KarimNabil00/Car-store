class AddCarModelRefToCars < ActiveRecord::Migration[7.1]
  def change
    add_reference :cars, :car_model, null: false, foreign_key: true
  end
end
