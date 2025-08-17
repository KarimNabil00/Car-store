class AddCityToCustomer < ActiveRecord::Migration[7.1]
  def change
    add_reference :customers, :city, null: false, foreign_key: true
  end
end
