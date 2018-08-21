class AddForceMoteurToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :force_moteur, :integer
  end
end
