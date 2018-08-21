class AddCategoryToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :category, :string
  end
end
