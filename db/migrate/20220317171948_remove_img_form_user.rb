class RemoveImgFormUser < ActiveRecord::Migration[7.0]
  def change
       remove_column :users, :img
  end
end
