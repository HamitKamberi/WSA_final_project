class AddCategoryBrandSizeColorGenderToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :category, :integer
    add_column :products, :brand, :integer
    add_column :products, :size, :integer
    add_column :products, :color, :integer
    add_column :products, :gender, :string
  end
end
