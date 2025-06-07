class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :weight, :integer
    add_column :users, :weight_unit, :string
    add_column :users, :height, :integer
    add_column :users, :height_unit, :string
  end
end
