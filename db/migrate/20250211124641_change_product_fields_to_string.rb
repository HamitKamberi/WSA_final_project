class ChangeProductFieldsToString < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :category, :string
    change_column :products, :brand, :string
    change_column :products, :size, :string
    change_column :products, :color, :string
  end
end
