class AddFieldToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string
    add_column :users, :phone, :integer
    add_column :users, :img, :string
    add_column :users, :address, :text
  end
end
