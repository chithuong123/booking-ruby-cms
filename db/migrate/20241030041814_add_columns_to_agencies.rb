class AddColumnsToAgencies < ActiveRecord::Migration[7.2]
  def change
    add_column :agencies, :capacity, :integer
    add_column :agencies, :lobby, :integer
  end
end
