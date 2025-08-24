class AddConfirmationFieldsToOrdersAndCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :status, :string, default: 'pending'
    add_column :customers, :email_confirmed, :boolean, default: false
    add_column :customers, :confirm_token, :string
    add_index :customers, :confirm_token, unique: true
  end
end
