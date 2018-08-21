class AddPricePerHourToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :price_per_hour, :integer
  end
end
