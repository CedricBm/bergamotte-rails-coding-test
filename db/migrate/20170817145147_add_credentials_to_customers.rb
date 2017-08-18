class AddCredentialsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :login, :string
    add_column :customers, :password, :string
  end
end
