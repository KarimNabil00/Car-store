class AddMakeRefToCars < ActiveRecord::Migration[7.1]
  def change
    add_reference :cars, :make, null: false , foreign_key: true
  end
end
