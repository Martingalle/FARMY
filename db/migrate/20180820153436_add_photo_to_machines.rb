class AddPhotoToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :photo, :string
  end
end
