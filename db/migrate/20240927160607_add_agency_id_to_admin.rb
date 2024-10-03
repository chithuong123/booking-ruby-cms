class AddAgencyIdToAdmin < ActiveRecord::Migration[7.2]
  def change
    add_column :administrators, :agency_id, :integer
    add_column :administrators, :role, :integer, default: 1
  end
end
