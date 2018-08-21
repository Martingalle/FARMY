class AddRouesMotricesToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :roues_motrices, :integer
  end
end
