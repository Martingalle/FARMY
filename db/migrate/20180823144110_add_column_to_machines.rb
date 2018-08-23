class AddColumnToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :description, :text
    add_column :machines, :min_hours, :integer
  end
end
