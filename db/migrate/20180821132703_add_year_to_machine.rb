class AddYearToMachine < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :year, :integer
  end
end
