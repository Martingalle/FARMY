class AddCoordinatesToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :latitude, :float
    add_column :machines, :longitude, :float
  end
end
