class AddImagesToServices < ActiveRecord::Migration[7.2]
  def change
    add_column :services, :images, :string
  end
end
