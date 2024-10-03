class AddImagesToAgencies < ActiveRecord::Migration[7.2]
  def change
    add_column :agencies, :image, :string
  end
end
